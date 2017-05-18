/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.exceptions;

/**
 * @author liangxia@live.com
 *
 */
public class KayuraException extends RuntimeException {

	private static final long serialVersionUID = 3288055430650604215L;

	public KayuraException() {
		super();
	}

	public KayuraException(String message) {
		super(message);
	}

	public KayuraException(String message, Throwable cause) {
		super(message, cause);
	}

	public KayuraException(Throwable cause) {
		super(cause);
	}

}
