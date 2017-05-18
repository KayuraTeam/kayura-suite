package org.kayura.formbuilder.converter;

import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.SelectField;

import com.fasterxml.jackson.databind.JsonNode;

/**
 * 选择项转换器
 * 
 * @author liangxia@live.com
 *
 * <pre>
 * {
 *     "cid":"c86",
 *     "label":"分类类型",
 *     "field_type":"select",
 *     "required":true,
 *     "name":"selectType",
 *     "description":"请选择其中一项",
 *     "field_options":{
 *         "options":[
 *             {"label":"选项1","checked":false,"value":"v1"},
 *             {"label":"选项2","checked":false,"value":"v2"}
 *         ],
 *         "include_other_option":false
 *     }
 * }
 * </pre>
 * 
 */
public class SelectFieldJsonConvert extends InputFieldJsonConvert {

	@Override
	public FormField makeFormField() {
		return new SelectField();
	}

	@Override
	public String getFieldType() {
		return EDITOR_FIELDTYPE_SELECT;
	}

	@Override
	public void convertToModel(FormField formField, JsonNode elementNode) {
		super.convertToModel(formField, elementNode);
		formField.setFieldType(FormField.TYPE_SELECT);
	}

	@Override
	public void convertOptionsToModel(FormField formField, JsonNode optionNode) {
		super.convertOptionsToModel(formField, optionNode);

		SelectField selectField = (SelectField) formField;

		JsonNode optionsArray = optionNode.get(EDITOR_OPTIONS);
		if (optionsArray != null) {
			for (JsonNode jsonNode : optionsArray) {

				String lable = getValueAsString(EDITOR_OPTION_LABEL, jsonNode);
				String value = getValueAsString(EDITOR_OPTION_VALUE, jsonNode);
				Boolean checked = getValueAsBoolean(EDITOR_OPTION_CHECKED, jsonNode);

				selectField.addOption(lable, value, checked);
			}
		}
	}
}
