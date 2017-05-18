/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.po;

import java.util.Date;

import org.kayura.uasp.comm.Constants;
import org.kayura.utils.StringUtils;

/**
 * 组织机构 公司实体类型.
 * 
 * @author liangxia@live.com
 */
public class Company {

	private String companyId;
	private String tenantId;
	private String parentId;
	private String parentName;
	private String code;
	private String shortName;
	private String fullName;
	private String description;
	private String industryTypeId;
	private String address;
	private String postcode;
	private String telephone;
	private String email;
	private String fax;
	private String linkman;
	private Date estaDate;
	private Integer serial;
	private Integer status;
	private Date updatedTime;

	public Company() {
		this.serial = 0;
		this.status = Constants.STATUS_ENABLED;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getTenantId() {
		return !StringUtils.isEmpty(tenantId) ? this.tenantId : null;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getParentId() {
		return !StringUtils.isEmpty(parentId) ? this.parentId : null;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIndustryTypeId() {
		return industryTypeId;
	}

	public void setIndustryTypeId(String industryTypeId) {
		this.industryTypeId = industryTypeId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public Date getEstaDate() {
		return estaDate;
	}

	public void setEstaDate(Date estaDate) {
		this.estaDate = estaDate;
	}

	public Integer getSerial() {
		return this.serial == null ? 0 : this.serial;
	}

	public void setSerial(Integer serial) {
		this.serial = serial;
	}

	public Integer getStatus() {
		return status;
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
