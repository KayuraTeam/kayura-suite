package org.kayura.formbuilder.vo;

import java.util.Map;

public class FormViewTempletes {

	private Map<String, String> templetes;

	public void setTempletes(Map<String, String> templetes) {
		this.templetes = templetes;
	}

	public String first() {

		if (templetes != null && templetes.size() > 0) {
			return (String) templetes.values().toArray()[0];
		}

		return null;
	}

	public String get(String key) {

		if (templetes != null && templetes.size() > 0) {
			if (templetes.containsKey(key)) {
				return templetes.get(key);
			} else {
				return first();
			}
		}

		return null;
	}

}
