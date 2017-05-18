/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.web.controllers;

import org.kayura.security.LoginUser;
import org.kayura.web.controller.BaseController;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author liangxia@live.com
 */
public abstract class UaspController extends BaseController {

	public LoginUser getLoginUser() {
		return (LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
}