/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.po;

import java.io.Serializable;
import java.util.Date;

import org.kayura.serializer.DateJsonSerializer;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * @author liangxia@live.com
 */
public class Employee implements Serializable {

	private static final long serialVersionUID = 4536860694915891927L;

	private String employeeId;
	private String tenantId;
	private String userId;
	private String code;
	private String name;
	private Integer sex;
	private Date birthDay;
	private String phone;
	private String mobile;
	private String email;
	private Integer status;
	private Date updatedTime;

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getSexName() {

		return this.sex != null ? (this.sex == 1 ? "男" : "女") : "";
	}

	@JsonSerialize(using = DateJsonSerializer.class)
	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getStatus() {
		return status;
	}

	public String getStatusName() {
		return status != null && status == 1 ? "已启用" : "";
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}

}
