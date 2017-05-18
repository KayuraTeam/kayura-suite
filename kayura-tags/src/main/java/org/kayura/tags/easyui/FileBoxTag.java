/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

/**
 * FileBoxTag
 *
 * @author liangxia@live.com
 */
public class FileBoxTag extends TextBoxTag {

	private static final long serialVersionUID = 6324386899135233549L;

	//private String buttonText;
	//private String buttonIcon;
	//private String buttonAlign;

	@Override
	public String getEasyUITag() {
		return "filebox";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		//putMap(map, "buttonText", buttonText);
		//putMap(map, "buttonIcon", buttonIcon);
		//putMap(map, "buttonAlign", buttonAlign);

		return map;
	}

}
