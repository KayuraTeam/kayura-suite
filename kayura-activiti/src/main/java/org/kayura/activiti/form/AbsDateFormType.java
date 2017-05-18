package org.kayura.activiti.form;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import org.activiti.engine.ActivitiIllegalArgumentException;
import org.activiti.engine.form.AbstractFormType;
import org.apache.commons.lang3.StringUtils;

public abstract class AbsDateFormType extends AbstractFormType {

	private static final long serialVersionUID = 1L;

	protected String datePattern;
	protected SimpleDateFormat dateFormat;

	public Object getInformation(String key) {
		if ("datePattern".equals(key)) {
			return datePattern;
		}
		return null;
	}

	public Object convertFormValueToModelValue(String propertyValue) {

		if (StringUtils.isEmpty(propertyValue)) {
			return null;
		}

		try {
			if (propertyValue.contains("CST")) {
				SimpleDateFormat cstFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.US);
				return cstFormat.parseObject(propertyValue);
			} else {
				return dateFormat.parseObject(propertyValue);
			}
		} catch (ParseException e) {
			throw new ActivitiIllegalArgumentException("invalid date value " + propertyValue);
		}
	}

	public String convertModelValueToFormValue(Object modelValue) {
		if (modelValue == null) {
			return null;
		}
		return dateFormat.format(modelValue);
	}
}
