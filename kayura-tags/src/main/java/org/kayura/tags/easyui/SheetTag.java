/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

/**
 * SheetTag
 *
 * @author liangxia@live.com
 */
public class SheetTag extends PanelTag {

	private static final long serialVersionUID = 8035372739627057738L;

	private Boolean selected;
	// private Boolean collapsible;

	@Override
	public String getEasyUITag() {
		return null;
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		putMap(map, "selected", selected);
		// putMap(map, "collapsible", collapsible);

		return map;
	}

	public Boolean getSelected() {
		return selected;
	}

	public void setSelected(Boolean selected) {
		this.selected = selected;
	}

}
