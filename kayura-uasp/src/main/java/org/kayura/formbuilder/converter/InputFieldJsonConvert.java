package org.kayura.formbuilder.converter;

import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.InputField;

import com.fasterxml.jackson.databind.JsonNode;

public abstract class InputFieldJsonConvert extends LabelFieldJsonConvert {

	@Override
	public abstract FormField makeFormField();

	@Override
	public abstract String getFieldType();

	public void convertToModel(FormField formField, JsonNode elementNode) {

		super.convertToModel(formField, elementNode);

		InputField inputField = (InputField) formField;

		Boolean required = getValueAsBoolean(EDITOR_PROP_REQUIRED, elementNode);
		if (required != null) {
			inputField.setRequired(required);
		}
	}

	public void convertToJson(JsonNode elementNode, FormField baseField) {

	}

}
