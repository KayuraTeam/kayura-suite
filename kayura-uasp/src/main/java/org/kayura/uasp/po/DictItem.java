/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.po;

/**
 * @author liangxia@live.com
 */
public class DictItem {

	private String id;
	private String parentId;
	private String parentName;
	private String tenantId;
	private String dictId;
	private String dictName;
	private String name;
	private String value;
	private Integer serial;
	private Boolean isFixed;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getParentId() {
		return parentId;
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

	/**
	 * @return the tenantId
	 */
	public String getTenantId() {
		return tenantId;
	}

	/**
	 * @param tenantId the tenantId to set
	 */
	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getDictId() {
		return dictId;
	}

	public void setDictId(String dictId) {
		this.dictId = dictId;
	}

	public String getDictName() {
		return dictName;
	}

	public void setDictName(String dictName) {
		this.dictName = dictName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	/**
	 * @return the serial
	 */
	public Integer getSerial() {
		return serial;
	}

	/**
	 * @param serial the serial to set
	 */
	public void setSerial(Integer serial) {
		this.serial = serial;
	}

	public Boolean getIsFixed() {
		return isFixed;
	}

	public void setIsFixedName(String isFixedName) {
		if (isFixedName == "是") {
			this.isFixed = true;
		} else {
			this.isFixed = false;
		}
	}

	public String getIsFixedName() {
		return this.isFixed ? "是" : "否";
	}

	public void setIsFixed(Boolean isFixed) {
		this.isFixed = isFixed;
	}

}
