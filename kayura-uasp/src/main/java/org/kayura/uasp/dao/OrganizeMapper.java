/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.dao;

import java.util.List;
import java.util.Map;

import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.PageList;
import org.kayura.uasp.po.Company;
import org.kayura.uasp.po.Department;
import org.kayura.uasp.po.Employee;
import org.kayura.uasp.po.Identity;
import org.kayura.uasp.po.OrganizeItem;
import org.kayura.uasp.po.Position;
import org.springframework.stereotype.Repository;

/**
 * OrganizMapper
 *
 * @author liangxia@live.com
 */
@Repository
public interface OrganizeMapper {

	// Organize

	/**
	 * 查询组织机构树型数据.
	 * 
	 * @param args [tenantId] 必需, [parentId] 可选值为 'NULL', null, 值.
	 * @return
	 */
	List<OrganizeItem> findOrgTree(Map<String, Object> args);

	/**
	 * 查询组织机构树型数据.
	 * 
	 * @param args [tenantId] 必需, [parentId] 可选值.
	 * @param pageBounds
	 * @return
	 */
	PageList<OrganizeItem> findOrgItems(Map<String, Object> args, PageBounds pageBounds);

	// Company

	/**
	 * 查询符条件的公司信息.
	 * 
	 * @param args 支持的参数：companyId,parentId,tenantId,status.
	 * @return
	 */
	List<Company> findCompanies(Map<String, Object> args);

	/**
	 * 插入一个公司信息至数据库.
	 * 
	 * @param company 数据库实体对象.
	 */
	void insertCompany(Company company);

	/**
	 * 更新一个公司信息至数据库.
	 */
	void updateCompany(Map<String, Object> args);

	void deleteCompany(Map<String, Object> args);

	// Department

	List<Department> findDepartments(Map<String, Object> args);

	void insertDepartment(Department department);

	void updateDepartment(Map<String, Object> args);

	void deleteDepartment(Map<String, Object> args);

	// Position

	List<Position> findPositions(Map<String, Object> args);

	void insertPosition(Position position);

	void updatePosition(Map<String, Object> args);

	void deletePosition(Map<String, Object> args);

	// Identity
	
	/**
	 * 查询符条件的身份信息.
	 * @param args 支持参数有: identityId, employeeId, departmentId, positionId, companyId
	 * @return
	 */
	List<Identity> findIdentities(Map<String, Object> args);
	
	Identity getIdentityById(String identityId);

	void insertIdentity(Identity identity);

	void updateIdentity(Identity identity);

	void deleteIdentity(Map<String, Object> args);
	
	// Employee

	/**
	 * 查询员工信息列表.
	 * @param args 支持参数有: tenantId,sex,startBirthDay,endBirthDay,keyword,status,startUpdatedTime,companyId
	 * 	departmentId,departmentIds,positionId,positionIds
	 * @return
	 */
	PageList<Employee> findEmployees(Map<String, Object> args, PageBounds pageBounds);

	Employee getEmployeeById(String employeeId);
	
	void insertEmployee(Employee employee);

	void updateEmployee(Map<String, Object> args);

	void deleteEmployee(Map<String, Object> args);

}
