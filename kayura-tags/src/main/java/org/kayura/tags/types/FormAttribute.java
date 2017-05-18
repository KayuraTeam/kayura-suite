package org.kayura.tags.types;

import java.io.Serializable;
import java.util.Map;

public class FormAttribute implements Serializable {

	private static final long serialVersionUID = -6764948983937926534L;

	private String id;
	private String name;
	private String value;
	private String type;
	private String datePattern;
	private Map<String, String> items;
	private boolean readable = true;
	private boolean writeable = true;
	private boolean required;

	public FormAttribute() {

	}

	public FormAttribute(String id, String name, String value, String type) {
		this.id = id;
		this.name = name;
		this.value = value;
		this.type = type;
	}

	public FormAttribute(String id, String name, String value, String type, String datePattern, boolean readable,
			Map<String, String> items, boolean writeable, boolean required) {
		this.id = id;
		this.name = name;
		this.value = value;
		this.type = type;
		this.datePattern = datePattern;
		this.readable = readable;
		this.items = items;
		this.writeable = writeable;
		this.required = required;
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

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
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

	public Map<String, String> getItems() {
		return items;
	}

	public void setItems(Map<String, String> items) {
		this.items = items;
	}

}
