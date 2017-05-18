/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui.types;

import java.util.ArrayList;
import java.util.List;

import org.kayura.tags.easyui.utils.MenuUtils;

/**
 * MenuItem
 *
 * @author liangxia@live.com
 */
public class MenuItem {

	public static final String SEPARATOR = "SEPARATOR";
	public static final MenuItem SEPMENUITEM = new MenuItem(SEPARATOR);

	private String id;
	private String name;
	private String text;
	private String iconCls;
	private Boolean selected;
	private String href;
	private Boolean disabled;
	private String onclick;
	private String style;
	private List<MenuItem> items;
	private Boolean isCustom;
	private String content;

	public MenuItem() {
		this.isCustom = false;
		this.items = new ArrayList<MenuItem>();
	}

	public MenuItem(String text) {
		this();
		this.text = text;
	}

	public MenuItem(String text, String iconCls) {
		this(text);
		this.iconCls = iconCls;
	}

	public MenuItem(String name, String text, String iconCls) {
		this(text, iconCls);
		this.name = name;
	}

	public MenuItem(String name, String text, String iconCls, Boolean selected) {
		this(name, text, iconCls);
		this.selected = selected;
	}

	public Boolean hasOptions() {
		return !MenuUtils.isEmpty(name) || !MenuUtils.isEmpty(iconCls) || selected != null || !MenuUtils.isEmpty(href)
				|| disabled != null || !MenuUtils.isEmpty(onclick);
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public Boolean getSelected() {
		return selected;
	}

	public void setSelected(Boolean selected) {
		this.selected = selected;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public Boolean getDisabled() {
		return disabled;
	}

	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}

	public String getOnclick() {
		return onclick;
	}

	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public List<MenuItem> getItems() {
		return items;
	}

	public void setItems(List<MenuItem> items) {
		this.items = items;
	}

	public void addMenu(MenuItem m) {
		this.items.add(m);
	}

	public void addMenus(List<MenuItem> items) {

		if (items != null && !items.isEmpty()) {
			this.items.addAll(items);
		}
	}

	public Boolean getIsCustom() {
		return isCustom;
	}

	public void setIsCustom(Boolean isCustom) {
		this.isCustom = isCustom;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
