/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.kayura.core.PostAction;
import org.kayura.core.PostResult;
import org.kayura.security.LoginUser;
import org.kayura.tags.easyui.types.EuTreeNode;
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.uasp.po.DictDefine;
import org.kayura.uasp.po.DictItem;
import org.kayura.uasp.po.User;
import org.kayura.uasp.security.Privilege;
import org.kayura.uasp.security.PrivilegeMods;
import org.kayura.uasp.service.DictService;
import org.kayura.uasp.service.UserService;
import org.kayura.utils.KeyUtils;
import org.kayura.utils.StringUtils;
import org.kayura.web.controllers.UaspController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author liangxia@live.com
 */
@SuppressWarnings("deprecation")
@Controller
@RequestMapping("/admin")
public class AdminController extends UaspController {

	@Autowired
	private UserService writerUserService;

	@Autowired
	private UserService readerUserService;

	@Autowired
	private DictService writerDictService;

	@Autowired
	private DictService readerDictService;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping(value = "user/list", method = RequestMethod.GET)
	@Privilege(PrivilegeMods.User_View)
	public String userList() {

		return "views/admin/user-list";
	}

	@RequestMapping(value = "user/find", method = RequestMethod.POST)
	@Privilege(PrivilegeMods.User_View)
	public void userFind(HttpServletRequest req, Map<String, Object> map, String keyword, String status) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				PageParams pageParams = ui.getPageParams(req);

				String tenantId = getLoginUser().getTenantId();
				Integer[] intStatus = StringUtils.toInteger(status);

