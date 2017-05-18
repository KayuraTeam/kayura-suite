package org.kayura.activiti.form;

import java.text.SimpleDateFormat;

public class DateFormType extends AbsDateFormType {

	private static final long serialVersionUID = 1L;

	public DateFormType() {
		this.datePattern = "yyyy-MM-dd";
		this.dateFormat = new SimpleDateFormat(datePattern);
	}

	public DateFormType(String datePattern) {
		this.datePattern = datePattern;
		this.dateFormat = new SimpleDateFormat(datePattern);
	}

	@Override
	public String getName() {
		return "date";
	}

}
