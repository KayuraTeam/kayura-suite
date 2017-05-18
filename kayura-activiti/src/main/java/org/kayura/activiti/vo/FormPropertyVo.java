package org.kayura.activiti.vo;

import java.io.Serializable;
import java.util.Map;

import org.activiti.engine.form.FormProperty;
import org.kayura.utils.StringUtils;

public class FormPropertyVo implements Serializable {

	private static final long serialVersionUID = 1607099846369884335L;

	private String id;
	private String name;
	private String value;
	private String type;
	private String datePattern;
	private Map<String, String> items;
	private boolean readable = true;
	private boolean writeable = true;
	private boolean required;

	@SuppressWarnings("unchecked")
	public FormPropertyVo(FormProperty formProperty) {

		this.id = formProperty.getId();
		this.name = formProperty.getName();
		this.value = formProperty.getValue();
		this.type = formProperty.getType().getName();
		this.datePattern = StringUtils.toString(formProperty.getType().getInformation("datePattern"));
		this.setItems(((Map<String, String>) formProperty.getType().getInformation("values")));
		this.readable = formProperty.isReadable();
		this.writeable = formProperty.isWritable();
		this.required = formProperty.isRequired();
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

	public String getDatePattern() {
		return datePattern;
	}

	public void setDatePattern(String datePattern) {
		this.datePattern = datePattern;
	}

	public boolean isReadable() {
		return readable;
	}

	public void setReadable(boolean readable) {
		this.readable = readable;
	}

	public boolean isWriteable() {
		return writeable;
	}

	public void setWriteable(boolean writeable) {
		this.writeable = writeable;
	}

	public boolean isRequired() {
		return required;
	}

	public void setRequired(boolean required) {
		this.required = required;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Map<String, String> getItems() {
		return items;
	}

	public void setItems(Map<String, String> items) {
		this.items = items;
	}

}
