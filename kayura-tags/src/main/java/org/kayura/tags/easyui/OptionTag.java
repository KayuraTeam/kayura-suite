/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

import javax.servlet.jsp.JspWriter;

/**
 * OptionTag
 *
 * @author liangxia@live.com
 */
public class OptionTag extends TagRender {

	private static final long serialVersionUID = 643533063474132407L;

	private String label;
	private String value;
	private Boolean selected;

	@Override
	public String getEasyUITag() {
		return null;
	}

	@Override
	public String getHtmlTag() {
		return "option";
	}

	@Override
	public void doRenderProperty(JspWriter out) throws Exception {

		if (!isEmpty(getValue())) {
			out.write(" value=\"" + getValue() + "\"");
		} else {
			if (!isEmpty(getLabel())) {
				out.write(" value=\"" + getLabel() + "\"");
			}
		}

		if (getSelected() != null && getSelected() == true) {
			out.write(" selected=true");
		}
	}

	@Override
	public void doRenderBody(JspWriter out) throws Exception {

		if (!isEmpty(getLabel())) {
			out.write(getLabel());
		} else {
			if (!isEmpty(getValue())) {
				out.write(getValue());
			}
		}
	}

	@Override
	public Map<String, Object> makeOptions() {
		return null;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Boolean getSelected() {
		return selected;
	}

	public void setSelected(Boolean selected) {
		this.selected = selected;
	}

}
