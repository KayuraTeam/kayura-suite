package org.kayura.formbuilder.converter;

import org.apache.commons.lang.StringUtils;
import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.TableField;

import com.fasterxml.jackson.databind.JsonNode;

public class EndTableFieldJsonConvert extends BaseFormJsonConvert {

	@Override
	public String getFieldType() {
		return EDITOR_FIELDTYPE_TABLE_END;
	}

	@Override
	public FormField makeFormField() {
		return new TableField();
	}

	@Override
	public void convertToModel(FormField formField, JsonNode elementNode) {

		JsonNode fieldOptionNode = elementNode.get(EDITOR_PROP_FIELDOPTIONS);
		if (fieldOptionNode != null) {
			convertOptionsToModel(formField, fieldOptionNode);
		}
	}

	@Override
	public void convertOptionsToModel(FormField formField, JsonNode optionNode) {
		super.convertOptionsToModel(formField, optionNode);

		TableField tableField = (TableField) formField;

		String actionName = getValueAsString(EDITOR_PROP_ACTION_NAME, optionNode);
		if (StringUtils.isNotEmpty(actionName)) {
			tableField.setActionName(actionName);
		}
	}

}
