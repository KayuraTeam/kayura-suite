/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.po;

import org.kayura.utils.StringUtils;

/**
 * Identity
 *
 * @author liangxia@live.com
 */
public class Identity {

	private String identityId;
	private String companyId;
	private String companyName;
	private String departmentId;
	private String departmentName;
	private String positionId;
	private String positionName;
	private String employeeId;
	private String employeeName;

	private Employee employee;

	public String getDisplayName() {

		String displayName = this.departmentName;
		if (StringUtils.isNotEmpty(this.positionName)) {
			displayName = displayName + ">" + this.positionName;
		}
		return displayName;
	}

	public String getIdentityId() {
		return StringUtils.isEmpty(identityId) ? null : this.identityId;
	}

	public void setIdentityId(String identityId) {
		this.identityId = identityId;
	}

	public String getCompanyId() {
		return StringUtils.isEmpty(companyId) ? null : this.companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getDepartmentId() {
		return StringUtils.isEmpty(departmentId) ? null : this.departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getPositionId() {
		return StringUtils.isEmpty(positionId) ? null : this.positionId;
	}

	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

}