				Result<PageList<User>> r = readerUserService.findUsers(tenantId, keyword, intStatus, pageParams);
				ps.setCode(r.getCode());
				if (r.isSucceed()) {
					PageList<User> users = r.getData();
					users.forEach(s -> s.setPassword(null));
					users.forEach(s -> s.setSalt(null));
					ps.setData(ui.putData(users));
				} else {
					ps.addMessage(r.getMessage());
				}
			}
		});
	}

	@RequestMapping(value = "user/new", method = RequestMethod.GET)
	public String userNew(HttpServletRequest req, Map<String, Object> map, String id) {

		User user = new User();
		user.setRoles("USER");
		user.setIsEnabled(true);
		user.setIsLocked(false);
		map.put("model", user);

		return "views/admin/user-edit";
	}

	@RequestMapping(value = "user/edit", method = RequestMethod.GET)
	public String userEdit(HttpServletRequest req, Map<String, Object> map, String id) {

		User user = readerUserService.getUserById(id);
		user.setPassword("");
		map.put("model", user);

		return "views/admin/user-edit";
	}

	@RequestMapping(value = "user/save", method = RequestMethod.POST)
	public void userSave(Map<String, Object> map, User user) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				if (StringUtils.isEmpty(user.getUserId())) {

					String tenantId = getLoginUser().getTenantId();
					String salt = KeyUtils.random();
					String hash = passwordEncoder.encodePassword(user.getPassword(), salt);

					user.setUserId(KeyUtils.newId());
					user.setTenantId(tenantId);
					user.setSalt(salt);
					user.setPassword(hash);

					GeneralResult result = writerUserService.createNewUser(user);
					ps.setResult(result);
				} else {

					GeneralResult result = writerUserService.updateUserInfo(user);
					ps.setResult(result);
				}
			}
		});
	}

	/**
	 * 数据词典管理浏览页.
	 */
	@RequestMapping(value = "/dict/list", method = RequestMethod.GET)
	public ModelAndView dictList() {

		ModelAndView mv = this.view("views/admin/dict-list");
		mv.addObject("ISROOT", this.getLoginUser().hasRoot());

		return mv;
	}

	@RequestMapping(value = "/dict/define", method = RequestMethod.POST)
	public void loadDicts(Map<String, Object> map) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				List<EuTreeNode> nodes = new ArrayList<EuTreeNode>();

				Result<List<DictDefine>> r = readerDictService.loadDictDefinces();
				if (r.isSucceed()) {
					List<DictDefine> list = r.getData();

					List<String> categories = list.stream().map(c -> c.getCatetory()).distinct()
							.collect(Collectors.toList());

					EuTreeNode root = new EuTreeNode();
					root.setId("ROOT");
					root.setText("数据词典");

					for (String c : categories) {

						EuTreeNode n = new EuTreeNode();
						n.setId("CATEGORY");
						n.setText(c);

						List<DictDefine> l2 = list.stream().filter(f -> f.getCatetory().equals(c))
								.collect(Collectors.toList());

						for (DictDefine l : l2) {

							EuTreeNode d = new EuTreeNode();
							d.setId(l.getId());
							d.setText(l.getName());

							n.addNode(d);
						}

						root.addNode(n);
					}

					nodes.add(root);
				}

				ps.setData(nodes);
			}
		});
	}

	@RequestMapping(value = "/dict/load", method = RequestMethod.POST)
	public void loadDictItems(HttpServletRequest req, Map<String, Object> map, String dictId, String parentId) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				PageParams pp = ui.getPageParams(req);
				if (dictId.equals("ROOT") || dictId.equals("CATEGORY")) {

					PageList<DictItem> list = new PageList<DictItem>(pp);
					ps.setCode(Result.SUCCEED);
					ps.setData(ui.putData(list));
				} else {

					String tenantId = getLoginUser().getTenantId();
					Result<PageList<DictItem>> r = readerDictService.loadDictItems(tenantId, dictId, parentId, pp);
					ps.setCode(r.getCode());
					if (r.isSucceed()) {
						ps.setData(ui.putData(r.getData()));
					} else {
						ps.addMessage(r.getMessage());
					}
				}
			}
		});
	}

	@RequestMapping(value = "/dict/new", method = RequestMethod.GET)
	public ModelAndView editDict(String pid, String id) {

		ModelAndView mv;

		Result<DictDefine> r = readerDictService.getDictDefineById(id);
		if (r.isSucceed()) {

			mv = this.view("views/admin/dict-edit");

			DictItem di = new DictItem();
			di.setDictId(id);
			di.setDictName(r.getData().getName());

			Boolean treeType = r.getData().getDataType() == DictDefine.DATATYPE_TREE;
			if (treeType && !StringUtils.isEmpty(pid)) {

				Result<DictItem> item = readerDictService.getDictItemsById(pid);
				if (item.isSucceed()) {
					di.setParentId(pid);
					di.setParentName(item.getData().getDictName());
				}
			}

			mv.addObject("treeType", treeType);
			mv.addObject("model", di);
		} else {

			mv = this.errorPage(r.getMessage());
		}

		return mv;
	}

	@RequestMapping(value = "/dict/edit", method = RequestMethod.GET)
	public ModelAndView getDictItem(String id) {

		ModelAndView mv;

		Result<DictItem> item = readerDictService.getDictItemsById(id);
		if (item.isSucceed()) {

			mv = this.view("views/admin/dict-edit");
			mv.addObject("model", item.getData());
		} else {

			mv = this.errorPage(item.getMessage(), "");
		}

		return mv;
	}

	@RequestMapping(value = "/dict/save", method = RequestMethod.POST)
	public void saveDictItem(Map<String, Object> map, String name, DictItem item) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				LoginUser user = getLoginUser();
				GeneralResult r;
				if (StringUtils.isEmpty(item.getId())) {

					item.setId(KeyUtils.newId());
					item.setTenantId(user.getTenantId());
					item.setIsFixed(user.hasAnyRole(LoginUser.ROLE_ROOT));

					r = writerDictService.createDictItem(item);
					ps.setResult(r);
				} else {

					Result<DictItem> oi = readerDictService.getDictItemsById(item.getId());
					if (oi.isSucceed()) {

						if (oi.getData().getIsFixed() && !user.hasAnyRole(LoginUser.ROLE_ROOT)) {

							ps.setFalied("保留的数据 不允许被修改。");
						} else {

							r = writerDictService.updateDictItem(item);
							ps.setResult(r);
						}
					}
				}
			}
		});
	}

	@RequestMapping(value = "/dict/del", method = RequestMethod.POST)
	public void saveDictItem(Map<String, Object> map, String id) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				Result<DictItem> item = readerDictService.getDictItemsById(id);
				if (item.isSucceed()) {

					if (item.getData().getIsFixed() && !getLoginUser().hasAnyRole(LoginUser.ROLE_ROOT)) {

						ps.setFalied("保留的数据 不允许被删除。");
						return;
					}

					GeneralResult r = writerDictService.deleteDictItem(id);
					ps.setResult(r);
				}
			}
		});
	}
}
