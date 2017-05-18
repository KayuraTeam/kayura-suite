package org.kayura.formbuilder.model.field;

import java.util.ArrayList;
import java.util.List;

/**
 * 单项选择
 * 
 * @author liangxia@live.com
 * 
 *
 */
public class SelectField extends InputField {

	private List<Option> options;

	public void addOption(String lable, String value, Boolean checked) {

		if (options == null) {
			options = new ArrayList<Option>();
		}

		Option option = new Option();
		option.setLable(lable);
		option.setValue(value);
		option.setChecked(checked);

		options.add(option);
	}

	public List<Option> getOptions() {
		return options;
	}

	public void setOptions(List<Option> options) {
		this.options = options;
	}

	public static class Option {

		private String label;
		private String value;
		private Boolean checked;

		public String getLabel() {
			return label;
		}

		public void setLable(String label) {
			this.label = label;
		}

		public String getValue() {
			return value;
		}

		public void setValue(String value) {
			this.value = value;
		}

		public Boolean getChecked() {
			return checked;
		}

		public void setChecked(Boolean checked) {
			this.checked = checked;
		}

	}
}
