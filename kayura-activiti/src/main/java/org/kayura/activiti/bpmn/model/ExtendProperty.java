package org.kayura.activiti.bpmn.model;

import java.io.Serializable;

import org.kayura.activiti.bpmn.handler.ExtendPropertyHandler;

public class ExtendProperty implements Serializable {

	private static final long serialVersionUID = 1L;

	protected String id;
	protected String name;
	protected String type;
	protected String value;

	public ExtendProperty(ExtendPropertyHandler extendPropertyHandler) {
		this.id = extendPropertyHandler.getId();
		this.name = extendPropertyHandler.getName();
		this.type = extendPropertyHandler.getType();
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

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
