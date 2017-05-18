/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.reflect;

import org.kayura.exceptions.KayuraException;

/**
 * @author liangxia@live.com
 *
 */
public class ReflectionException extends KayuraException {
    
    private static final long serialVersionUID = -3795373194039100952L;
    
    public ReflectionException() {
	super();
    }
    
    public ReflectionException(String message) {
	super(message);
    }
    
    public ReflectionException(String message, Throwable cause) {
	super(message, cause);
    }
    
    public ReflectionException(Throwable cause) {
	super(cause);
    }
}
