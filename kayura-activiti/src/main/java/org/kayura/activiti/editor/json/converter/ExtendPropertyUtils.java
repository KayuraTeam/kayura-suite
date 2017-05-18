package org.kayura.activiti.editor.json.converter;

import java.util.ArrayList;
import java.util.List;

import org.activiti.bpmn.model.BaseElement;
import org.activiti.bpmn.model.ExtensionAttribute;
import org.activiti.bpmn.model.ExtensionElement;
import org.activiti.bpmn.model.FlowElement;
import org.activiti.editor.language.json.converter.BpmnJsonConverterUtil;
import org.activiti.editor.language.json.converter.util.JsonConverterUtil;
import org.activiti.engine.impl.bpmn.parser.BpmnParse;
import org.activiti.engine.impl.el.ExpressionManager;
import org.apache.commons.lang3.StringUtils;
import org.kayura.activiti.bpmn.handler.ExtendPropertyHandler;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

public class ExtendPropertyUtils {

	private static ObjectMapper objectMapper = new ObjectMapper();

	public static final String ACTIVITI_NAMESPACE = "http://activiti.org/bpmn";
	public static final String PROPERTY_EXTEND_ELEMENT_NAME = "extendProperty";
	public static final String PROPERTY_EXTEND_PROPERTIES = "extendproperties";
	public static final String PROPERTY_EXTEND_ID = "id";
	public static final String PROPERTY_EXTEND_NAME = "name";
	public static final String PROPERTY_EXTEND_TYPE = "type";
	public static final String PROPERTY_EXTEND_EXPRESSION = "expression";
	public static final String PROPERTY_EXTEND_VALUE = "variable";

	public static void addExtendProperties(BaseElement element, ObjectNode propertiesNode) {

		List<ExtensionElement> elements = element.getExtensionElements().get(PROPERTY_EXTEND_ELEMENT_NAME);
		if (elements != null) {

			ObjectNode extendPropertiesNode = objectMapper.createObjectNode();
			ArrayNode propertiesArrayNode = objectMapper.createArrayNode();
			for (ExtensionElement ee : elements) {

				ObjectNode propertyItemNode = objectMapper.createObjectNode();
				propertyItemNode.put(PROPERTY_EXTEND_ID, ee.getAttributeValue(null, PROPERTY_EXTEND_ID));
				propertyItemNode.put(PROPERTY_EXTEND_NAME, ee.getAttributeValue(null, PROPERTY_EXTEND_NAME));
				propertyItemNode.put(PROPERTY_EXTEND_VALUE, ee.getAttributeValue(null, PROPERTY_EXTEND_VALUE));
				propertyItemNode.put(PROPERTY_EXTEND_TYPE, ee.getAttributeValue(null, PROPERTY_EXTEND_TYPE));

				String expression = ee.getAttributeValue(null, PROPERTY_EXTEND_EXPRESSION);
				if (StringUtils.isNotEmpty(expression)) {
					propertyItemNode.put(PROPERTY_EXTEND_EXPRESSION, expression);
				} else {
					propertyItemNode.putNull(PROPERTY_EXTEND_EXPRESSION);
				}

				propertiesArrayNode.add(propertyItemNode);
			}

			extendPropertiesNode.set("extendProperties", propertiesArrayNode);
			propertiesNode.set(PROPERTY_EXTEND_PROPERTIES, extendPropertiesNode);
		}
	}

	public static void convertJsonToExtendProperties(JsonNode objectNode, BaseElement element) {

		JsonNode extendPropertiesNode = getProperty(PROPERTY_EXTEND_PROPERTIES, objectNode);
		if (extendPropertiesNode != null) {
			extendPropertiesNode = BpmnJsonConverterUtil.validateIfNodeIsTextual(extendPropertiesNode);
			JsonNode propertiesArray = extendPropertiesNode.get("extendProperties");
			if (propertiesArray != null) {
				for (JsonNode formNode : propertiesArray) {
					JsonNode formIdNode = formNode.get(PROPERTY_EXTEND_ID);
					if (formIdNode != null && StringUtils.isNotEmpty(formIdNode.asText())) {

						ExtensionElement extendElement = new ExtensionElement();
						extendElement.setName(PROPERTY_EXTEND_ELEMENT_NAME);
						extendElement.setNamespace(ACTIVITI_NAMESPACE);

						ExtensionAttribute idAttr = new ExtensionAttribute(PROPERTY_EXTEND_ID);
						idAttr.setValue(getValueAsString(PROPERTY_EXTEND_ID, formNode));
						extendElement.addAttribute(idAttr);

						ExtensionAttribute nameAttr = new ExtensionAttribute(PROPERTY_EXTEND_NAME);
						nameAttr.setValue(getValueAsString(PROPERTY_EXTEND_NAME, formNode));
						extendElement.addAttribute(nameAttr);

						ExtensionAttribute valueAttr = new ExtensionAttribute(PROPERTY_EXTEND_VALUE);
						valueAttr.setValue(getValueAsString(PROPERTY_EXTEND_VALUE, formNode));
						extendElement.addAttribute(valueAttr);

						ExtensionAttribute typeAttr = new ExtensionAttribute(PROPERTY_EXTEND_TYPE);
						typeAttr.setValue(getValueAsString(PROPERTY_EXTEND_TYPE, formNode));
						extendElement.addAttribute(typeAttr);

						ExtensionAttribute expressionAttr = new ExtensionAttribute(PROPERTY_EXTEND_EXPRESSION);
						expressionAttr.setValue(getValueAsString(PROPERTY_EXTEND_EXPRESSION, formNode));
						extendElement.addAttribute(expressionAttr);

						element.addExtensionElement(extendElement);
					}
				}
			}
		}
	}

	public static List<ExtendPropertyHandler> parseExtendProperties(BpmnParse bpmnParse, FlowElement element) {

		List<ExtendPropertyHandler> extendProperties = new ArrayList<ExtendPropertyHandler>();
		
		ExpressionManager expressionManager = bpmnParse.getExpressionManager();
		List<ExtensionElement> elements = element.getExtensionElements().get(PROPERTY_EXTEND_ELEMENT_NAME);
		if (elements != null) {
			for (ExtensionElement ee : elements) {

				ExtendPropertyHandler extendProperty = new ExtendPropertyHandler();
				extendProperty.setId(ee.getAttributeValue(null, PROPERTY_EXTEND_ID));
				extendProperty.setName(ee.getAttributeValue(null, PROPERTY_EXTEND_NAME));
				extendProperty.setValue(ee.getAttributeValue(null, PROPERTY_EXTEND_VALUE));
				extendProperty.setType(ee.getAttributeValue(null, PROPERTY_EXTEND_TYPE));

				String expr = ee.getAttributeValue(null, PROPERTY_EXTEND_EXPRESSION);
				if (StringUtils.isNotEmpty(expr)) {
					extendProperty.setExpression(expressionManager.createExpression(expr));
				}

				extendProperties.add(extendProperty);
			}
		}

		return extendProperties;
	}

	protected static String getValueAsString(String name, JsonNode objectNode) {
		String propertyValue = null;
		JsonNode propertyNode = objectNode.get(name);
		if (propertyNode != null && propertyNode.isNull() == false) {
			propertyValue = propertyNode.asText();
		}
		return propertyValue;
	}

	protected static JsonNode getProperty(String name, JsonNode objectNode) {
		return JsonConverterUtil.getProperty(name, objectNode);
	}

}
