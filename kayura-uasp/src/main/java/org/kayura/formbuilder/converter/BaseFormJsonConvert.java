package org.kayura.formbuilder.converter;

import org.apache.commons.lang.StringUtils;
import org.kayura.formbuilder.model.FormField;

import com.fasterxml.jackson.databind.JsonNode;

public abstract class BaseFormJsonConvert implements EditorJsonConstants {

	public abstract String getFieldType();

	public abstract FormField makeFormField();

	public void convertToModel(FormField formField, JsonNode elementNode) {

		String id = FormJsonConverterUtil.getId(elementNode);
		if (StringUtils.isNotEmpty(id)) {
			formField.setId(id);
		}

		String name = FormJsonConverterUtil.getName(elementNode);
		if (StringUtils.isNotEmpty(name)) {
			formField.setName(name);
		}

		String label = FormJsonConverterUtil.getLable(elementNode);
		if (StringUtils.isNotEmpty(label)) {
			formField.setLabel(label);
		}

		String description = FormJsonConverterUtil.getDescription(elementNode);
		if (StringUtils.isNotEmpty(description)) {
			formField.setDescription(description);
		}

		JsonNode fieldOptionNode = elementNode.get(EDITOR_PROP_FIELDOPTIONS);
		if (fieldOptionNode != null) {
			convertOptionsToModel(formField, fieldOptionNode);
		}
	}

	public void convertOptionsToModel(FormField formField, JsonNode optionNode) {

	}

	public void convertToJson(JsonNode elementNode, FormField baseField) {

	}

	protected static String getValueAsString(String name, JsonNode objectNode) {
		return FormJsonConverterUtil.getValueAsString(name, objectNode);
	}

	protected static Boolean getValueAsBoolean(String name, JsonNode objectNode) {
		return FormJsonConverterUtil.getValueAsBoolean(name, objectNode);
	}

	protected static Integer getValueAsInteger(String name, JsonNode objectNode) {
		return FormJsonConverterUtil.getValueAsInteger(name, objectNode);
	}

	protected static Double getValueAsDouble(String name, JsonNode objectNode) {
		return FormJsonConverterUtil.getValueAsDouble(name, objectNode);
	}
}
