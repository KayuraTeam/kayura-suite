/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.kayura.core.PostAction;
import org.kayura.core.PostResult;
import org.kayura.security.LoginUser;
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.uasp.po.Role;
import org.kayura.uasp.service.AuthorityService;
import org.kayura.utils.StringUtils;
import org.kayura.web.controllers.UaspController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * AuthController
 *
 * @author liangxia@live.com
 */
@Controller
public class AuthController extends UaspController {

	@Autowired
	private AuthorityService readerAuthorityService;

	@Autowired
	private AuthorityService writerAuthorityService;

	@RequestMapping(value = "/auth/role/list", method = RequestMethod.GET)
	public ModelAndView roleList() {

		return view("views/auth/role-list");
	}

	@RequestMapping(value = "/auth/role/find", method = RequestMethod.POST)
	public void findRoles(Map<String, Object> map, HttpServletRequest req, String keyword) {

		LoginUser user = this.getLoginUser();
		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				PageParams pageParams = ui.getPageParams(req);
				Result<PageList<Role>> r = readerAuthorityService.findRoles(user.getTenantId(), keyword, pageParams);
				ps.setResult(r.getCode(), r.getMessage(), ui.putData(r.getData()));
			}
		});
	}

	@RequestMapping(value = "/auth/role/new", method = RequestMethod.GET)
	public ModelAndView createRole() {

		Role model = new Role();
		model.setEnabled(true);
		return view("views/auth/role-edit", model);
	}

	@RequestMapping(value = "/auth/role/edit", method = RequestMethod.GET)
	public ModelAndView editRole(String id) {

		Result<Role> r = readerAuthorityService.getRoleById(id);
		if (r.isSucceed()) {
			return view("views/auth/role-edit", r.getData());
		} else {
			return errorPage(r);
		}
	}

	@RequestMapping(value = "/auth/role/save", method = RequestMethod.POST)
	public void saveRole(Map<String, Object> map, Role model) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				GeneralResult r = null;

				if (StringUtils.isEmpty(model.getRoleId())) {

					LoginUser user = getLoginUser();

					model.setEnabled(true);
					model.setTenantId(user.getTenantId());

					r = writerAuthorityService.createRole(model);
				} else {

					r = writerAuthorityService.updateRole(model);
				}

				if (r != null) {
					ps.setResult(r);
				}
			}
		});
	}

	@RequestMapping(value = "/auth/role/remove", method = RequestMethod.POST)
	public void removeRole(Map<String, Object> map, String id) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				GeneralResult r = writerAuthorityService.removeRole(id);
				if (r != null) {
					ps.setResult(r);
				}
			}
		});
	}

}
