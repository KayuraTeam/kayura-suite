/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.utils;

import java.util.regex.Pattern;

/**
 * 
 * @author liangxia@live.com
 */
public class StringUtils {

	public static final String SPECIAL_SYMBOLS = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";

	/**
	 * 清除字符串中的特殊字符.
	 * 
	 * @param source
	 *            源字符串.
	 * @return 返回清除后剩余的字符串.
	 */
	public static String cleanSpecial(String source) {
		return clean(source, SPECIAL_SYMBOLS);
	}

	/**
	 * 将多个参数字段合并为字符串.
	 * 
	 * @param delimiter
	 *            间隔符.
	 * @param args
	 *            多个合并元素.
	 * @return 返回新的字符串.
	 */
	public static String join(String delimiter, Object[] args) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < args.length; i++) {
			if (i == (args.length - 1)) {
				sb.append(args[i]);
			} else {
				sb.append(args[i]).append(delimiter);
			}
		}
		return new String(sb);
	}

	public static String join(String delimiter, int[] args) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < args.length; i++) {
			if (i == (args.length - 1)) {
				sb.append(args[i]);
			} else {
				sb.append(args[i]).append(delimiter);
			}
		}
		return new String(sb);
	}

	/**
	 * 清除所有空白字符串.
	 * 
	 * @param source
	 *            源字符串.
	 * @return 返回清除后剩余的字符串.
	 */
	public static String cleanSpace(String source) {
		return source.replaceAll("\\s*", "");
	}

	/**
	 * 清除字符串中的指定字符.
	 * 
	 * @param source
	 *            源字符串.
	 * @param symbols
	 *            要清除的匹配字符.
	 * @return 返回清除后剩余的字符串.
	 */
	public static String clean(String source, char[] symbols) {
		return clean(source, symbols.toString());
	}

	/**
	 * 清除字符串中的指定字符.
	 * 
	 * @param source
	 *            源字符串.
	 * @param symbols
	 *            要清除的匹配字符.
	 * @return 返回清除后剩余的字符串.
	 */
	public static String clean(String source, String symbols) {
		return Pattern.compile(SPECIAL_SYMBOLS).matcher(source).replaceAll("").trim();
	}

	/**
	 * 检查字符串是否为null或空字符或空白字符.
	 * 
	 * @param str
	 *            源字符串.
	 * @return 若为null或空字符或空白字符，将返回 true.
	 */
	public static boolean isEmpty(String str) {
		return (str == null || "".equals(str.trim()));
	}

	public static boolean isNotEmpty(String cs) {
		return !isEmpty(cs);
	}

	public static String emptyToNull(String str) {
		return isEmpty(str) ? null : str;
	}

	public static String toString(Object value) {
		return value != null ? value.toString() : null;
	}

	/**
	 * 比较2个字符串是否相同.
	 * 
	 * @param str1
	 *            第1个字符串.
	 * @param str2
	 *            第2个字符串.
	 * @return 相同返回 true 否则返回 false.
	 */
	public static boolean equals(String str1, String str2) {
		if (str1 != null && str1 != null) {
			return str1.equals(str2);
		} else if (str1 == null && str2 == null) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean contains(char[] source, char symbols) {
		int strLen = source.length;
		for (int i = 0; i < strLen; i++) {
			if (symbols == source[i]) {
				return true;
			}
		}
		return false;
	}

	public static boolean contains(String source, char symbols) {
		int strLen = source.length();
		for (int i = 0; i < strLen; i++) {
			if (symbols == source.charAt(i)) {
				return true;
			}
		}
		return false;
	}

	public static Integer[] toInteger(String[] source) {

		Integer[] result = new Integer[source.length];

		for (int i = 0; i < source.length; i++) {
			Integer v = Integer.getInteger(source[i]);
			if (v != null) {
				result[i] = v;
			}
		}
		return result;
	}

	public static Integer[] toInteger(String source) {

		if (!isEmpty(source)) {
			return toInteger(source.split(","));
		} else {
			return null;
		}
	}

	public static int toInteger(String source, int value) {

		if (!isEmpty(source)) {
			try {
				return Integer.parseInt(source);
			} catch (Exception e) {
			}
		}
		return value;
	}

	/**
	 * 判断一个字符串是否为 EL 表达式.
	 * @param value
	 * @return
	 */
	public static boolean isExpression(String value) {

		return isNotEmpty(value) && value.startsWith("${") && value.endsWith("}");
	}

}
