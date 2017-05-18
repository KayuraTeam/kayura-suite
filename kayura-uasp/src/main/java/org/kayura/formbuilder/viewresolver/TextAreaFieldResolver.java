package org.kayura.formbuilder.viewresolver;

import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.TextAreaField;

public class TextAreaFieldResolver implements FormFiledResolver {

	@Override
	public String getfieldType() {
		return FormField.TYPE_TEXTAREA;
	}

	@Override
	public String render(FormField formField, Object value) {

		if (FormField.TYPE_TEXTAREA.equalsIgnoreCase(formField.getFieldType())) {
			if (formField instanceof TextAreaField) {
				TextAreaField m = (TextAreaField) formField;

				StringBuilder sb = new StringBuilder();
				sb.append("<tr>");
				sb.append("<td>").append(m.getLabel()).append("</td>");
				sb.append("<td>");
				sb.append("<textarea type='text' ");
				sb.append(" id='").append(m.getName()).append("' ");
				sb.append(" name='").append(m.getName()).append("' ");
				sb.append(" value='").append(value == null ? "" : value).append("' >");
				sb.append("</textarea>");
				sb.append("</td>");
				sb.append("</tr>");
			}
		}

		return null;
	}

}
