package org.kayura.formbuilder.converter;

import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.TableField;

import com.fasterxml.jackson.databind.JsonNode;

public class StartTableFieldJsonConvert extends LabelFieldJsonConvert {

	@Override
	public String getFieldType() {
		return EDITOR_FIELDTYPE_TABLE_START;
	}

	@Override
	public FormField makeFormField() {
		return new TableField();
	}

	@Override
	public void convertToModel(FormField formField, JsonNode elementNode) {
		super.convertToModel(formField, elementNode);
		formField.setFieldType(FormField.TYPE_TABLE);
	}

}
