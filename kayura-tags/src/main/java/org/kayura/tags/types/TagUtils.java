/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.types;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * TagUtils
 *
 * @author liangxia@live.com
 */
public class TagUtils {

	private static final Log logger = LogFactory.getLog(TagUtils.class);

	public static final String METHOD_POST = "POST";
	public static final String METHOD_GET = "GET";

	private static final ObjectMapper objectMapper = new ObjectMapper();

	static {
		// 不生成值为 null 的属性.
		objectMapper.setSerializationInclusion(Include.NON_NULL);
	}

	public static Boolean isEmpty(String value) {

		return value == null || value.trim().length() == 0;
	}

	public static String json(Object o) {

		String s = null;
		try {
			s = objectMapper.writeValueAsString(o);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			if (logger.isErrorEnabled()) {
				logger.error(e.getMessage(), e);
			}
		}
		return s;
	}

}
