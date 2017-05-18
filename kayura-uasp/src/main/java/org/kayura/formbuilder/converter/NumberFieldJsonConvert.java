package org.kayura.formbuilder.converter;

import org.apache.commons.lang.StringUtils;
import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.NumberField;

import com.fasterxml.jackson.databind.JsonNode;

/**
 * 数字字段转换器
 * 
 * @author liangxia@live.com
 *
 * <pre>
 * JSON 格式
 * {
 *     "cid":"c59",
 *     "label":"数字",
 *     "field_type":"number",
 *     "name":"amount",
 *     "description":"请输入数量"
 *     "required":true,
 *     "field_options":{
 *         "min":"1",
 *         "max":"200",
 *         "units":"公斤",
 *         "integer_only":false
 *     }
 * }
 * </pre>
 * 
 */
public class NumberFieldJsonConvert extends InputFieldJsonConvert {

	@Override
	public FormField makeFormField() {
		return new NumberField();
	}

	@Override
	public String getFieldType() {
		return EDITOR_FIELDTYPE_NUMBER;
	}

	@Override
	public void convertToModel(FormField formField, JsonNode elementNode) {
		super.convertToModel(formField, elementNode);

		formField.setFieldType(FormField.TYPE_NUMBER);
	}

	@Override
	public void convertOptionsToModel(FormField formField, JsonNode optionNode) {

		super.convertOptionsToModel(formField, optionNode);

		NumberField numberField = (NumberField) formField;

		Integer max = getValueAsInteger(EDITOR_PROP_MAX, optionNode);
		if (max != null) {
			numberField.setMax(max);
		}

		Integer min = getValueAsInteger(EDITOR_PROP_MIN, optionNode);
		if (min != null) {
			numberField.setMin(min);
		}

		String unit = getValueAsString(EDITOR_PROP_UNIT, optionNode);
		if (StringUtils.isNotEmpty(unit)) {
			numberField.setUnit(unit);
		}
	}
}
