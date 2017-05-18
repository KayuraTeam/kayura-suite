/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.utils;

import java.io.IOException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author liangxia@live.com
 *
 */
public class JsonUtils {

	private static Log log = LogFactory.getLog(JsonUtils.class);
	private static ObjectMapper objectMapper = new ObjectMapper();

	public static <E> E fromString(String json, Class<E> classType) {
		E o = null;
		try {
			if (json != null && json != "") {
				o = (E) objectMapper.readValue(json, classType);
			}
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		} catch (IOException e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		return o;
	}

	public static String fromObject(Object value) {
		String s = null;
		try {
			s = objectMapper.writeValueAsString(value);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		return s;
	}
}
