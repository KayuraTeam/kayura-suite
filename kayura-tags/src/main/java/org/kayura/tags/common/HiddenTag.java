/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.common;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.kayura.tags.types.TagUtils;

/**
 * HiddenTag
 *
 * @author liangxia@live.com
 */
public class HiddenTag extends SimpleTagSupport {

	private String id;
	private String name;
	private Object value;

	@Override
	public void doTag() throws JspException, IOException {

		JspWriter out = this.getJspContext().getOut();

		out.write("<input type=\"hidden\"");

		if (!TagUtils.isEmpty(id)) {
			out.write(" id=\"" + id + "\"");
		}

		if (!TagUtils.isEmpty(name)) {
			out.write(" name=\"" + name + "\"");
		} else {
			if (!TagUtils.isEmpty(id)) {
				out.write(" name=\"" + id + "\"");
			}
		}

		if (value != null) {
			if (value instanceof String) {
				out.write(" value=\"" + (String) value + "\"");
			} else {
				out.write(" value='" + TagUtils.json(value) + "'");
			}
		}

		out.write("/>");
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

}
