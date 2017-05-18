package org.kayura.activiti.form;

import java.util.LinkedHashMap;
import java.util.Map;

import org.activiti.bpmn.model.FormProperty;
import org.activiti.bpmn.model.FormValue;
import org.activiti.engine.ActivitiIllegalArgumentException;
import org.activiti.engine.form.AbstractFormType;
import org.activiti.engine.impl.form.BooleanFormType;
import org.activiti.engine.impl.form.DoubleFormType;
import org.activiti.engine.impl.form.EnumFormType;
import org.activiti.engine.impl.form.LongFormType;
import org.activiti.engine.impl.form.StringFormType;
import org.apache.commons.lang3.StringUtils;

public class FormTypes extends org.activiti.engine.impl.form.FormTypes {

	public FormTypes() {
		addFormType(new StringFormType());
		addFormType(new LongFormType());
		addFormType(new BooleanFormType());
		addFormType(new DoubleFormType());
	}

	@Override
	public AbstractFormType parseFormPropertyType(FormProperty formProperty) {
		AbstractFormType formType = null;

		if ("enum".equals(formProperty.getType())) {

			Map<String, String> values = new LinkedHashMap<String, String>();
			for (FormValue formValue : formProperty.getFormValues()) {
				values.put(formValue.getId(), formValue.getName());
			}
			formType = new EnumFormType(values);

		} else if (StringUtils.isNotEmpty(formProperty.getType())) {
			formType = formTypes.get(formProperty.getType());
			if (formType == null) {
				throw new ActivitiIllegalArgumentException(
						"unknown type '" + formProperty.getType() + "' " + formProperty.getId());
			}
		}
		return formType;
	}

}
