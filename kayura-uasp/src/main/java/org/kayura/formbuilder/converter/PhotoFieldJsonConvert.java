package org.kayura.formbuilder.converter;

import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.PhotoField;

import com.fasterxml.jackson.databind.JsonNode;

/**
 * 
 * @author liangxia@live.com
 *
 * <pre>
 * {
 *     "cid":"c21",
 *     "name":"photo",
 *     "description":"请选择图片",
 *     "label":"图片",
 *     "field_type":"photo",
 *     "required":false,
 *     "field_options":{
 *     }
 * }
 * </pre>
 */
public class PhotoFieldJsonConvert extends LabelFieldJsonConvert {

	@Override
	public FormField makeFormField() {
		return new PhotoField();
	}

	@Override
	public String getFieldType() {
		return EDITOR_FIELDTYPE_PHOTO;
	}

	@Override
	public void convertToModel(FormField formField, JsonNode elementNode) {
		super.convertToModel(formField, elementNode);
		formField.setFieldType(FormField.TYPE_PHOTO);
	}
}
