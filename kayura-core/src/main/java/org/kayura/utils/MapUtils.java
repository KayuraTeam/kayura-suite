/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author liangxia@live.com
 */
public class MapUtils {

	public static Map<String, Object> make(String name, Object value) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put(name, value);

		return args;
	}

}
