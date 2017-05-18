package org.kayura.formbuilder.model.field;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

/**
 * 日期字段
 * 
 * @author liangxia@live.com
 *
 */
public class DateTimeField extends InputField {

	private String format;

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	@Override
	public Object getValue() {

		Object value = super.getValue();
		if (StringUtils.isNotEmpty(this.format)) {
			if (value != null && value instanceof Date) {
				SimpleDateFormat format = new SimpleDateFormat(this.format);
				return format.format(value);
			}
		}
		return value;
	}

}
