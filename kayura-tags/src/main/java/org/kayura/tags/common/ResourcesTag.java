/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.common;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 * ResourcesTag
 *
 * @author liangxia@live.com
 */
public class ResourcesTag extends SimpleTagSupport {

	static final String LINK_TAG = "<link rel=\"stylesheet\" type=\"text/css\" href=\"%s\">\n";
	static final String SCRIPT_TAG = "<script type=\"text/javascript\" src=\"%s\"></script>\n";

	private String location;

	@Override
	public void doTag() throws JspException, IOException {

		StringWriter sw = new StringWriter();
		this.getJspBody().invoke(sw);
		String content = sw.toString();

		String ctxPath = ((PageContext) this.getJspContext()).getServletContext().getContextPath();
		if (getLocation() != null) {
			setLocation(ctxPath + "/" + getLocation());
		} else {
			setLocation(ctxPath);
		}

		String[] fileNames = content.split("\n");
		if (fileNames != null) {

			JspWriter out = this.getJspContext().getOut();
			for (String name : fileNames) {

				String fn = name.replaceAll("\\s*", "");
				if (fn.length() > 0) {

					String type = null;
					if (fn.endsWith(".css")) {
						type = "text/css";
					} else if (fn.endsWith(".js")) {
						type = "text/javascript";
					}

					if (type != null) {

						String fullName = getLocation() + "/" + fn;

						if (type.equals("text/css") || type.equals("css")) {
							out.write(String.format(LINK_TAG, fullName));
						} else if (type.equals("text/javascript") || type.equals("js")) {
							out.write(String.format(SCRIPT_TAG, fullName));
						}
					}
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

}
