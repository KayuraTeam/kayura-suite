/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

/**
 * TimeSpinnerTag
 *
 * @author liangxia@live.com
 */
public class TimeSpinnerTag extends SpinnerTag {

	private static final long serialVersionUID = 8940204751354271904L;

	private String separator;
	private Boolean showSeconds;
	private Integer highlight;

	@Override
	public String getEasyUITag() {
		return "timespinner";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		putMap(map, "separator", separator);
		putMap(map, "showSeconds", showSeconds);
		putMap(map, "highlight", highlight);

		return map;
	}

	public String getSeparator() {
		return separator;
	}

	public void setSeparator(String separator) {
		this.separator = separator;
	}

	public Boolean getShowSeconds() {
		return showSeconds;
	}

	public void setShowSeconds(Boolean showSeconds) {
		this.showSeconds = showSeconds;
	}

	public Integer getHighlight() {
		return highlight;
	}

	public void setHighlight(Integer highlight) {
		this.highlight = highlight;
	}

}
