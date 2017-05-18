/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;

/**
 * MenuItemTag
 *
 * @author liangxia@live.com
 */
public class MenuItemTag extends TagRender {

	private static final long serialVersionUID = -4460097816879880475L;

	private String name;
	private String text;
	private String iconCls;
	private Boolean selected;
	private String href;
	private Boolean disabled;
	private String onClick;
	private Boolean isSeparator;

	@Override
	public String getEasyUITag() {
		return null;
	}

	@Override
	public void doRenderProperty(JspWriter out) throws Exception {

		if (!isEmpty(getOnClick())) {
			out.write(" onclick=\"" + getOnClick() + "\"");
		}
	}

	@Override
	public void doRenderBody(JspWriter out) throws Exception {

		if (!isEmpty(text)) {
			out.write(text);
		} else {
			BodyContent body = getBodyContent();
			if (body != null) {
				out.write(body.getString());
			}
		}
	}

	@Override
	public int doStartTag() {

		if (getIsSeparator() != null && getIsSeparator() == true) {

			JspWriter out = this.pageContext.getOut();
			try {
				out.write("<div class=\"menu-sep\">");
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
			return EVAL_BODY_INCLUDE;
		} else {
			return super.doStartTag();
		}
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "name", name);
		putMap(map, "iconCls", iconCls);
		putMap(map, "selected", selected);
		putMap(map, "selected", selected);
		putMap(map, "href", href);
		putMap(map, "disabled", disabled);

		return map;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Boolean getSelected() {
		return selected;
	}

	public void setSelected(Boolean selected) {
		this.selected = selected;
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

	public String getOnClick() {
		return onClick;
	}

	public void setOnClick(String onClick) {
		this.onClick = onClick;
	}

	public Boolean getIsSeparator() {
		return isSeparator;
	}

	public void setIsSeparator(Boolean isSeparator) {
		this.isSeparator = isSeparator;
	}

}
