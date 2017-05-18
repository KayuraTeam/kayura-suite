package org.kayura.formbuilder.model.field;

import java.text.SimpleDateFormat;

import org.apache.commons.lang.StringUtils;

public class DateRangeField extends DateTimeField {

	private String startLabel;
	private String endLabel;

	protected Object getValue(int idx) {

		Object value = this.getValue();
		if (value != null && value.getClass().isArray()) {
			Object[] v2 = ((Object[]) value);
			if (v2.length == 2) {
				String fmt = this.getFormat();
				if (StringUtils.isNotEmpty(fmt)) {
					SimpleDateFormat format = new SimpleDateFormat(this.getFormat());
					return format.format(v2[idx]);
				} else {
					return v2[idx];
				}
			}
		}
		return value;
	}

	protected void setValue(int idx, Object date) throws Exception {

		Object value = this.getValue();
		if (value != null && value.getClass().isArray()) {
			value = new Object[2];
		}

		Object[] v2 = ((Object[]) value);
		if (v2.length == 2) {
			String fmt = this.getFormat();
			if (StringUtils.isNotEmpty(fmt)) {
				SimpleDateFormat format = new SimpleDateFormat(this.getFormat());
				v2[idx] = format.parseObject((String) date);
			} else {
				v2[idx] = date;
			}
		}

		this.setValue(value);
	}

	public Object getStartValue() {
		return getValue(0);
	}

	public void setStartValue(String date) {
		try {
			setValue(0, date);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Object getEndValue() {
		return getValue(1);
	}

	public void setEndValue(String date) {
		try {
			setValue(1, date);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getStartLabel() {
		return startLabel;
	}

	public void setStartLabel(String startLabel) {
		this.startLabel = startLabel;
	}

	public String getEndLabel() {
		return endLabel;
	}

	public void setEndLabel(String endLabel) {
		this.endLabel = endLabel;
	}

}
