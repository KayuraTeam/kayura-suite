/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui.types;

/**
 * PropertyItem
 *
 * @author liangxia@live.com
 */
public class PropertyItem {

	private String name;
	private Object value;
	private String group;
	private Object editor;

	public PropertyItem() {

	}

	public PropertyItem(String name, Object value, String group) {
		this.name = name;
		this.value = value;
		this.group = group;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public Object getEditor() {
		return editor;
	}

	public void setEditor(Object editor) {
		this.editor = editor;
	}

}
