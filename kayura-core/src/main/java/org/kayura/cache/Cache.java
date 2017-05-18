/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.cache;

import java.util.concurrent.locks.ReadWriteLock;

/**
 * @author liangxia@live.com
 *
 */
public interface Cache {
    
    String getId();
    
    void put(Object key, Object value);
    
    Object get(Object key);
    
    Object remove(Object key);
    
    void clear();
    
    int getSize();
    
    ReadWriteLock getReadWriteLock();
}
