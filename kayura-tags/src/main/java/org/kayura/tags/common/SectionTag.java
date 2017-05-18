/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.common;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.Tag;

import org.kayura.tags.types.TagUtils;

/**
 * SectionTag
 *
 * @author liangxia@live.com
 */
public class SectionTag extends BodyTagSupport {

	private static final long serialVersionUID = 171387862870743338L;
	private static final String TAG_NAME = "KAYURA-SECTION-";

	private String name;

	@Override
	public int doStartTag() throws JspException {

		return isOverrided() ? SKIP_BODY : EVAL_BODY_BUFFERED;
	}

	@Override
	public int doEndTag() throws JspException {

		if (!isOverrided()) {
			BodyContent b = getBodyContent();
			if (b != null) {
				String content = b.getString();
				if (!TagUtils.isEmpty(content)) {
					pageContext.setAttribute(TAG_NAME + name, content);
				}
			}
		}
		return Tag.EVAL_PAGE;
	}

	private boolean isOverrided() {
		return pageContext.getAttribute(TAG_NAME + name) != null;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
