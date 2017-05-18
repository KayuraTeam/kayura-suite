/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.common;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.Tag;

/**
 * RenderSectionTag
 *
 * @author liangxia@live.com
 */
public class RenderSectionTag extends BodyTagSupport {

	private static final long serialVersionUID = 5409125929070664760L;
	private static final String TAG_NAME = "KAYURA-SECTION-";

	private String name;

	@Override
	public int doStartTag() throws JspException {
		return getOverriedContent() == null ? EVAL_BODY_INCLUDE : SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {

		String overriedContent = getOverriedContent();
		if (overriedContent != null && overriedContent.trim().length() > 0) {

			try {
				pageContext.getOut().write(overriedContent);
				pageContext.removeAttribute(TAG_NAME + name);
			} catch (IOException e) {
				throw new JspException("write override Content throw IOException, section name:" + name, e);
			}
		}
		return Tag.EVAL_PAGE;
	}

	private String getOverriedContent() {
		return (String) pageContext.getAttribute(TAG_NAME + name);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
