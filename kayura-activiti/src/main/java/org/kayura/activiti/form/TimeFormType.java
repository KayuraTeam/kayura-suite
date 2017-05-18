package org.kayura.activiti.form;

import java.text.SimpleDateFormat;

public class TimeFormType extends AbsDateFormType {

	private static final long serialVersionUID = 1L;

	public TimeFormType() {
		this.datePattern = "HH:mm:ss";
		this.dateFormat = new SimpleDateFormat(datePattern);
	}

	public TimeFormType(String datePattern) {
		this.datePattern = datePattern;
		this.dateFormat = new SimpleDateFormat(datePattern);
	}

	public String getName() {
		return "time";
	}

}
