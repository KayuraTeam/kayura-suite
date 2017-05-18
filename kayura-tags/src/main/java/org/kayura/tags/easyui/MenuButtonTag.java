/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.jsp.JspWriter;

import org.kayura.tags.easyui.types.MenuItem;
import org.kayura.tags.easyui.utils.MenuUtils;

/**
 * MenuButtonTag
 *
 * @author liangxia@live.com
 */
public class MenuButtonTag extends LinkButtonTag {

	private static final long serialVersionUID = -7707826695322033792L;

	private String menu;
	private String menuAlign;
	private Integer duration;
	private Boolean hasDownArrow;

	private List<MenuItem> menus;

	@Override
	public String getEasyUITag() {
		return "menubutton";
	}

	static String randomId() {
		return "mm" + UUID.randomUUID().toString().substring(0, 8);
	}

	@Override
	public void doBeforeStart(JspWriter out) {

		if (menus != null && !menus.isEmpty()) {
			String mmId = randomId();
			setMenu("#" + mmId);
		}
	}

	@Override
	public void doAfterEnd(JspWriter out) throws Exception {

		if (getMenus() != null) {

			String mmId = this.getMenu();

			if (mmId.startsWith("#")) {
				mmId = mmId.substring(1);
			}

			out.write("<div id=\"" + mmId + "\">");
			out.write(MenuUtils.html(getMenus()));
			out.write("</div>");
		}
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		putMap(map, "menu", menu);
		putMap(map, "menuAlign", menuAlign);
		putMap(map, "duration", duration);
		putMap(map, "hasDownArrow", hasDownArrow);

		return map;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getMenuAlign() {
		return menuAlign;
	}

	public void setMenuAlign(String menuAlign) {
		this.menuAlign = menuAlign;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public Boolean getHasDownArrow() {
		return hasDownArrow;
	}

	public void setHasDownArrow(Boolean hasDownArrow) {
		this.hasDownArrow = hasDownArrow;
	}

	public List<MenuItem> getMenus() {
		return menus;
	}

	public void setMenus(List<MenuItem> menus) {
		this.menus = menus;
	}

}
