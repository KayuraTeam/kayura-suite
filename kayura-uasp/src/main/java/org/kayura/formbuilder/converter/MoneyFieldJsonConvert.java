package org.kayura.formbuilder.converter;

import org.apache.commons.lang.StringUtils;
import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.MoneyField;

import com.fasterxml.jackson.databind.JsonNode;

/**
 * 金额字段转换器
 * 
 * @author liangxia@live.com
 *
 * <pre>
 * {
 *     "cid":"c68",
 *     "label":"金额",
 *     "required":true,
 *     "name":"money",
 *     "description":"请输入金额",
 *     "field_type":"money",
 *     "field_options":{
 *         "units":"元"
 *     }
 * }
 * </pre>
 * 
 */
public class MoneyFieldJsonConvert extends LabelFieldJsonConvert {

	@Override
	public FormField makeFormField() {
		return new MoneyField();
	}

	@Override
	public String getFieldType() {
		return EDITOR_FIELDTYPE_MONEY;
	}

	@Override
	public void convertToModel(FormField formField, JsonNode elementNode) {
		super.convertToModel(formField, elementNode);
		formField.setFieldType(FormField.TYPE_MONEY);
	}

	@Override
	public void convertOptionsToModel(FormField formField, JsonNode optionNode) {

		super.convertOptionsToModel(formField, optionNode);

		MoneyField moneyField = (MoneyField) formField;

		String unit = getValueAsString(EDITOR_PROP_UNIT, optionNode);
		if (StringUtils.isNotEmpty(unit)) {
			moneyField.setUnit(unit);
		}
	}
}
