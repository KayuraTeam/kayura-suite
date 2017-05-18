/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.kayura.utils.StringUtils;

/**
 * @author liangxia@live.com
 */
public class MenuScheme implements Serializable {

	private static final long serialVersionUID = 817862772732634654L;

	private String id;
	private String tenantId;
	private String code;
	private String name;

	private List<MenuItem> menus;

	public MenuScheme() {
		setMenus(new ArrayList<MenuItem>());
	}

	public List<MenuItem> getMenuTree() {

		List<MenuItem> items = new ArrayList<MenuItem>();
		for (MenuItem item : menus) {

			if (StringUtils.isEmpty(item.getParentId())) {

				makeChildItems(item);
				items.add(item);
			}
		}
		return items;
	}

	private void makeChildItems(MenuItem menusItem) {

		List<MenuItem> items = new ArrayList<MenuItem>();
		for (MenuItem item : menus) {

			if (item.getParentId().equals(menusItem.getMenuItemId())) {

				makeChildItems(item);
				items.add(item);
			}
		}

		if (!items.isEmpty()) {
			menusItem.setSubItems(items);
		}
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<MenuItem> getMenus() {
		return menus;
	}

	public void setMenus(List<MenuItem> menus) {
		this.menus = menus;
	}

}
