package org.kayura.formbuilder.converter;

import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.MultiSelectField;

import com.fasterxml.jackson.databind.JsonNode;

/**
 * 多选项转换器
 * 
 * @author liangxia@live.com
 *
 * <pre>
 * {
 *     "label":"你的爱好",
 *     "field_type":"multiselect",
 *     "required":true,
 *     "cid":"c9",
 *     "name":"interest",
 *     "description":"请选择你的兴趣爱好.",
 *     "field_options":{
 *         "options":[
 *             {"label":"选项一","checked":true},
 *             {"label":"选项二","checked":false}
 *         ]
 *     }
 * }
 * </pre>
 * 
 */
public class MultiSelectFieldJsonConvert extends SelectFieldJsonConvert {

	@Override
	public FormField makeFormField() {
		return new MultiSelectField();
	}

	@Override
	public String getFieldType() {
		return EDITOR_FIELDTYPE_MULTISELECT;
	}

	@Override
	public void convertToModel(FormField formField, JsonNode elementNode) {
		super.convertToModel(formField, elementNode);
		formField.setFieldType(FormField.TYPE_MULTISELECT);
	}

}
