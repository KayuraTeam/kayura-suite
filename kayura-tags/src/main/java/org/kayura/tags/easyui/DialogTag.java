/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

import org.kayura.tags.types.RawString;

/**
 * DialogTag
 *
 * @author liangxia@live.com
 */
public class DialogTag extends WindowTag {

	private static final long serialVersionUID = 13870190227229969L;

	private String toolbar;
	private String buttons;

	@Override
	public String getEasyUITag() {
		return "dialog";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		if (toolbar != null) {
			if (toolbar instanceof String) {
				String t = (String) toolbar;
				if (t.startsWith("#")) {
					putMap(map, "toolbar", t);
				} else {
					putMap(map, "toolbar", RawString.make(t));
				}
			} else {
				putMap(map, "toolbar", toolbar);
			}
		}

		if (buttons != null) {
			if (buttons instanceof String) {
				String t = (String) buttons;
				if (t.startsWith("#")) {
					putMap(map, "buttons", t);
				} else {
					putMap(map, "buttons", RawString.make(t));
				}
			} else {
				putMap(map, "buttons", buttons);
			}
		}

		return map;
	}

	public String getToolbar() {
		return toolbar;
	}

	public void setToolbar(String toolbar) {
		this.toolbar = toolbar;
	}

	public String getButtons() {
		return buttons;
	}

	public void setButtons(String buttons) {
		this.buttons = buttons;
	}

}
