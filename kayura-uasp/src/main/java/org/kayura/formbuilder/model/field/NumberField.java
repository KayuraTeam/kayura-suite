package org.kayura.formbuilder.model.field;

/**
 * 数字格式字段.
 * 
 * @author liangxia@live.com
 * 
 */
public class NumberField extends InputField {

	private Integer min;
	private Integer max;
	private String unit;

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
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

}
