/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.mybatis.cache;

import org.kayura.cache.Cache;

import java.lang.reflect.Constructor;
import java.util.concurrent.locks.ReadWriteLock;

/**
 * @author liangxia@live.com
 *
 */
public class MybatisCache implements Cache {

	private org.apache.ibatis.cache.Cache cache;

	public MybatisCache(Class<? extends org.apache.ibatis.cache.Cache> implClass) {
		try {
			Constructor<? extends org.apache.ibatis.cache.Cache> candidate = implClass.getConstructor();
			cache = candidate.newInstance();
		} catch (Exception e) {
		}
	}

	@SuppressWarnings("unused")
	private MybatisCache() {
		// ...
	}

	public String getId() {
		return cache.getId();
	}

	public void put(Object key, Object value) {
		cache.putObject(key, value);
	}

	public Object get(Object key) {
		return cache.getObject(key);
	}

	public Object remove(Object key) {
		return cache.removeObject(key);
	}

	public void clear() {
		cache.clear();
	}

	public int getSize() {
		return cache.getSize();
	}

	public ReadWriteLock getReadWriteLock() {
		return cache.getReadWriteLock();
	}

}
