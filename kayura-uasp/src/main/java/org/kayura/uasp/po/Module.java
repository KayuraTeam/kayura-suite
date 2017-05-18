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
public class Module implements Serializable {

	private static final long serialVersionUID = -2471694143851494763L;
	
	public static final Integer TYPE_CATEGORY = 1;
	public static final Integer TYPE_ITEM = 2;

	private String moduleId;
	private String parentId;
	private Integer type;
	private String code;
	private String name;
	private String description;
	private String icon;
	private String uri;
	private Integer serial;
	private Boolean enabled;

	private List<Module> subItems;
	private List<String> actions;

	public static List<Module> convertTree(List<Module> moduleList) {

		List<Module> items = new ArrayList<Module>();
		for (Module item : moduleList) {

			if (StringUtils.isEmpty(item.getParentId())) {

				makeChildItems(item, moduleList);
				items.add(item);
			}
		}
		return items;
	}

	private static void makeChildItems(Module module, List<Module> moduleList) {

		List<Module> items = new ArrayList<Module>();
		for (Module item : moduleList) {

			if (item.getParentId().equals(module.getModuleId())) {
				items.add(item);
				makeChildItems(item, moduleList);
			}
		}

		if (!items.isEmpty()) {
			module.setSubItems(items);
		}
	}

	public Module() {
		this.setActions(new ArrayList<String>());
	}

	public String getModuleId() {
		return moduleId;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public Integer getSerial() {
		return serial;
	}

	public void setSerial(Integer serial) {
		this.serial = serial;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public List<Module> getSubItems() {
		return subItems;
	}

	public void setSubItems(List<Module> subItems) {
		this.subItems = subItems;
	}

	public List<String> getActions() {
		return actions;
	}

	public void setActions(List<String> actions) {
		this.actions = actions;
	}

}
