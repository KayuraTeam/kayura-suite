package org.kayura.formbuilder.converter;

import org.apache.commons.lang.StringUtils;
import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.DateRangeField;

import com.fasterxml.jackson.databind.JsonNode;

/**
 * 时段字段转换器.
 * 
 * @author liangxia@live.com
 *
 *         <pre>
 * {
 *     "cid":"c6",
 *     "name":"字段名",
 *     "description":"描述",
 *     "label":"标题",
 *     "field_type":"daterange",
 *     "required":false,
 *     "field_options":{
 *         "start_label":"开始日期",
 *         "end_label":"结束日期",
 *         "format":"yyyy-MM-dd"
 *     }
 * }
 *         </pre>
 *
 */
public class DateRangeFieldJsonConvert extends DateTimeFieldJsonConvert {

	@Override
	public FormField makeFormField() {
		return new DateRangeField();
	}

	@Override
	public String getFieldType() {
		return EDITOR_FIELDTYPE_DATERANGE;
	}

	@Override
	public void convertToModel(FormField formField, JsonNode objectNode) {

		super.convertToModel(formField, objectNode);

		formField.setFieldType(FormField.TYPE_DATERANGE);
	}

	@Override
	public void convertOptionsToModel(FormField formField, JsonNode optionNode) {
		super.convertOptionsToModel(formField, optionNode);

		DateRangeField dateRangeField = (DateRangeField) formField;

		String startLabel = getValueAsString(EDITOR_PROP_STARTLABEL, optionNode);
		if (StringUtils.isNotEmpty(startLabel)) {
			dateRangeField.setStartLabel(startLabel);
		}

		String endLabel = getValueAsString(EDITOR_PROP_ENDLABEL, optionNode);
		if (StringUtils.isNotEmpty(endLabel)) {
			dateRangeField.setEndLabel(endLabel);
		}

	}

}
