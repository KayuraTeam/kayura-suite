package org.kayura.formbuilder.converter;

import org.apache.commons.lang.StringUtils;
import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.DateTimeField;

import com.fasterxml.jackson.databind.JsonNode;

/**
 * 日期字段转换器.
 * 
 * @author liangxia@live.com
 * <pre>
 * {
 *     "cid":"c5",
 *     "name":"beginTime",
 *     "description":"请输入开始时间",
 *     "label":"开始时间",
 *     "field_type":"date",
 *     "required":true,
 *     "field_options":{
 *         "format":"yyyy-MM-dd"
 *     }
 * }
 * </pre>
 */
public class DateTimeFieldJsonConvert extends InputFieldJsonConvert {

	@Override
	public FormField makeFormField() {
		return new DateTimeField();
	}

	@Override
	public String getFieldType() {
		return EDITOR_FIELDTYPE_DATETIME;
	}

	@Override
	public void convertToModel(FormField formField, JsonNode elementNode) {

		super.convertToModel(formField, elementNode);
		formField.setFieldType(FormField.TYPE_DATETIME);
	}

	@Override
	public void convertOptionsToModel(FormField formField, JsonNode optionNode) {
		super.convertOptionsToModel(formField, optionNode);

		DateTimeField dateField = (DateTimeField) formField;

		String format = getValueAsString(EDITOR_PROP_FORMAT, optionNode);
		if (StringUtils.isNotEmpty(format)) {
			dateField.setFormat(format);
		}

	}
}
