/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui.types;

/**
 * SelectItem
 *
 * @author liangxia@live.com
 */
public class SelectItem {

	private String label;
	private String value;
	private String group;
	private Boolean selected;

	public SelectItem(String label, String value) {
		this.label = label;
		this.value = value;
	}

	public SelectItem(String label, String value, Boolean selected) {
		this.label = label;
		this.value = value;
		this.selected = selected;
	}

	public SelectItem(String label, String value, String group, Boolean selected) {
		this.label = label;
		this.value = value;
		this.group = group;
		this.selected = selected;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public Boolean getSelected() {
		return selected;
	}

	public void setSelected(Boolean selected) {
		this.selected = selected;
	}

}
