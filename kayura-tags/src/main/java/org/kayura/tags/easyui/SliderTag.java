/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.Map;

import org.kayura.tags.types.RawString;

/**
 * SliderTag
 *
 * @author liangxia@live.com
 */
public class SliderTag extends TagRender {

	private static final long serialVersionUID = -6170135879197337482L;

	private String width;
	private String height;
	private String mode;
	private Boolean reversed;
	private Boolean showTip;
	private Boolean disabled;
	private Boolean range;
	private Integer value;
	private Integer min;
	private Integer max;
	private Integer step;
	private String rule;
	private String tipFormatter;
	private String converter;

	@Override
	public String getEasyUITag() {
		return "slider";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "width", width);
		putMap(map, "height", height);
		putMap(map, "mode", mode);
		putMap(map, "reversed", reversed);
		putMap(map, "showTip", showTip);
		putMap(map, "disabled", disabled);
		putMap(map, "range", range);
		putMap(map, "value", value);
		putMap(map, "min", min);
		putMap(map, "max", max);
		putMap(map, "step", step);
		putMap(map, "value", value);

		putMap(map, "rule", RawString.make(rule));
		putMap(map, "tipFormatter", RawString.make(tipFormatter));
		putMap(map, "converter", RawString.make(converter));

		return map;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public Boolean getReversed() {
		return reversed;
	}

	public void setReversed(Boolean reversed) {
		this.reversed = reversed;
	}

	public Boolean getShowTip() {
		return showTip;
	}

	public void setShowTip(Boolean showTip) {
		this.showTip = showTip;
	}

	public Boolean getDisabled() {
		return disabled;
	}

	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}

	public Boolean getRange() {
		return range;
	}

	public void setRange(Boolean range) {
		this.range = range;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public Integer getMin() {
		return min;
	}

	public void setMin(Integer min) {
		this.min = min;
	}

	public Integer getMax() {
		return max;
	}

	public void setMax(Integer max) {
		this.max = max;
	}

	public Integer getStep() {
		return step;
	}

	public void setStep(Integer step) {
		this.step = step;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public String getTipFormatter() {
		return tipFormatter;
	}

	public void setTipFormatter(String tipFormatter) {
		this.tipFormatter = tipFormatter;
	}

	public String getConverter() {
		return converter;
	}

	public void setConverter(String converter) {
		this.converter = converter;
	}

}
