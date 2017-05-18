/**
 * Copyright 2015-2015 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.po;

/**
 * @author liangxia@live.com
 */
public class DictDefine {

	/** 列表型数据项 */
	public static final Integer DATATYPE_LIST = 0;

	/** 树型结构数据项 */
	public static final Integer DATATYPE_TREE = 1;

	private String id;
	private String code;
	private String name;
	private String catetory;
	private Integer dataType;
	private String description;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	/**
	 * @return the catetory
	 */
	public String getCatetory() {
		return catetory;
	}

	/**
	 * @param catetory the catetory to set
	 */
	public void setCatetory(String catetory) {
		this.catetory = catetory;
	}

	public Integer getDataType() {
		return dataType;
	}

	public void setDataType(Integer dataType) {
		this.dataType = dataType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
