/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspWriter;

/**
 * LayoutAreaTag
 *
 * @author liangxia@live.com
 */
public class LayoutTag extends TagRender {

	private static final long serialVersionUID = -1028006575938773535L;

	private Boolean fit;

	@Override
	public String getEasyUITag() {
		return "layout";
	}

	@Override
	public void doRenderProperty(JspWriter out) {

	}

	@Override
	public void doRenderBody(JspWriter out) {

	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "fit", fit);

		return map;
	}

	public Boolean getFit() {
		return fit;
	}

	public void setFit(Boolean fit) {
		this.fit = fit;
	}

}
