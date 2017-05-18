/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.cache;

import org.kayura.exceptions.KayuraException;

/**
 * @author liangxia@live.com
 *
 */
public class CacheException extends KayuraException {

	private static final long serialVersionUID = -4154301649611902739L;

	public CacheException() {
		super();
	}

	public CacheException(String message) {
		super(message);
	}

	public CacheException(String message, Throwable cause) {
		super(message, cause);
	}

	public CacheException(Throwable cause) {
		super(cause);
	}
}
