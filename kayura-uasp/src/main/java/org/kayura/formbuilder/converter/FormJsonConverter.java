package org.kayura.formbuilder.converter;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.FormModel;
import org.kayura.formbuilder.model.field.TableField;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

public class FormJsonConverter implements EditorJsonConstants {

	private List<BaseFormJsonConvert> jsonConverters;

	public FormJsonConverter() {
		jsonConverters = new ArrayList<BaseFormJsonConvert>();
		jsonConverters.add(new LabelFieldJsonConvert());
		jsonConverters.add(new TextFieldJsonConvert());
		jsonConverters.add(new TextAreaFieldJsonConvert());
		jsonConverters.add(new DateTimeFieldJsonConvert());
		jsonConverters.add(new DateFieldJsonConvert());
		jsonConverters.add(new DateRangeFieldJsonConvert());
		jsonConverters.add(new NumberFieldJsonConvert());
		jsonConverters.add(new MoneyFieldJsonConvert());
		jsonConverters.add(new SelectFieldJsonConvert());
		jsonConverters.add(new MultiSelectFieldJsonConvert());
		jsonConverters.add(new PhotoFieldJsonConvert());
		jsonConverters.add(new AttachmentFieldJsonConvert());
		jsonConverters.add(new StartTableFieldJsonConvert());
		jsonConverters.add(new EndTableFieldJsonConvert());
	}

	public ObjectNode convertToJson(FormModel model) {

		return null;
	}

	public FormModel convertToModel(JsonNode modelNode) {

		FormModel formModel = new FormModel();
		convertToModel(formModel, modelNode);
		return formModel;
	}

	public void convertToModel(FormModel formModel, JsonNode modelNode) {

		FormField tableField = null;
		for (JsonNode fieldNode : modelNode) {
			String fieldType = FormJsonConverterUtil.getFieldType(fieldNode);
			if (StringUtils.isNotEmpty(fieldType)) {

				for (BaseFormJsonConvert converter : this.jsonConverters) {

					if (fieldType.equalsIgnoreCase(EDITOR_FIELDTYPE_TABLE_START)) {

						if (converter.getFieldType().equalsIgnoreCase(EDITOR_FIELDTYPE_TABLE_START)) {

							tableField = converter.makeFormField();
							converter.convertToModel(tableField, fieldNode);
							formModel.addField(tableField);
							break;
						}
					} else if (fieldType.equalsIgnoreCase(EDITOR_FIELDTYPE_TABLE_END)) {

						if (converter.getFieldType().equalsIgnoreCase(EDITOR_FIELDTYPE_TABLE_END)) {

							converter.convertToModel(tableField, fieldNode);
							tableField = null;
							break;
						}

					} else if (tableField != null) {

						if (converter.getFieldType().equalsIgnoreCase(fieldType)) {
							FormField formField = converter.makeFormField();
							converter.convertToModel(formField, fieldNode);
							((TableField) tableField).addChildren(formField);
							break;
						}
					} else {

						if (converter.getFieldType().equalsIgnoreCase(fieldType)) {
							FormField formField = converter.makeFormField();
							converter.convertToModel(formField, fieldNode);
							formModel.addField(formField);
							break;
						}
					}
				}
			}
		}
	}

}
