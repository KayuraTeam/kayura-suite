package org.kayura.activiti.vo;

import org.activiti.engine.identity.Group;

public class GroupVo implements Group {

	private static final long serialVersionUID = 1L;

	protected String id;
	protected String name;
	protected String type;

	public GroupVo() {

	}

	public GroupVo(Group group) {
		this();
		this.id = group.getId();
		this.name = group.getName();
		this.type = group.getType();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTypeName() {
		return OrgTypes.getTypeName(this.type);
	}

}
