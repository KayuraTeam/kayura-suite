package org.kayura.activiti.vo;

import java.io.Serializable;

public class AssignItemVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private String value;
	private String name;
	private String type;
	private String typeName;

	public AssignItemVo() {

	}

	public AssignItemVo(String value, String name, String type) {
		this.value = value;
		this.name = name;
		this.type = type;
		this.typeName = OrgTypes.getTypeName(type);
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
		this.typeName = OrgTypes.getTypeName(type);
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

}
