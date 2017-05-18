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
public class MenuItem implements Serializable {

	private static final long serialVersionUID = -7804502531850037124L;
	
	public static final Integer TYPE_CATEGORY = 1;
	public static final Integer TYPE_ITEM = 2;

	private String menuItemId;
	private String parentId;
	private String menuSchemeId;
	private Module module;
	private Integer type;
	private String displayName;
	private String description;
	private String icon;
	private Integer serial;
	private Boolean enabled;

	private List<MenuItem> subItems;

	public MenuItem() {
		setSubItems(new ArrayList<MenuItem>());
	}

	public String getMenuItemId() {
		return menuItemId;
	}

	public void setMenuItemId(String menuItemId) {
		this.menuItemId = menuItemId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getMenuSchemeId() {
		return menuSchemeId;
	}

	public void setMenuSchemeId(String menuSchemeId) {
		this.menuSchemeId = menuSchemeId;
	}

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getDisplayName() {
		return StringUtils.isEmpty(this.displayName) ? this.getModule().getName() : this.displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getDescription() {
		return StringUtils.isEmpty(this.description) ? this.getModule().getDescription() : this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIcon() {
		return StringUtils.isEmpty(this.icon) ? this.getModule().getIcon() : this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Integer getSerial() {
		return serial;
	}

	public void setSerial(Integer serial) {
		this.serial = serial;
	}

	public Boolean getEnabled() {
		return enabled && this.getModule().getEnabled();
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public List<MenuItem> getSubItems() {
		return subItems;
	}

	public void setSubItems(List<MenuItem> subItems) {
		this.subItems = subItems;
	}

}
