package org.kayura.uasp.security;

import org.springframework.security.core.AuthenticationException;

public class AjaxNonePrivilegeException extends AuthenticationException {

	private static final long serialVersionUID = 2715766215102335432L;

	public AjaxNonePrivilegeException(String msg) {
		super(msg);
	}

	public AjaxNonePrivilegeException(String msg, Throwable t) {
		super(msg, t);
	}

}
