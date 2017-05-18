package org.kayura.activiti.expression;

import java.util.HashMap;

public class AssignmenteExpression {

	private HashMap<String, String> items = new HashMap<String, String>();

	public HashMap<String, String> getItems() {
		return items;
	}

	public void setItems(HashMap<String, String> items) {
		this.items = items;
	}

	private String clear(String value) {

		if (value.startsWith("${") && value.endsWith("}")) {
			return value.substring(2, value.length() - 1);
		} else {
			return value;
		}
	}

	public boolean exists(String key) {
		return items.containsKey(clear(key));
	}

	public String get(String key) {
		return items.get(clear(key));
	}
}
