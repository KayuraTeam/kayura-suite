/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.utils;

import java.security.SecureRandom;
import java.util.UUID;

import org.apache.commons.codec.binary.Base64;

/**
 * @author liangxia@live.com
 */
public class KeyUtils {

	private static SecureRandom random = new SecureRandom();

	public static String newId() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}

	/**
	 * 获取16位长度的随机 Base64 字符.
	 * 
	 * @return
	 */
	public static String random() {

		return random(16);
	}

	public static String random(Integer length) {

		byte[] newToken = new byte[length];
		random.nextBytes(newToken);
		return new String(Base64.encodeBase64(newToken));
	}
}
