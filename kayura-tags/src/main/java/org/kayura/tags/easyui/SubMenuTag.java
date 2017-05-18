/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.Tag;

/**
 * SubMenuTag
 *
 * @author liangxia@live.com
 */
public class SubMenuTag extends TagRender {

	private static final long serialVersionUID = 253047066833139L;

	private String text;
	private String iconCls;
	private Boolean disabled;
	private Boolean isCustom;

	@Override
	public String getEasyUITag() {
		return null;
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "iconCls", iconCls);
		putMap(map, "disabled", disabled);

		return map;
	}

	@Override
	public int doStartTag() {

		JspWriter out = this.pageContext.getOut();
		try {
			out.write("<div");

			if (!isEmpty(getId())) {
				out.write(" id=\"" + getId() + "\"");
			}

			if (!isEmpty(getClassStyle())) {
				out.write(" class=\"" + getClassStyle().trim() + "\"");
			}

			String options = optionsToString();
			if (!isEmpty(options)) {
				options = options.replace('\'', '"');
				out.write(" data-options='" + options + "'");
			}

			out.write(">");
			out.write("<span>" + getText() + "</span>");
			out.write("<div");

			if (!isEmpty(getStyle())) {
				out.write(" style=\"" + getStyle() + "\"");
			}

			if (getIsCustom() != null && getIsCustom() == true) {
				out.write(" class='menu-content'");
			}

			out.write(">");

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		return EVAL_BODY_INCLUDE;
	}

	@Override
	public int doEndTag() throws JspException {

		JspWriter out = this.pageContext.getOut();
		try {
			out.write("</div></div>");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return Tag.EVAL_PAGE;
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

	public Boolean getDisabled() {
		return disabled;
	}

	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}

	public Boolean getIsCustom() {
		return isCustom;
	}

	public void setIsCustom(Boolean isCustom) {
		this.isCustom = isCustom;
	}

}
