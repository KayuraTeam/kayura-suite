/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.jsp.JspWriter;

import org.kayura.tags.easyui.types.MenuItem;
import org.kayura.tags.easyui.utils.MenuUtils;
import org.kayura.tags.types.RawString;

/**
 * SearchBoxTag
 *
 * @author liangxia@live.com
 */
public class SearchBoxTag extends TagRender {

	private static final long serialVersionUID = -7693642343988122479L;

	private String width;
	private String height;
	private String prompt;
	private String value;
	private String menu;
	private String searcher;
	private Boolean disabled;
	private List<MenuItem> menus;

	@Override
	public String getEasyUITag() {
		return "searchbox";
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
	public void doRenderProperty(JspWriter out) throws Exception {

	}

	@Override
	public void doRenderBody(JspWriter out) throws Exception {

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

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "width", width);
		putMap(map, "height", height);
		putMap(map, "prompt", prompt);
		putMap(map, "value", value);
		putMap(map, "menu", menu);
		putMap(map, "searcher", RawString.make(searcher));
		putMap(map, "disabled", disabled);

		return map;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getPrompt() {
		return prompt;
	}

	public void setPrompt(String prompt) {
		this.prompt = prompt;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getSearcher() {
		return searcher;
	}

	public void setSearcher(String searcher) {
		this.searcher = searcher;
	}

	public Boolean getDisabled() {
		return disabled;
	}

	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}

	public List<MenuItem> getMenus() {
		return menus;
	}

	public void setMenus(List<MenuItem> menus) {
		this.menus = menus;
	}

}
