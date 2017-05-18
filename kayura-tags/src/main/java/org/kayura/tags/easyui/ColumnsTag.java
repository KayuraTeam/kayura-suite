/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

/**
 * ColumnsTag
 *
 * @author liangxia@live.com
 */
public class ColumnsTag extends TagRender {

	private static final long serialVersionUID = -2612081462922214399L;

	@Override
	public String getEasyUITag() {
		return null;
	}

	@Override
	public String getHtmlTag() {
		return "tr";
	}

	@Override
	public Map<String, Object> makeOptions() {
		return null;
	}

}
