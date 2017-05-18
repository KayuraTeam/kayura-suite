/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.po;

import java.io.Serializable;

/**
 * @author liangxia@live.com
 */
public class Role implements Serializable {

	private static final long serialVersionUID = -9223330396014265239L;

	private String roleId;
	private String tenantId;
	private String name;
	private Boolean enabled;

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getEnabled() {
		return enabled != null ? enabled : false;
	}

	public String getEnabledName() {
		return getEnabled() ? "启用" : "禁用";
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

}
