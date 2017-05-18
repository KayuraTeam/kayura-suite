package org.kayura.formbuilder.converter;

import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.TextAreaField;

import com.fasterxml.jackson.databind.JsonNode;

public class TextAreaFieldJsonConvert extends TextFieldJsonConvert {

	@Override
	public FormField makeFormField() {
		return new TextAreaField();
	}

	@Override
	public String getFieldType() {
		return EDITOR_FIELDTYPE_TEXTAREA;
	}

	@Override
	public void convertToModel(FormField formField, JsonNode elementNode) {
		super.convertToModel(formField, elementNode);
		formField.setFieldType(FormField.TYPE_TEXTAREA);
	}
}
