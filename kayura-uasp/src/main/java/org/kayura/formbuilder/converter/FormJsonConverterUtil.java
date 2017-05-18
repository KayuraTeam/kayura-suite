package org.kayura.formbuilder.converter;

import com.fasterxml.jackson.databind.JsonNode;

public class FormJsonConverterUtil implements EditorJsonConstants {

	public static String getId(JsonNode objectNode) {

		return getValueAsString(EDITOR_PROP_ID, objectNode);
	}

	public static String getFieldType(JsonNode objectNode) {

		return getValueAsString(EDITOR_PROP_FIELDTYPE, objectNode);
	}

	public static String getName(JsonNode objectNode) {

		return getValueAsString(EDITOR_PROP_NAME, objectNode);
	}

	public static String getLable(JsonNode objectNode) {

		return getValueAsString(EDITOR_PROP_LABEL, objectNode);
	}

	public static String getDescription(JsonNode objectNode) {

		return getValueAsString(EDITOR_PROP_DESCRIPTION, objectNode);
	}

	public static String getPlaceHolder(JsonNode objectNode) {

		return getValueAsString(EDITOR_PROP_PLACEHOLDER, objectNode);
	}

	public static String getValueAsString(String name, JsonNode objectNode) {
		String propertyValue = null;
		JsonNode propertyNode = objectNode.get(name);
		if (propertyNode != null && propertyNode.isNull() == false) {
			propertyValue = propertyNode.asText();
		}
		return propertyValue;
	}

	public static Boolean getValueAsBoolean(String name, JsonNode objectNode) {
		Boolean propertyValue = null;
		JsonNode propertyNode = objectNode.get(name);
		if (propertyNode != null && propertyNode.isNull() == false) {
			propertyValue = propertyNode.asBoolean();
		}
		return propertyValue;
	}

	public static Integer getValueAsInteger(String name, JsonNode objectNode) {
		Integer propertyValue = null;
		JsonNode propertyNode = objectNode.get(name);
		if (propertyNode != null && propertyNode.isNull() == false) {
			propertyValue = propertyNode.asInt();
		}
		return propertyValue;
	}

	public static Double getValueAsDouble(String name, JsonNode objectNode) {
		Double propertyValue = null;
		JsonNode propertyNode = objectNode.get(name);
		if (propertyNode != null && propertyNode.isNull() == false) {
			propertyValue = propertyNode.asDouble();
		}
		return propertyValue;
	}
}
