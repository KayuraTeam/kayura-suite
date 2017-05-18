package org.kayura.formbuilder.converter;

import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.DateField;

import com.fasterxml.jackson.databind.JsonNode;

public class DateFieldJsonConvert extends DateTimeFieldJsonConvert {

	@Override
	public FormField makeFormField() {
		return new DateField();
	}

	@Override
	public String getFieldType() {
		return EDITOR_FIELDTYPE_DATE;
	}

	@Override
	public void convertToModel(FormField formField, JsonNode elementNode) {

		super.convertToModel(formField, elementNode);
		formField.setFieldType(FormField.TYPE_DATE);
	}

	@Override
	public void convertOptionsToModel(FormField formField, JsonNode optionNode) {
		super.convertOptionsToModel(formField, optionNode);
	}

}
