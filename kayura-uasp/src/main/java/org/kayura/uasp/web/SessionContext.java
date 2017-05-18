/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.web;

import org.kayura.uasp.po.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author liangxia@live.com
 */
public class SessionContext {

//	private Cache cache;
//	private UserService accountService;

	public User getSessionUser() {

		User user = null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			auth.getPrincipal();
		}

		return user;
	}
}
