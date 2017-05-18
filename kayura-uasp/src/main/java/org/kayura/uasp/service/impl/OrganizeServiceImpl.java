/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.uasp.comm.Constants;
import org.kayura.uasp.dao.OrganizeMapper;
import org.kayura.uasp.po.Company;
import org.kayura.uasp.po.Department;
import org.kayura.uasp.po.Employee;
import org.kayura.uasp.po.Identity;
import org.kayura.uasp.po.OrganizeItem;
import org.kayura.uasp.po.Position;
import org.kayura.uasp.service.OrganizeService;
import org.kayura.utils.DateUtils;
import org.kayura.utils.KeyUtils;
import org.kayura.utils.MapUtils;
import org.kayura.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 组织机构服务实现类.
 *
 * @author liangxia@live.com
 */
@Service
public class OrganizeServiceImpl implements OrganizeService {

	@Autowired
	private OrganizeMapper organizMapper;

	public Result<List<OrganizeItem>> findOrgTree(String tenantId, String parentId) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("tenantId", tenantId);
		args.put("parentId", parentId);

		List<OrganizeItem> items = organizMapper.findOrgTree(args);

		return new Result<List<OrganizeItem>>(Result.SUCCEED, items);
	}

	@Override
	public Result<PageList<OrganizeItem>> findOrgItems(String tenantId, String parentId, String keyword,
			PageParams pageParams) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("tenantId", tenantId);

		if (!StringUtils.isEmpty(parentId)) {
			args.put("parentId", parentId);
		}

		if (!StringUtils.isEmpty(keyword)) {
			args.put("keyword", "%" + keyword + "%");
		}

		PageList<OrganizeItem> items = organizMapper.findOrgItems(args, new PageBounds(pageParams));

		return new Result<PageList<OrganizeItem>>(Result.SUCCEED, items);
	}

	@Override
	public GeneralResult removeOrgItem(String orgId, Integer orgType) {

		Map<String, Object> args = new HashMap<String, Object>();

		switch (orgType) {
		case 1:
			args.put("companyId", orgId);
			organizMapper.deleteCompany(args);
			break;
		case 2:
			args.put("departmentId", orgId);
			organizMapper.deleteDepartment(args);
			break;
		case 3:
			args.put("positionId", orgId);
			organizMapper.deletePosition(args);
			break;
		}

		return Result.succeed();
	}

	@Override
	public Result<Company> getCompanyById(String id) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("companyId", id);

		Company company = organizMapper.findCompanies(args).stream().findAny().orElse(null);
		if (company == null) {
			return new Result<Company>(Result.FAILED, "公司 id: " + id + " 不存在。");
		}

		return new Result<Company>(Result.SUCCEED, company);
	}

	@Override
	public GeneralResult insertCompany(Company company) {

		if (StringUtils.isEmpty(company.getCompanyId())) {
			company.setCompanyId(KeyUtils.newId());
		}

		if (company.getStatus() == null) {
			company.setStatus(Constants.STATUS_ENABLED);
		}

		company.setUpdatedTime(DateUtils.now());
		organizMapper.insertCompany(company);

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("id", company.getCompanyId());

		GeneralResult r = Result.succeed("公司 " + company.getShortName() + " 保存完毕。");
		r.setData(data);

		return r;
	}

	@Override
	public GeneralResult updateCompany(Company company) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("companyId", company.getCompanyId());
		args.put("code", company.getCode());
		args.put("shortName", company.getShortName());
		args.put("fullName", company.getFullName());
		args.put("description", company.getDescription());
		args.put("industryTypeId", company.getIndustryTypeId());
		args.put("address", company.getAddress());
		args.put("Postcode", company.getPostcode());
		args.put("telephone", company.getTelephone());
		args.put("email", company.getEmail());
		args.put("fax", company.getFax());
		args.put("linkman", company.getLinkman());
		args.put("estaDate", company.getEstaDate());
		args.put("serial", company.getSerial());
		args.put("status", company.getStatus());
		args.put("updatedTime", DateUtils.now());

		organizMapper.updateCompany(args);

		return Result.succeed();
	}

	@Override
	public GeneralResult deleteCompany(String companyId) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("companyId", companyId);

		organizMapper.deleteCompany(args);
		return Result.succeed();
	}

	// Department

	public Result<Department> getDepartmentById(String departmentId) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("departmentId", departmentId);

		Department entity = organizMapper.findDepartments(args).stream().findAny().get();

		return new Result<Department>(Result.SUCCEED, entity);
	}

	public GeneralResult insertDepartment(Department department) {

		if (StringUtils.isEmpty(department.getDepartmentId())) {
			department.setDepartmentId(KeyUtils.newId());
		}

		department.setUpdatedTime(DateUtils.now());
		organizMapper.insertDepartment(department);

		GeneralResult r = Result.succeed();
		r.setData(MapUtils.make("id", department.getDepartmentId()));

		return r;
	}

	public GeneralResult updateDepartment(Department department) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("departmentId", department.getDepartmentId());
		args.put("parentId", department.getParentId());
		args.put("companyId", department.getCompanyId());
		args.put("code", department.getCode());
		args.put("name", department.getName());
		args.put("description", department.getDescription());
		args.put("serial", department.getSerial());
		args.put("status", department.getStatus());
		args.put("updatedTime", DateUtils.now());

		organizMapper.updateDepartment(args);

		return Result.succeed();
	}

	public GeneralResult deleteDepartment(String departmentId) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("departmentId", departmentId);

		organizMapper.deleteDepartment(args);
		return Result.succeed();
	}

	// Position

	public Result<Position> getPositionById(String positionId) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("positionId", positionId);

		Position entity = organizMapper.findPositions(args).stream().findAny().get();

		return new Result<Position>(Result.SUCCEED, entity);
	}

	public GeneralResult insertPosition(Position position) {

		if (StringUtils.isEmpty(position.getPositionId())) {
			position.setPositionId(KeyUtils.newId());
		}

		position.setUpdatedTime(DateUtils.now());
		organizMapper.insertPosition(position);

		GeneralResult r = Result.succeed();
		r.setData(MapUtils.make("id", position.getPositionId()));

		return r;
	}

	public GeneralResult updatePosition(Position position) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("positionId", position.getPositionId());
		args.put("departmentId", position.getDepartmentId());
		args.put("code", position.getCode());
		args.put("name", position.getName());
		args.put("level", position.getLevel());
		args.put("description", position.getDescription());
		args.put("serial", position.getSerial());
		args.put("status", position.getStatus());
		args.put("updatedTime", DateUtils.now());

		organizMapper.updatePosition(args);

		return Result.succeed();
	}

	public GeneralResult deletePosition(String positionId) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("positionId", positionId);

		organizMapper.deletePosition(args);
		return Result.succeed();
	}

	// Identity

	public Result<Identity> getIdentityById(String identityId) {

		Result<Identity> r = new Result<Identity>();
		
		Identity entity = organizMapper.getIdentityById(identityId);
		if (entity != null) {
			r.setCode(Result.ERROR);
			r.setMessage("不存在ID为:" + identityId + "的身份记录.");
		} else {
			r.setCode(Result.SUCCEED);
			r.setData(entity);
		}

		return r;
	}

	public GeneralResult insertIdentity(Identity identity) {

		// 若 employee 不为 null 表示同时插入新员工信息.
		Employee employee = identity.getEmployee();
		if (employee != null) {
			if (StringUtils.isEmpty(employee.getEmployeeId())) {
				employee.setEmployeeId(KeyUtils.newId());
			}
			employee.setUpdatedTime(DateUtils.now());
			organizMapper.insertEmployee(employee);
			identity.setEmployeeId(employee.getEmployeeId());
		}

		// 插入身份信息.
		if (StringUtils.isEmpty(identity.getIdentityId())) {
			identity.setIdentityId(KeyUtils.newId());
		}
		organizMapper.insertIdentity(identity);

		return Result.succeed();
	}

	public GeneralResult updateIdentity(Identity identity) {

		// 若 employee 不为 null 表示同时更新员工信息.
		Employee employee = identity.getEmployee();
		if (employee != null) {

			if (!StringUtils.isEmpty(employee.getEmployeeId())) {

				Map<String, Object> args = new HashMap<String, Object>();
				args.put("employeeId", employee.getEmployeeId());
				args.put("code", employee.getCode());
				args.put("name", employee.getName());
				args.put("sex", employee.getSex());
				args.put("birthDay", employee.getBirthDay());
				args.put("phone", employee.getPhone());
				args.put("mobile", employee.getMobile());
				args.put("email", employee.getEmail());
				args.put("status", employee.getStatus());
				args.put("updatedTime", DateUtils.now());

				organizMapper.updateEmployee(args);
			}
		}

		// 插入身份信息.
		organizMapper.updateIdentity(identity);

		return Result.succeed();
	}

	@Override
	public Result<PageList<Employee>> findEmployees(String tenantId, String keyword, PageParams pageParams) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("tenantId", tenantId);

		if (!StringUtils.isEmpty(keyword)) {
			args.put("keyword", "%" + keyword + "%");
		}

		PageList<Employee> items = organizMapper.findEmployees(args, new PageBounds(pageParams));
		return new Result<PageList<Employee>>(Result.SUCCEED, items);
	}

	@Override
	public Result<Employee> getEmployeeById(String employeeId) {

		Employee entity = organizMapper.getEmployeeById(employeeId);
		return new Result<Employee>(Result.SUCCEED, entity);
	}

	@Override
	public GeneralResult insertEmployee(Employee employee) {

		if (StringUtils.isEmpty(employee.getEmployeeId())) {
			employee.setEmployeeId(KeyUtils.newId());
		}
		employee.setUpdatedTime(DateUtils.now());
		organizMapper.insertEmployee(employee);

		return Result.succeed();
	}

	@Override
	public GeneralResult updateEmployee(Employee employee) {

		Map<String, Object> args = new HashMap<String, Object>();

		args.put("employeeId", employee.getEmployeeId());
		args.put("code", employee.getCode());
		args.put("name", employee.getName());
		args.put("sex", employee.getSex());
		args.put("birthDay", employee.getBirthDay());
		args.put("phone", employee.getPhone());
		args.put("mobile", employee.getMobile());
		args.put("email", employee.getEmail());
		args.put("status", employee.getStatus());
		args.put("updatedTime", DateUtils.now());

		organizMapper.updateEmployee(args);

		return Result.succeed();
	}

	@Override
	public GeneralResult deleteEmployee(String employeeId) {

		organizMapper.deleteEmployee(MapUtils.make("employeeId", employeeId));

		return Result.succeed();
	}

}
