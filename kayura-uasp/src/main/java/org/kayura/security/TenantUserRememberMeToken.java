/**
 * Copyright 2015-2015 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.security;

import java.util.Date;

import org.kayura.utils.StringUtils;
import org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken;

/**
 * TenantUserRememberMeToken
 *
 * @author liangxia@live.com
 */
public class TenantUserRememberMeToken extends PersistentRememberMeToken {

	private String userId;
	private String tenantId;

	public TenantUserRememberMeToken(String userId, String tenantId, String username, String series, String tokenValue,
			Date date) {
		this(username, series, tokenValue, date);
		this.userId = userId;
		this.tenantId = tenantId;
	}

	public TenantUserRememberMeToken(String username, String series, String tokenValue, Date date) {
		super(username, series, tokenValue, date);
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getTenantUserName() {

		if (!StringUtils.isEmpty(this.tenantId)) {
			return this.tenantId + "#" + this.getUsername();
		} else {
			return this.getUsername();
		}
	}

}
