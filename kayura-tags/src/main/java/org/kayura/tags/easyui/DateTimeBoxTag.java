/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

/**
 * DateTimeBoxTag
 *
 * @author liangxia@live.com
 */
public class DateTimeBoxTag extends DateBoxTag {

	private static final long serialVersionUID = 7605450864758774167L;

	private Integer spinnerWidth;
	private Boolean showSeconds;
	private String timeSeparator;

	@Override
	public String getEasyUITag() {
		return "datetimebox";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		putMap(map, "spinnerWidth", spinnerWidth);
		putMap(map, "showSeconds", showSeconds);
		putMap(map, "timeSeparator", timeSeparator);

		return map;
	}

	public Integer getSpinnerWidth() {
		return spinnerWidth;
	}

	public void setSpinnerWidth(Integer spinnerWidth) {
		this.spinnerWidth = spinnerWidth;
	}

	public Boolean getShowSeconds() {
		return showSeconds;
	}

	public void setShowSeconds(Boolean showSeconds) {
		this.showSeconds = showSeconds;
	}

	public String getTimeSeparator() {
		return timeSeparator;
	}

	public void setTimeSeparator(String timeSeparator) {
		this.timeSeparator = timeSeparator;
	}

}
