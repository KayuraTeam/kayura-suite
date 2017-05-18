/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.po;

/**
 * 组织机构项.
 *
 * @author liangxia@live.com
 */
public class OrganizeItem {

	public static final Integer ORGTYPE_COMPANY = 1;
	public static final Integer ORGTYPE_DEPART = 2;
	public static final Integer ORGTYPE_POSITION = 3;
	public static final Integer ORGTYPE_IDENTITY = 4;

	private String orgId;
	private String parentId;
	private String code;
	private String displayName;
	private Integer orgType;
	private Integer serial;
	private Integer status;
	private Integer count;

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public Integer getOrgType() {
		return orgType;
	}

	public String getOrgTypeName() {

		String orgTypeName = "未知";

		switch (this.orgType) {
		case 1:
			orgTypeName = "公司";
			break;
		case 2:
			orgTypeName = "部门";
			break;
		case 3:
			orgTypeName = "岗位";
			break;
		case 4:
			orgTypeName = "员工";
			break;
		}
		return orgTypeName;
	}

	public void setOrgType(Integer orgType) {
		this.orgType = orgType;
	}

	public Integer getSerial() {
		return serial;
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

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

}
