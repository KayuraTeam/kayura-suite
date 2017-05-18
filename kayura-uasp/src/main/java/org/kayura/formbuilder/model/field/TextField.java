package org.kayura.formbuilder.model.field;

/**
 * 
 * @author liangxia@live.com
 * 
 */
public class TextField extends InputField {

	private String placeHolder;
	private Integer minLength;
	private Integer maxLength;
	private String lengthUnits;

	public Integer getMinlength() {
		return minLength;
	}

	public void setMinLength(Integer minLength) {
		this.minLength = minLength;
	}

	public Integer getMaxLength() {
		return maxLength;
	}

	public void setMaxLength(Integer maxLength) {
		this.maxLength = maxLength;
	}

	public String getLengthUnits() {
		return lengthUnits;
	}

	public void setLengthUnits(String lengthUnits) {
		this.lengthUnits = lengthUnits;
	}

	public String getPlaceHolder() {
		return placeHolder;
	}

	public void setPlaceHolder(String placeHolder) {
		this.placeHolder = placeHolder;
	}

}
