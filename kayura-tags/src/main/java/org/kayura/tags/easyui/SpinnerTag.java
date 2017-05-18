/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

import org.kayura.tags.types.RawString;

/**
 * SpinnerTag
 *
 * @author liangxia@live.com
 */
public class SpinnerTag extends ValidateBoxTag {

	private static final long serialVersionUID = 3703178763442495444L;

	private String width;
	private String height;
	private Double value;
	private Integer min;
	private Integer max;
	private Double increment;
	private Boolean editable;
	private Boolean disabled;
	private Boolean readonly;

	private String spin;

	private String onSpinUp;
	private String onSpinDown;
	private String onChange;

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		putMap(map, "width", width);
		putMap(map, "height", height);
		putMap(map, "value", value);
		putMap(map, "min", min);
		putMap(map, "max", max);
		putMap(map, "increment", increment);
		putMap(map, "editable", editable);
		putMap(map, "disabled", disabled);
		putMap(map, "readonly", readonly);

		putMap(map, "spin", RawString.make(spin));

		putMap(map, "onSpinUp", RawString.make(onSpinUp));
		putMap(map, "onSpinDown", RawString.make(onSpinDown));
		putMap(map, "onChange", RawString.make(onChange));

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

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
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

	public Double getIncrement() {
		return increment;
	}

	public void setIncrement(Double increment) {
		this.increment = increment;
	}

	public Boolean getEditable() {
		return editable;
	}

	public void setEditable(Boolean editable) {
		this.editable = editable;
	}

	public Boolean getDisabled() {
		return disabled;
	}

	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}

	public Boolean getReadonly() {
		return readonly;
	}

	public void setReadonly(Boolean readonly) {
		this.readonly = readonly;
	}

	public String getSpin() {
		return spin;
	}

	public void setSpin(String spin) {
		this.spin = spin;
	}

	public String getOnSpinUp() {
		return onSpinUp;
	}

	public void setOnSpinUp(String onSpinUp) {
		this.onSpinUp = onSpinUp;
	}

	public String getOnSpinDown() {
		return onSpinDown;
	}

	public void setOnSpinDown(String onSpinDown) {
		this.onSpinDown = onSpinDown;
	}

	public String getOnChange() {
		return onChange;
	}

	public void setOnChange(String onChange) {
		this.onChange = onChange;
	}

}
