/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

import org.kayura.tags.types.RawString;

/**
 * NumberBoxTag
 *
 * @author liangxia@live.com
 */
public class NumberBoxTag extends ValidateBoxTag {

	private static final long serialVersionUID = 8501382139638396239L;

	private Boolean disabled;
	private Double value;
	private Double min;
	private Double max;
	private Double precision;
	private String decimalSeparator;
	private String groupSeparator;
	private String prefix;
	private String suffix;

	private String filter;
	private String formatter;
	private String parser;

	private String onChange;

	@Override
	public String getEasyUITag() {
		return "numberbox";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		putMap(map, "disabled", disabled);
		putMap(map, "value", value);
		putMap(map, "min", min);
		putMap(map, "max", max);
		putMap(map, "precision", precision);
		putMap(map, "decimalSeparator", decimalSeparator);
		putMap(map, "groupSeparator", groupSeparator);
		putMap(map, "prefix", prefix);
		putMap(map, "suffix", suffix);

		putMap(map, "filter", RawString.make(filter));
		putMap(map, "formatter", RawString.make(formatter));
		putMap(map, "parser", RawString.make(parser));

		putMap(map, "onChange", RawString.make(onChange));

		return map;
	}

	public Boolean getDisabled() {
		return disabled;
	}

	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

	public Double getMin() {
		return min;
	}

	public void setMin(Double min) {
		this.min = min;
	}

	public Double getMax() {
		return max;
	}

	public void setMax(Double max) {
		this.max = max;
	}

	public Double getPrecision() {
		return precision;
	}

	public void setPrecision(Double precision) {
		this.precision = precision;
	}

	public String getDecimalSeparator() {
		return decimalSeparator;
	}

	public void setDecimalSeparator(String decimalSeparator) {
		this.decimalSeparator = decimalSeparator;
	}

	public String getGroupSeparator() {
		return groupSeparator;
	}

	public void setGroupSeparator(String groupSeparator) {
		this.groupSeparator = groupSeparator;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public String getSuffix() {
		return suffix;
	}

	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	public String getFormatter() {
		return formatter;
	}

	public void setFormatter(String formatter) {
		this.formatter = formatter;
	}

	public String getParser() {
		return parser;
	}

	public void setParser(String parser) {
		this.parser = parser;
	}

	public String getOnChange() {
		return onChange;
	}

	public void setOnChange(String onChange) {
		this.onChange = onChange;
	}

}
