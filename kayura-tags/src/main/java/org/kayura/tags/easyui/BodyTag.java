/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.Tag;

/**
 * BodyTag
 *
 * @author liangxia@live.com
 */
public class BodyTag extends TagRender {

	private static final long serialVersionUID = -7338802774183130605L;

	private Boolean full;
	private Boolean layout;
	private String padding;

	@Override
	public String getEasyUITag() {
		return "layout";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> options = new HashMap<String, Object>();
		options.put("full", full);
		return options;
	}

	@Override
	public void doBeforeStart(JspWriter out) {

		String style = this.getStyle();

		style = style == null ? "" : style;
		if (!isEmpty(getPadding())) {
			if (!style.contains("padding")) {
				style += "padding:" + getPadding() + ";";
			}
		}

		this.setStyle(style);
	}

	@Override
	public int doStartTag() {
		JspWriter out = this.pageContext.getOut();
		try {

			doBeforeStart(out);

			out.write("<body");

			if (getFull() || getLayout()) {
				if (!isEmpty(getClassStyle())) {
					out.write(" class=\"easyui-" + getEasyUITag() + " " + getClassStyle() + "\"");
				} else {
					out.write(" class=\"easyui-" + getEasyUITag() + "\"");
				}
			} else {
				if (!isEmpty(getClassStyle())) {
					out.write(" class=\"" + getClassStyle() + "\"");
				}
			}

			if (!getFull()) {
				if (!isEmpty(getStyle())) {
					out.write(" style=\"" + getStyle() + "\"");
				}
			}

			out.write(">");

			if (getFull()) {

				out.write("<div data-options=\"region:'center',border:false\"");
				if (!isEmpty(getStyle())) {
					out.write(" style=\"" + getStyle() + "\"");
				}
				out.write(">\n");
			} else {

				out.write("\n");
			}

			doRenderBody(out);

		} catch (IOException e) {
			e.printStackTrace();
			logger.error(e);
		}

		return EVAL_BODY_INCLUDE;
	}

	@Override
	public int doEndTag() throws JspException {

		JspWriter out = this.pageContext.getOut();
		try {
			if (getFull()) {
				out.write("</div>");
			}
			out.write("</body>\n");
			doAfterEnd(out);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Tag.EVAL_PAGE;
	}

	@Override
	public void doRenderProperty(JspWriter out) {
	}

	@Override
	public void doRenderBody(JspWriter out) {
	}

	public Boolean getFull() {
		return full != null ? full : false;
	}

	public void setFull(Boolean full) {
		this.full = full;
	}

	public Boolean getLayout() {
		return layout != null ? layout : false;
	}

	public void setLayout(Boolean layout) {
		this.layout = layout;
	}

	public String getPadding() {
		return padding;
	}

	public void setPadding(String padding) {
		this.padding = padding;
	}

}
