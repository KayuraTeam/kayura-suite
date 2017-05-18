package org.kayura.activiti.editor.json.converter;

import org.activiti.editor.language.json.converter.BpmnJsonConverter;

public class BpmnJsonExConverter extends BpmnJsonConverter {

	static {
		UserTaskJsonExConverter.fillTypes(convertersToBpmnMap, convertersToJsonMap);

		StartEventJsonExConverter.fillTypes(convertersToBpmnMap, convertersToJsonMap);
		EndEventJsonExConverter.fillTypes(convertersToBpmnMap, convertersToJsonMap);

		ExclusiveGatewayJsonExConverter.fillTypes(convertersToBpmnMap, convertersToJsonMap);
		ParallelGatewayJsonExConverter.fillTypes(convertersToBpmnMap, convertersToJsonMap);
		InclusiveGatewayJsonExConverter.fillTypes(convertersToBpmnMap, convertersToJsonMap);
		EventGatewayJsonExConverter.fillTypes(convertersToBpmnMap, convertersToJsonMap);
	}
}
