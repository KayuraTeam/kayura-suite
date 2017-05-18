package org.kayura.activiti.form;

import org.activiti.engine.form.AbstractFormType;

public class TextFormType extends AbstractFormType {

	private static final long serialVersionUID = 1L;

	public String getName() {
		return "text";
	}

	public String getMimeType() {
		return "text/plain";
	}

	public Object convertFormValueToModelValue(String propertyValue) {
		return propertyValue;
	}

	public String convertModelValueToFormValue(Object modelValue) {
		return (String) modelValue;
	}
}
