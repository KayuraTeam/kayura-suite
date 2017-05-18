/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui.utils;

import java.util.List;

import org.kayura.tags.easyui.types.MenuItem;

/**
 * HtmlUtils
 *
 * @author liangxia@live.com
 */
public final class MenuUtils {

	public static Boolean isEmpty(String value) {

		return value == null || value.trim().length() == 0;
	}

	public static String html(List<MenuItem> menus) {

		StringBuilder sb = new StringBuilder();
		for (MenuItem e : menus) {

			if (e.getItems().isEmpty()) {
				addMenItem(sb, e);
			} else {
				addMenuItems(sb, e);
			}
		}
		return sb.toString();
	}

	static void addMenuItems(StringBuilder sb, MenuItem e) {

		sb.append("<div><span>" + e.getText() + "</span><div>");

		for (MenuItem m : e.getItems()) {

			if (m.getItems().isEmpty()) {
				addMenItem(sb, m);
			} else {
				addMenuItems(sb, m);
			}
		}

		sb.append("</div></div>");
	}

	static void addMenItem(StringBuilder sb, MenuItem e) {

		sb.append("<div");

		if (MenuItem.SEPARATOR.equals(e.getText())) {

			sb.append(" class='menu-sep'></div>");
		} else {

			if (!isEmpty(e.getId())) {
				sb.append(" id='" + e.getId() + "'");
			}

			if (!isEmpty(e.getOnclick())) {
				sb.append(" onclick=\"" + e.getOnclick() + "\"");
			}

			if (!isEmpty(e.getStyle())) {
				sb.append(" style=\"" + e.getStyle() + "\"");
			}

			if (e.getIsCustom()) {

				sb.append(" class=\"menu-content\">" + e.getContent() + "</div>");
			} else {

				if (e.hasOptions()) {
					sb.append(" data-options=\"");

					StringBuilder cc = new StringBuilder();
					if (!isEmpty(e.getName())) {
						cc.append(",name:'" + e.getName() + "'");
					}
					if (!isEmpty(e.getIconCls())) {
						cc.append(",iconCls:'" + e.getIconCls() + "'");
					}
					if (e.getSelected() != null && e.getSelected() == true) {
						cc.append(",selected:true");
					}
					if (!isEmpty(e.getHref())) {
						cc.append(",href:'" + e.getHref() + "'");
					}
					if (e.getDisabled() != null && e.getDisabled() == true) {
						cc.append(",disabled:true");
					}
					if (cc.length() > 0) {
						cc.delete(0, 1);
						sb.append(cc.toString());
					}
					sb.append("\"");
				}

				sb.append(">" + e.getText() + "</div>");
			}
		}
	}
}
