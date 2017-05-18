package org.kayura.formbuilder.model;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.kayura.formbuilder.model.field.AttachmentField;
import org.kayura.formbuilder.model.field.DateField;
import org.kayura.formbuilder.model.field.DateRangeField;
import org.kayura.formbuilder.model.field.DateTimeField;
import org.kayura.formbuilder.model.field.LabelField;
import org.kayura.formbuilder.model.field.MoneyField;
import org.kayura.formbuilder.model.field.MultiSelectField;
import org.kayura.formbuilder.model.field.NumberField;
import org.kayura.formbuilder.model.field.PhotoField;
import org.kayura.formbuilder.model.field.SelectField;
import org.kayura.formbuilder.model.field.TableField;
import org.kayura.formbuilder.model.field.TextAreaField;
import org.kayura.formbuilder.model.field.TextField;
import org.kayura.formbuilder.model.field.TimeField;

public class FormField {

	public static Map<String, Class<?>> FIELD_TYPES;

	static {
		FIELD_TYPES = new HashMap<String, Class<?>>();
		FIELD_TYPES.put(FormField.TYPE_LABLE, LabelField.class);
		FIELD_TYPES.put(FormField.TYPE_TEXT, TextField.class);
		FIELD_TYPES.put(FormField.TYPE_TEXTAREA, TextAreaField.class);
		FIELD_TYPES.put(FormField.TYPE_DATETIME, DateTimeField.class);
		FIELD_TYPES.put(FormField.TYPE_DATE, DateField.class);
		FIELD_TYPES.put(FormField.TYPE_TIME, TimeField.class);
		FIELD_TYPES.put(FormField.TYPE_DATERANGE, DateRangeField.class);
		FIELD_TYPES.put(FormField.TYPE_NUMBER, NumberField.class);
		FIELD_TYPES.put(FormField.TYPE_MONEY, MoneyField.class);
		FIELD_TYPES.put(FormField.TYPE_SELECT, SelectField.class);
		FIELD_TYPES.put(FormField.TYPE_MULTISELECT, MultiSelectField.class);
		FIELD_TYPES.put(FormField.TYPE_TABLE, TableField.class);
		FIELD_TYPES.put(FormField.TYPE_PHOTO, PhotoField.class);
		FIELD_TYPES.put(FormField.TYPE_ATTACHMENT, AttachmentField.class);
	}

	public static final String TYPE_LABLE = "Lable";
	public static final String TYPE_TEXT = "Text";
	public static final String TYPE_TEXTAREA = "TextArea";
	public static final String TYPE_DATETIME = "DateTime";
	public static final String TYPE_DATE = "Date";
	public static final String TYPE_TIME = "Time";
	public static final String TYPE_DATERANGE = "DateRange";
	public static final String TYPE_NUMBER = "Number";
	public static final String TYPE_MONEY = "Money";
	public static final String TYPE_SELECT = "Select";
	public static final String TYPE_MULTISELECT = "MultiSelect";
	public static final String TYPE_TABLE = "Table";
	public static final String TYPE_PHOTO = "Photo";
	public static final String TYPE_ATTACHMENT = "Attachment";

	private String id;
	private String name;
	private String label;
	private Object value;
	private String description;
	private String fieldType;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return StringUtils.isEmpty(name) ? this.label : this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

}
