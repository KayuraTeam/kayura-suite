/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

import org.kayura.tags.types.RawString;

/**
 * DataListTag
 *
 * @author liangxia@live.com
 */
public class DataListTag extends DataGridTag {

	private static final long serialVersionUID = 8010831970865002748L;

	private Boolean lines;
	private Boolean checkbox;
	private String valueField;
	private String textField;
	private String groupField;

	private String textFormatter;
	private String groupFormatter;

	@Override
	public String getEasyUITag() {
		return "datalist";
	}

	@Override
	public String getHtmlTag() {
		return "ul";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		putMap(map, "lines", lines);
		putMap(map, "checkbox", checkbox);
		putMap(map, "valueField", valueField);
		putMap(map, "textField", textField);
		putMap(map, "groupField", groupField);

		putMap(map, "textFormatter", RawString.make(textFormatter));
		putMap(map, "groupFormatter", RawString.make(groupFormatter));

		return map;
	}

	public Boolean getLines() {
		return lines;
	}

	public void setLines(Boolean lines) {
		this.lines = lines;
	}

	public Boolean getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(Boolean checkbox) {
		this.checkbox = checkbox;
	}

	public String getValueField() {
		return valueField;
	}

	public void setValueField(String valueField) {
		this.valueField = valueField;
	}

	public String getTextField() {
		return textField;
	}

	public void setTextField(String textField) {
		this.textField = textField;
	}

	public String getGroupField() {
		return groupField;
	}

	public void setGroupField(String groupField) {
		this.groupField = groupField;
	}

	public String getTextFormatter() {
		return textFormatter;
	}

	public void setTextFormatter(String textFormatter) {
		this.textFormatter = textFormatter;
	}

	public String getGroupFormatter() {
		return groupFormatter;
	}

	public void setGroupFormatter(String groupFormatter) {
		this.groupFormatter = groupFormatter;
	}

}
