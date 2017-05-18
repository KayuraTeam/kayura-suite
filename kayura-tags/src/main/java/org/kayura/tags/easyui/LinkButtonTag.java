/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspWriter;

/**
 * LinkButtonTag
 *
 * @author liangxia@live.com
 */
public class LinkButtonTag extends TagRender {

	private static final long serialVersionUID = -4729240670124765482L;

	private String href;
	private Boolean disabled;
	private Boolean toggle;
	private Boolean selected;
	private String group;
	private Boolean plain;
	private String text;
	private String iconCls;
	private String iconAlign;
	private String size;

	private String onClick;

	@Override
	public String getEasyUITag() {
		return "linkbutton";
	}

	@Override
	public String getHtmlTag() {
		return "a";
	}

	@Override
	public void doRenderProperty(JspWriter out) throws Exception {

		if (!isEmpty(getHref())) {
			out.write(" href=\"" + getHref() + "\"");
		} else {
			out.write(" href=\"javascript:void(0)\"");
		}

		if (!isEmpty(getOnClick())) {
			out.write(" onclick=\"" + getOnClick() + "\"");
		}
	}

	@Override
	public void doRenderBody(JspWriter out) throws Exception {

		if (!isEmpty(getText())) {
			out.write(getText());
		}
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "disabled", disabled);
		putMap(map, "toggle", toggle);
		putMap(map, "selected", selected);
		putMap(map, "group", group);
		putMap(map, "plain", plain);
		putMap(map, "iconCls", iconCls);
		putMap(map, "iconAlign", iconAlign);
		putMap(map, "size", size);

		return map;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public Boolean getDisabled() {
		return disabled;
	}

	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}

	public Boolean getToggle() {
		return toggle;
	}

	public void setToggle(Boolean toggle) {
		this.toggle = toggle;
	}

	public Boolean getSelected() {
		return selected;
	}

	public void setSelected(Boolean selected) {
		this.selected = selected;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public Boolean getPlain() {
		return plain;
	}

	public void setPlain(Boolean plain) {
		this.plain = plain;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getIconAlign() {
		return iconAlign;
	}

	public void setIconAlign(String iconAlign) {
		this.iconAlign = iconAlign;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getOnClick() {
		return onClick;
	}

	public void setOnClick(String onClick) {
		this.onClick = onClick;
	}

}
