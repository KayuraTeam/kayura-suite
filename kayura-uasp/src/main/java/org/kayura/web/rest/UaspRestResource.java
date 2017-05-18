package org.kayura.web.rest;

import org.kayura.security.LoginUser;
import org.springframework.security.core.context.SecurityContextHolder;

public abstract class UaspRestResource extends BaseRestResource {

	protected LoginUser getLoginUser() {
		return (LoginUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

}
