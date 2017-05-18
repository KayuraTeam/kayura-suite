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
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.uasp.comm.Constants;
import org.kayura.uasp.po.Company;
import org.kayura.uasp.po.Department;
import org.kayura.uasp.po.Employee;
import org.kayura.uasp.po.Identity;
import org.kayura.uasp.po.OrganizeItem;
import org.kayura.uasp.po.Position;
import org.kayura.uasp.service.OrganizeService;
import org.kayura.utils.KeyUtils;
import org.kayura.utils.StringUtils;
import org.kayura.web.controllers.UaspController;
import org.kayura.tags.easyui.types.EuTreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * 组织机构控制器.
 *
 * @author liangxia@live.com
 */
@Controller
public class OrgController extends UaspController {

	static final String NULL = "NULL";

	@Autowired
	private OrganizeService writerOrganizeService;

	@Autowired
	private OrganizeService readerOrganizeService;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping(value = "/org/manager", method = RequestMethod.GET)
	public ModelAndView fileUpload() {

		return view("views/org/manager");
	}

	/**
	 * 获取组织机构树型数据.
	 * 
	 * @param id
	 *            值为 null 或 "" 时，获取所有树型数据。 值为 "NULL" 时，仅获取第一层节点数据。 值为 key 时，获取该
	 *            key 下级子节点。
	 */
	@RequestMapping(value = "/org/tree", method = RequestMethod.POST)
	public void orgTree(Map<String, Object> map, String id) {

		LoginUser user = this.getLoginUser();

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				String parentId = id;
				if (!StringUtils.isEmpty(id)) {
					parentId = id.toUpperCase();
				} else {
					parentId = null;
				}

				List<EuTreeNode> roots = new ArrayList<EuTreeNode>();

				Result<List<OrganizeItem>> r = readerOrganizeService.findOrgTree(user.getTenantId(), parentId);
				if (r.isSucceed()) {

					List<OrganizeItem> items = r.getData();
					if (StringUtils.isEmpty(id) || NULL.equals(id)) {

						EuTreeNode root = new EuTreeNode();
						root.setId("ROOT");
						root.setText("所有组织机构");
						root.setState(EuTreeNode.STATE_OPEN);
						root.setIconCls("icon-organiz");
						root.addAttr("type", 0);
						roots.add(root);

						List<OrganizeItem> rootItems = items.stream().filter(c -> c.getParentId() == null)
								.collect(Collectors.toList());
						for (OrganizeItem f : rootItems) {

							EuTreeNode n = createNode(f);
							root.addNode(n);
							appendChildFolders(n, items);
						}
					} else {

						for (OrganizeItem f : items) {
							roots.add(createNode(f));
						}
					}
				}

				// 添加以返回结果.
				ps.setData(roots);
			}
		});
	}

	String getOrgTreeIcon(int orgType) {

		String iconCls = "icon-folder";
		switch (orgType) {
		case 1:
			iconCls = "icon-company";
			break;
		case 2:
			iconCls = "icon-depart";
			break;
		case 3:
			iconCls = "icon-position";
			break;
		}
		return iconCls;
	}

	EuTreeNode createNode(OrganizeItem item) {

		EuTreeNode n = new EuTreeNode();
		n.setId(item.getOrgId());
		n.setText(item.getDisplayName());
		if (item.getCount() == 0) {
			n.setState(EuTreeNode.STATE_OPEN);
		} else {
			n.setState(EuTreeNode.STATE_CLOSED);
		}
		n.setIconCls(getOrgTreeIcon(item.getOrgType()));
		n.addAttr("type", item.getOrgType());

		return n;
	}

	void appendChildFolders(EuTreeNode node, List<OrganizeItem> items) {

		List<OrganizeItem> childs = items.stream()
				.filter(c -> c.getParentId() != null && c.getParentId().equals(node.getId()))
				.sorted((x, y) -> Integer.compare(y.getOrgType(), x.getOrgType())).collect(Collectors.toList());
		if (!childs.isEmpty()) {
			for (OrganizeItem f : childs) {

				EuTreeNode n = createNode(f);
				node.addNode(n);
				appendChildFolders(n, items);
			}
		}
	}

	/**
	 * 获取组织机构树型数据.
	 * 
	 */
	@RequestMapping(value = "/org/find", method = RequestMethod.POST)
	public void findOrgItems(HttpServletRequest req, Map<String, Object> map, String id, String keyword) {

		LoginUser user = this.getLoginUser();
		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				PageParams pp = ui.getPageParams(req);

				String parentId = id;
				if (StringUtils.isEmpty(id)) {
					parentId = null;
				}

				Result<PageList<OrganizeItem>> r = readerOrganizeService.findOrgItems(user.getTenantId(), parentId,
						keyword, pp);
				ps.setResult(r.getCode(), r.getMessage(), ui.putData(r.getData()));
			}
		});
	}

	@RequestMapping(value = "/org/remove", method = RequestMethod.POST)
	public void removeOrgItem(Map<String, Object> map, String id, @RequestParam("t") Integer type) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {
				GeneralResult r = writerOrganizeService.removeOrgItem(id, type);
				ps.setResult(r);
			}
		});
	}

	@RequestMapping(value = "/org/company/new", method = RequestMethod.GET)
	public ModelAndView createCompany(@RequestParam("pid") String parentId, @RequestParam("pname") String parentName) {

		Company company = new Company();
		company.setParentId(parentId);
		company.setParentName(parentName);

		return view("views/org/company-edit", company);
	}

	@RequestMapping(value = "/org/company", method = RequestMethod.GET)
	public ModelAndView editCompany(String id) {

		Result<Company> r = readerOrganizeService.getCompanyById(id);
		if (r.isSucceed()) {

			return view("views/org/company-edit", r.getData());
		} else {
			return this.errorPage("编辑公司信息时异常。", r.getMessage());
		}
	}

	@RequestMapping(value = "/org/company/save", method = RequestMethod.POST)
	public void saveCompany(HttpServletRequest req, Map<String, Object> map, Company company) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				GeneralResult r = null;

				if (StringUtils.isEmpty(company.getCompanyId())) {

					LoginUser user = getLoginUser();

					company.setCompanyId(KeyUtils.newId());
					company.setStatus(Constants.STATUS_ENABLED);
					company.setTenantId(user.getTenantId());

					r = writerOrganizeService.insertCompany(company);
				} else {

					r = writerOrganizeService.updateCompany(company);
				}

				if (r != null) {
					ps.setResult(r);
				}
			}
		});
	}

	/**
	 * 显示创建一个部门信息页面.
	 * 
	 * @param parentId
	 *            新部门的上级ID
	 * @param type
	 *            表示上级ID是什么类型: 1 公司;2 部门;
	 * @param parentName
	 *            上级组织显示名.
	 * @return
	 */
	@RequestMapping(value = "/org/depart/new", method = RequestMethod.GET)
	public ModelAndView createDepart(@RequestParam("pid") String parentId, @RequestParam("t") Integer type,
			@RequestParam("pname") String parentName) {

		Department department = new Department();

		if (type == OrganizeItem.ORGTYPE_COMPANY) {

			department.setCompanyId(parentId);
			department.setCompanyName(parentName);

		} else if (type == OrganizeItem.ORGTYPE_DEPART) {

			Result<Department> r = readerOrganizeService.getDepartmentById(parentId);
			if (r.isSucceed()) {
				department.setCompanyId(r.getData().getCompanyId());
				department.setCompanyName(r.getData().getCompanyName());
			}

			department.setParentId(parentId);
			department.setParentName(parentName);
		}

		return view("views/org/depart-edit", department);
	}

	/**
	 * 显示创建一个部门信息页面.
	 * 
	 * @param id
	 *            部门ID
	 * @return
	 */
	@RequestMapping(value = "/org/depart", method = RequestMethod.GET)
	public ModelAndView editDepart(String id) {

		Result<Department> r = readerOrganizeService.getDepartmentById(id);
		if (r.isSucceed()) {

			return view("views/org/depart-edit", r.getData());

		} else {
			return this.errorPage("编辑公司信息时异常。", r.getMessage());
		}
	}

	@RequestMapping(value = "/org/depart/save", method = RequestMethod.POST)
	public void saveDepartment(HttpServletRequest req, Map<String, Object> map, Department department) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				GeneralResult r = null;

				if (StringUtils.isEmpty(department.getDepartmentId())) {

					LoginUser user = getLoginUser();

					department.setDepartmentId(KeyUtils.newId());
					department.setStatus(Constants.STATUS_ENABLED);
					department.setTenantId(user.getTenantId());

					r = writerOrganizeService.insertDepartment(department);
				} else {

					r = writerOrganizeService.updateDepartment(department);
				}

				if (r != null) {
					ps.setResult(r);
				}
			}
		});
	}

	/**
	 * 显示创建一个岗位信息页面.
	 * 
	 * @param parentId
	 *            新岗位的上级部门Id.
	 * @param parentName
	 *            上级部门显示名.
	 * @return
	 */
	@RequestMapping(value = "/org/position/new", method = RequestMethod.GET)
	public ModelAndView createPosition(@RequestParam("pid") String parentId, @RequestParam("pname") String parentName) {

		Position position = new Position();
		position.setDepartmentId(parentId);
		position.setDepartmentName(parentName);

		return view("views/org/position-edit", position);
	}

	/**
	 * 显示创建一个部门信息页面.
	 * 
	 * @param id
	 *            显示的岗位Id.
	 * @return
	 */
	@RequestMapping(value = "/org/position", method = RequestMethod.GET)
	public ModelAndView editPosition(String id) {

		Result<Position> r = readerOrganizeService.getPositionById(id);
		if (r.isSucceed()) {
			return view("views/org/position-edit", r.getData());
		} else {
			return errorPage("编辑岗位信息时异常。", r.getMessage());
		}
	}

	@RequestMapping(value = "/org/position/save", method = RequestMethod.POST)
	public void savePosition(HttpServletRequest req, Map<String, Object> map, Position position) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				GeneralResult r = null;

				if (StringUtils.isEmpty(position.getPositionId())) {

					LoginUser user = getLoginUser();

					position.setPositionId(KeyUtils.newId());
					position.setStatus(Constants.STATUS_ENABLED);
					position.setTenantId(user.getTenantId());

					r = writerOrganizeService.insertPosition(position);
				} else {

					r = writerOrganizeService.updatePosition(position);
				}

				if (r != null) {
					ps.setResult(r);
				}
			}
		});
	}

	@RequestMapping(value = "/org/identity/new", method = RequestMethod.GET)
	public ModelAndView createIdentity(@RequestParam("pid") String parentId, @RequestParam("t") Integer type) {

		Identity model = new Identity();
		model.setEmployee(new Employee());

		if (type == OrganizeItem.ORGTYPE_POSITION) {
			Result<Position> rp = readerOrganizeService.getPositionById(parentId);
			if (rp.isSucceed()) {
				Position position = rp.getData();
				model.setPositionId(position.getPositionId());
				model.setPositionName(position.getName());
				model.setDepartmentId(position.getDepartmentId());
				model.setDepartmentName(position.getDepartmentName());
			}
		} else if (type == OrganizeItem.ORGTYPE_DEPART) {
			Result<Department> rp = readerOrganizeService.getDepartmentById(parentId);
			if (rp.isSucceed()) {
				Department department = rp.getData();
				model.setDepartmentId(department.getDepartmentId());
				model.setDepartmentName(department.getName());
			}
		} else {
			return this.errorPage("指定无效的 type 参数。", "");
		}

		ModelAndView mv = view("views/org/identity-edit", model);
		mv.addObject("emp", model.getEmployee());
		return mv;
	}

	@RequestMapping(value = "/org/identity", method = RequestMethod.GET)
	public ModelAndView editIdentity(String id) {

		Result<Identity> r = readerOrganizeService.getIdentityById(id);
		if (r.isSucceed()) {
			Identity model = r.getData();
			ModelAndView mv = view("views/org/identity-edit", model);
			mv.addObject("emp", model.getEmployee());
			return mv;
		} else {
			return errorPage("读取身份信息时异常。", r.getMessage());
		}
	}

	@RequestMapping(value = "/org/identity/save", method = RequestMethod.POST)
	public void saveIdentity(HttpServletRequest req, Map<String, Object> map, Identity identity, Employee employee) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				GeneralResult r = null;
				if (StringUtils.isEmpty(identity.getIdentityId())) {

					LoginUser user = getLoginUser();
					identity.setIdentityId(KeyUtils.newId());
					identity.setEmployee(employee);

					if (StringUtils.isEmpty(employee.getEmployeeId())) {
						employee.setEmployeeId(KeyUtils.newId());
					}
					employee.setStatus(Constants.STATUS_ENABLED);
					employee.setTenantId(user.getTenantId());

					r = writerOrganizeService.insertIdentity(identity);
				} else {

					identity.setEmployee(employee);
					r = writerOrganizeService.updateIdentity(identity);
				}

				if (r != null) {
					ps.setResult(r);
				}
			}
		});
	}

	@RequestMapping(value = "/org/identity/import", method = RequestMethod.POST)
	public void importIdentityForEmployee(Map<String, Object> map, @RequestParam("pid") String parentId,
			@RequestParam("t") Integer type, @RequestParam("empid") String employeeId) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				Identity identity = new Identity();
				identity.setIdentityId(KeyUtils.newId());
				identity.setEmployeeId(employeeId);

				if (type == OrganizeItem.ORGTYPE_POSITION) {
					Result<Position> rp = readerOrganizeService.getPositionById(parentId);
					if (rp.isSucceed()) {
						Position position = rp.getData();
						identity.setPositionId(position.getPositionId());
						identity.setDepartmentId(position.getDepartmentId());
					}
				} else if (type == OrganizeItem.ORGTYPE_DEPART) {
					identity.setDepartmentId(parentId);
				}

				GeneralResult r = writerOrganizeService.insertIdentity(identity);
				ps.setResult(r);
			}
		});
	}

	@RequestMapping(value = "/org/employee/list", method = RequestMethod.GET)
	public ModelAndView employeeList() {

		return view("/views/org/employee-list");
	}

	@RequestMapping(value = "/org/employee/find", method = RequestMethod.POST)
	public void findEmployees(HttpServletRequest req, Map<String, Object> map, String keyword) {

		LoginUser user = this.getLoginUser();
		postExecute(map, new PostAction() {
			@Override
			public void invoke(PostResult ps) {

				PageParams pp = ui.getPageParams(req);
				Result<PageList<Employee>> r = readerOrganizeService.findEmployees(user.getTenantId(), keyword, pp);
				ps.setResult(r.getCode(), r.getMessage(), ui.putData(r.getData()));
			}
		});
	}

	@RequestMapping(value = "/org/employee/new", method = RequestMethod.GET)
	public ModelAndView createEmployee() {

		Employee employee = new Employee();
		employee.setStatus(Constants.STATUS_ENABLED);
		return view("/views/org/employee-edit", employee);
	}

	@RequestMapping(value = "/org/employee/edit", method = RequestMethod.GET)
	public ModelAndView editEmployee(String id) {

		Result<Employee> r = readerOrganizeService.getEmployeeById(id);
		if (r.isSucceed()) {
			Employee model = r.getData();
			ModelAndView mv = view("views/org/employee-edit", model);
			mv.addObject("emp", model);
			return mv;
		} else {
			return errorPage("读取员工信息异常。", r.getMessage());
		}
	}

	@RequestMapping(value = "/org/employee/save", method = RequestMethod.POST)
	public void saveEmployee(HttpServletRequest req, Map<String, Object> map, Employee employee) {

		LoginUser user = this.getLoginUser();
		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				GeneralResult r = null;
				if (StringUtils.isEmpty(employee.getEmployeeId())) {

					employee.setEmployeeId(KeyUtils.newId());
					employee.setStatus(Constants.STATUS_ENABLED);
					employee.setTenantId(user.getTenantId());

					r = writerOrganizeService.insertEmployee(employee);
				} else {

					r = writerOrganizeService.updateEmployee(employee);
				}

				if (r != null) {
					ps.setResult(r);
				}
			}
		});
	}

	@RequestMapping(value = "/org/employee/select", method = RequestMethod.GET)
	public ModelAndView selectEmployee() {

		ModelAndView mv = view("views/org/select_employee");
		return mv;
	}
}
