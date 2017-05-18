package org.kayura.activiti.editor.json.converter;

import java.util.Map;

import org.activiti.bpmn.model.BaseElement;
import org.activiti.bpmn.model.EventGateway;
import org.activiti.bpmn.model.FlowElement;
import org.activiti.editor.language.json.converter.BaseBpmnJsonConverter;
import org.activiti.editor.language.json.converter.EventGatewayJsonConverter;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

public class EventGatewayJsonExConverter extends EventGatewayJsonConverter {

	public static void fillTypes(Map<String, Class<? extends BaseBpmnJsonConverter>> convertersToBpmnMap,
			Map<Class<? extends BaseElement>, Class<? extends BaseBpmnJsonConverter>> convertersToJsonMap) {

		fillJsonTypes(convertersToBpmnMap);
		fillBpmnTypes(convertersToJsonMap);
	}

	public static void fillJsonTypes(Map<String, Class<? extends BaseBpmnJsonConverter>> convertersToBpmnMap) {
		convertersToBpmnMap.put(STENCIL_GATEWAY_EVENT, EventGatewayJsonExConverter.class);
	}

	public static void fillBpmnTypes(
			Map<Class<? extends BaseElement>, Class<? extends BaseBpmnJsonConverter>> convertersToJsonMap) {
		convertersToJsonMap.put(EventGateway.class, EventGatewayJsonExConverter.class);
	}

	protected void convertElementToJson(ObjectNode propertiesNode, BaseElement baseElement) {
		super.convertElementToJson(propertiesNode, baseElement);
		ExtendPropertyUtils.addExtendProperties(baseElement, propertiesNode);
	}

	protected FlowElement convertJsonToElement(JsonNode elementNode, JsonNode modelNode,
			Map<String, JsonNode> shapeMap) {
		FlowElement startEvent = super.convertJsonToElement(elementNode, modelNode, shapeMap);
		ExtendPropertyUtils.convertJsonToExtendProperties(elementNode, startEvent);
		return startEvent;
	}

}
