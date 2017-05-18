package org.kayura.activiti.form;

import java.text.SimpleDateFormat;

public class DateTimeFormType extends AbsDateFormType {

	private static final long serialVersionUID = 1L;

	public DateTimeFormType() {
		this.datePattern = "yyyy-MM-dd HH:mm:ss";
		this.dateFormat = new SimpleDateFormat(datePattern);
	}

	public DateTimeFormType(String datePattern) {
		this.datePattern = datePattern;
		this.dateFormat = new SimpleDateFormat(datePattern);
	}

	public String getName() {
		return "datetime";
	}
}
