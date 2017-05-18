package org.kayura.formbuilder.converter;

import org.apache.commons.lang.StringUtils;
import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.TextField;

import com.fasterxml.jackson.databind.JsonNode;

/**
 * 文本字段转换器
 * 
 * @author liangxia@live.com
 *
 * <pre>
 * {
 * 		"cid":"组件Id",
 * 		"name":"名称",
 * 		"label":"标签",
 * 		"placeholder": "备注信息",
 * 		"description":"123"
 * 		"field_type":"text",
 * 		"required":true,
 * 		"field_options":{
 * 			"minlength":"1",
 * 			"maxlength":"12",
 * 			"length_units": "words"
 * 		}
 * }
 * </pre>
 * 
 */
public class TextFieldJsonConvert extends InputFieldJsonConvert {

	@Override
	public FormField makeFormField() {
		return new TextField();
	}

	@Override
	public String getFieldType() {
		return EDITOR_FIELDTYPE_TEXT;
	}

	@Override
	public void convertToModel(FormField formField, JsonNode elementNode) {

		super.convertToModel(formField, elementNode);

		String placeHolder = FormJsonConverterUtil.getPlaceHolder(elementNode);
		if (StringUtils.isNotEmpty(placeHolder)) {

			TextField textField = (TextField) formField;
			textField.setPlaceHolder(placeHolder);
		}

		formField.setFieldType(FormField.TYPE_TEXT);
	}

	@Override
	public void convertOptionsToModel(FormField formField, JsonNode optionNode) {
		super.convertOptionsToModel(formField, optionNode);

		TextField textField = (TextField) formField;

		String lengthUnits = getValueAsString(EDITOR_PROP_LENGTH_UNITS, optionNode);
		if (StringUtils.isNotEmpty(lengthUnits)) {
			textField.setLengthUnits(lengthUnits);
		}

		Integer maxlength = getValueAsInteger(EDITOR_PROP_MAXLENGTH, optionNode);
		if (maxlength != null) {
			textField.setMaxLength(maxlength);
		}

		Integer minlength = getValueAsInteger(EDITOR_PROP_MINLENGTH, optionNode);
		if (minlength != null) {
			textField.setMinLength(minlength);
		}

	}
}
