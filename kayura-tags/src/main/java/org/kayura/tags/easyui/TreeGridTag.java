/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

/**
 * TreeGridTag
 *
 * @author liangxia@live.com
 */
public class TreeGridTag extends DataGridTag {

	private static final long serialVersionUID = 2813204127775644098L;

	// private String idField;
	private String treeField;
	private String animate;

	// private String loader;
	// private String loadFilter;

	// private String onBeforeExpand;
	// private String onExpand;
	// private String onBeforeCollapse;
	// private String onCollapse;

	@Override
	public String getEasyUITag() {
		return "treegrid";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		// putMap(map, "idField", idField);
		putMap(map, "treeField", treeField);
		putMap(map, "animate", animate);

		// putMap(map, "loader", RawString.make(loader));
		// putMap(map, "loadFilter", RawString.make(loadFilter));

		// putMap(map, "onBeforeExpand", RawString.make(onBeforeExpand));
		// putMap(map, "onExpand", RawString.make(onExpand));
		// putMap(map, "onBeforeCollapse", RawString.make(onBeforeCollapse));
		// putMap(map, "onCollapse", RawString.make(onCollapse));

		return map;
	}

	public String getTreeField() {
		return treeField;
	}

	public void setTreeField(String treeField) {
		this.treeField = treeField;
	}

	public String getAnimate() {
		return animate;
	}

	public void setAnimate(String animate) {
		this.animate = animate;
	}

}
