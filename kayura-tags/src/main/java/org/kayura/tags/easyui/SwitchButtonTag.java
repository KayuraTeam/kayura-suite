/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspWriter;

import org.kayura.tags.types.RawString;

/**
 * SwitchButtonTag
 *
 * @author liangxia@live.com
 */
public class SwitchButtonTag extends TagRender {

	private static final long serialVersionUID = 6331210930285989270L;

	private String name;
	private String width;
	private String height;
	private String handleWidth;
	private Boolean checked;
	private Boolean disabled;
	private Boolean readonly;
	private Boolean reversed;
	private String onText;
	private String offText;
	private String handleText;
	private String value;

	private String onChange;

	@Override
	public String getEasyUITag() {
		return "switchbutton";
	}

	@Override
	public String getHtmlTag() {
		return "input";
	}

	@Override
	public Boolean emptyBody() {
		return true;
	}

	@Override
	public void doRenderProperty(JspWriter out) throws Exception {

		if (!isEmpty(getName())) {
			out.write(" name=\"" + getName() + "\"");
		} else {
			if (!isEmpty(getId())) {
				out.write(" name=\"" + getId() + "\"");
			}
		}
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "width", width);
		putMap(map, "height", height);
		putMap(map, "handleWidth", handleWidth);
		putMap(map, "checked", checked);
		putMap(map, "disabled", disabled);
		putMap(map, "readonly", readonly);
		putMap(map, "reversed", reversed);
		putMap(map, "onText", onText);
		putMap(map, "offText", offText);
		putMap(map, "handleText", handleText);
		putMap(map, "value", value);

		putMap(map, "onChange", RawString.make(onChange));

		return map;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getHandleWidth() {
		return handleWidth;
	}

	public void setHandleWidth(String handleWidth) {
		this.handleWidth = handleWidth;
	}

	public Boolean getChecked() {
		return checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

	public Boolean getDisabled() {
		return disabled;
	}

	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}

	public Boolean getReadonly() {
		return readonly;
	}

	public void setReadonly(Boolean readonly) {
		this.readonly = readonly;
	}

	public Boolean getReversed() {
		return reversed;
	}

	public void setReversed(Boolean reversed) {
		this.reversed = reversed;
	}

	public String getOnText() {
		return onText;
	}

	public void setOnText(String onText) {
		this.onText = onText;
	}

	public String getOffText() {
		return offText;
	}

	public void setOffText(String offText) {
		this.offText = offText;
	}

	public String getHandleText() {
		return handleText;
	}

	public void setHandleText(String handleText) {
		this.handleText = handleText;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getOnChange() {
		return onChange;
	}

	public void setOnChange(String onChange) {
		this.onChange = onChange;
	}

}
