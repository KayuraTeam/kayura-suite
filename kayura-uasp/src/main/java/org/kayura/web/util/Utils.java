package org.kayura.web.util;

import javax.servlet.jsp.tagext.TagSupport;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by jf on 15/3/1.
 */
public class Utils extends TagSupport {

	private static final long serialVersionUID = 1L;
	private final static String DEFAULT_DATE_FORMATTER_STRING = "yyyy-MM-dd";

	public static String stringDate(Date date, String formatter) {
		if (date == null) {
			return "";
		}
		if (formatter == null) {
			formatter = DEFAULT_DATE_FORMATTER_STRING;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(formatter);
		return sdf.format(date);
	}

	public static String formatFileSize(long size) {
		double boundary = Math.pow(1024, 4);
		if (size > boundary) {
			return round(size / boundary, 1) + " TB";
		}
		// GB
		if (size > (boundary /= 1024)) {
			return round(size / boundary, 1) + " GB";
		}

		// MB
		if (size > (boundary /= 1024)) {
			return round(size / boundary, 1) + " MB";
		}

		// KB
		if (size > 1024) {
			return Math.round(size / 1024) + " KB";
		}

		return size + " B";
	}

	private static double round(double num, int precision) {
		return Math.round(num * Math.pow(10, precision)) / Math.pow(10, precision);
	}
}
