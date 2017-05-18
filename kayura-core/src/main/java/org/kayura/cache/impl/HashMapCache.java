/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.cache.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.ReadWriteLock;

import org.kayura.cache.Cache;
import org.kayura.cache.CacheException;

/**
 * @author liangxia@live.com
 *
 */
public class HashMapCache implements org.kayura.cache.Cache {
    
    private String id;
    
    private Map<Object, Object> cache = new HashMap<Object, Object>();
    
    public HashMapCache(String id) {
	this.id = id;
    }
    
    public String getId() {
	return id;
    }
    
    public int getSize() {
	return cache.size();
    }
    
    public void put(Object key, Object value) {
	cache.put(key, value);
    }
    
    public Object get(Object key) {
	return cache.get(key);
    }
    
    public Object remove(Object key) {
	return cache.remove(key);
    }
    
    public void clear() {
	cache.clear();
    }
    
    public ReadWriteLock getReadWriteLock() {
	return null;
    }
    
    public boolean equals(Object o) {
	if (getId() == null)
	    throw new CacheException("Cache instances require an ID.");
	if (this == o)
	    return true;
	if (!(o instanceof Cache))
	    return false;
	
	Cache otherCache = (Cache) o;
	return getId().equals(otherCache.getId());
    }
    
    public int hashCode() {
	if (getId() == null)
	    throw new CacheException("Cache instances require an ID.");
	return getId().hashCode();
    }
    
}
