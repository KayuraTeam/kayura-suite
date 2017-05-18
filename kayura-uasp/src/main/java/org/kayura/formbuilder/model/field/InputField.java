package org.kayura.formbuilder.model.field;

public abstract class InputField extends LabelField {

	private Boolean required;

	public Boolean getRequired() {
		return required;
	}

	public void setRequired(Boolean required) {
		this.required = required;
	}

}
