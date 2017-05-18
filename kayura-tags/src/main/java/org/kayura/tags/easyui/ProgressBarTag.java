/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.Map;

import org.kayura.tags.types.RawString;

/**
 * ProgressBarTag
 *
 * @author liangxia@live.com
 */
public class ProgressBarTag extends TagRender {

	private static final long serialVersionUID = -5282587089077309775L;

	private String width;
	private String height;
	private Integer value;
	private String text;

	private String onChange;

	@Override
	public String getEasyUITag() {
		return "progressbar";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "width", width);
		putMap(map, "height", height);
		putMap(map, "value", value);
		putMap(map, "text", text);

		putMap(map, "onChange", RawString.make(onChange));

		return map;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getOnChange() {
		return onChange;
	}

	public void setOnChange(String onChange) {
		this.onChange = onChange;
	}

}
