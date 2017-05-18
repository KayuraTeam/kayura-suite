/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.common;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.kayura.tags.types.TagUtils;

/**
 * ResourceTag
 *
 * @author liangxia@live.com
 */
public class ResourceTag extends SimpleTagSupport {

	static final String LINK_TAG = "<link %s rel=\"stylesheet\" type=\"text/css\" href=\"%s\">\n";
	static final String SCRIPT_TAG = "<script %s type=\"text/javascript\" src=\"%s\"></script>\n";

	private String id;
	private String location;
	private String name;

	@Override
	public void doTag() throws JspException, IOException {

		String ctxPath = ((PageContext) this.getJspContext()).getServletContext().getContextPath();
		if (getLocation() != null) {
			setLocation(ctxPath + "/" + getLocation());
		} else {
			setLocation(ctxPath);
		}

		if (name != null && name.trim().length() > 0) {

			String type = null;
			if (name.endsWith(".css")) {
				type = "text/css";
			} else if (name.endsWith(".js")) {
				type = "text/javascript";
			}

			if (type != null) {

				String hId = "";
				if (!TagUtils.isEmpty(id)) {
					hId = " id=\"" + id + "\"";
				}
				String fullName = getLocation() + "/" + name;
				JspWriter out = this.getJspContext().getOut();

				if (type.equals("text/css") || type.equals("css")) {
					out.write(String.format(LINK_TAG, hId, fullName));
				} else if (type.equals("text/javascript") || type.equals("js")) {
					out.write(String.format(SCRIPT_TAG, hId, fullName));
				}
			}
		}

	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
