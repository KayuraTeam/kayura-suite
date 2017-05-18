/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

import org.kayura.tags.types.RawString;

/**
 * PropertyGridTag
 *
 * @author liangxia@live.com
 */
public class PropertyGridTag extends DataGridTag {

	private static final long serialVersionUID = 3864604657229863315L;

	private String showGroup;
	private String groupField;
	private String groupFormatter;

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		putMap(map, "showGroup", showGroup);
		putMap(map, "groupField", groupField);
		putMap(map, "groupFormatter", RawString.make(groupFormatter));

		return map;
	}

	public String getShowGroup() {
		return showGroup;
	}

	public void setShowGroup(String showGroup) {
		this.showGroup = showGroup;
	}

	public String getGroupField() {
		return groupField;
	}

	public void setGroupField(String groupField) {
		this.groupField = groupField;
	}

	public String getGroupFormatter() {
		return groupFormatter;
	}

	public void setGroupFormatter(String groupFormatter) {
		this.groupFormatter = groupFormatter;
	}

}
