package org.kayura.formbuilder.model.field;

import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.FormFieldList;

public class TableField extends LabelField {

	private String actionName;
	private FormFieldList children;

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public FormFieldList getChildren() {
		return children;
	}

	public void addChildren(FormField formField) {

		if (this.children == null) {
			this.children = new FormFieldList();
		}
		this.children.add(formField);
	}

	public void setChildren(FormFieldList children) {
		this.children = children;
	}

}
