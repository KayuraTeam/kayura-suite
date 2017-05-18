/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.Map;

import org.kayura.tags.types.RawString;

/**
 * CalendarTag
 *
 * @author liangxia@live.com
 */
public class CalendarTag extends TagRender {

	private static final long serialVersionUID = 8734396732658508865L;

	private Integer width;
	private Integer height;
	private Boolean fit;
	private Boolean border;
	private Integer firstDay;

	private String weeks;
	private String months;

	private Integer year;
	private Integer month;
	private String current;

	private String formatter;
	private String styler;
	private String validator;

	private String onSelect;
	private String onChange;

	@Override
	public String getEasyUITag() {
		return "calendar";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "width", width);
		putMap(map, "height", height);
		putMap(map, "fit", fit);
		putMap(map, "border", border);
		putMap(map, "firstDay", firstDay);
		
		putMap(map, "weeks", RawString.make(weeks));
		putMap(map, "months", RawString.make(months));

		putMap(map, "year", year);
		putMap(map, "month", month);
		putMap(map, "current", current);

		putMap(map, "formatter", RawString.make(formatter));
		putMap(map, "styler", RawString.make(styler));
		putMap(map, "validator", RawString.make(validator));

		putMap(map, "onSelect", RawString.make(onSelect));
		putMap(map, "onChange", RawString.make(onChange));

		return map;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public Boolean getFit() {
		return fit;
	}

	public void setFit(Boolean fit) {
		this.fit = fit;
	}

	public Boolean getBorder() {
		return border;
	}

	public void setBorder(Boolean border) {
		this.border = border;
	}

	public Integer getFirstDay() {
		return firstDay;
	}

	public void setFirstDay(Integer firstDay) {
		this.firstDay = firstDay;
	}

	public String getWeeks() {
		return weeks;
	}

	public void setWeeks(String weeks) {
		this.weeks = weeks;
	}

	public String getMonths() {
		return months;
	}

	public void setMonths(String months) {
		this.months = months;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public String getCurrent() {
		return current;
	}

	public void setCurrent(String current) {
		this.current = current;
	}

	public String getFormatter() {
		return formatter;
	}

	public void setFormatter(String formatter) {
		this.formatter = formatter;
	}

	public String getStyler() {
		return styler;
	}

	public void setStyler(String styler) {
		this.styler = styler;
	}

	public String getValidator() {
		return validator;
	}

	public void setValidator(String validator) {
		this.validator = validator;
	}

	public String getOnSelect() {
		return onSelect;
	}

	public void setOnSelect(String onSelect) {
		this.onSelect = onSelect;
	}

	public String getOnChange() {
		return onChange;
	}

	public void setOnChange(String onChange) {
		this.onChange = onChange;
	}

}
