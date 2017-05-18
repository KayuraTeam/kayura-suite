/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author liangxia@live.com
 *
 */
public class DateUtils {

	public static Date now() {
		return new Date(System.currentTimeMillis());
	}

	public static String now(String format) {
		return format(now(), format);
	}

	public static String formatDate(Date date) {
		return format(date, "yyyy-MM-dd");
	}

	public static String format(Date date) {
		return format(date, "yyyy-MM-dd HH:mm:ss");
	}

	public static String format(Date date, String format) {
		SimpleDateFormat df = new SimpleDateFormat(format);
		return df.format(date);
	}

	public static Date formatDate(String date) {
		return format(date, "yyyy-MM-dd");
	}

	public static Date format(String date) {
		Date dt = format(date, "yyyy-MM-dd HH:mm:ss");
		if (dt == null) {
			return formatDate(date);
		} else {
			return dt;
		}
	}

	public static Date format(String date, String format) {
		SimpleDateFormat df = new SimpleDateFormat(format);
		try {
			return df.parse(date);
		} catch (ParseException e) {
			return null;
		}
	}
}
