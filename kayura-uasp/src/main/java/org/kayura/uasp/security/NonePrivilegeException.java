package org.kayura.uasp.security;

import org.springframework.security.core.AuthenticationException;

public class NonePrivilegeException extends AuthenticationException {

	public NonePrivilegeException(String msg) {
		super(msg);
	}

	public NonePrivilegeException(String msg, Throwable t) {
		super(msg, t);
	}

	private static final long serialVersionUID = 292485199114786333L;
}
