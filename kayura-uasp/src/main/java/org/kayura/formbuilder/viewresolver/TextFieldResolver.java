package org.kayura.formbuilder.viewresolver;

import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.field.TextField;

public class TextFieldResolver implements FormFiledResolver {

	@Override
	public String getfieldType() {
		return FormField.TYPE_TEXT;
	}

	@Override
	public String render(FormField formField, Object value) {

		if (FormField.TYPE_TEXT.equalsIgnoreCase(formField.getFieldType())) {
			if (formField instanceof TextField) {
				TextField m = (TextField) formField;

				StringBuilder sb = new StringBuilder();
				sb.append("<tr>");
				sb.append("<td>").append(m.getLabel()).append("</td>");
				sb.append("<td>");
				sb.append("<input type='text' ");
				sb.append(" id='").append(m.getName()).append("' ");
				sb.append(" name='").append(m.getName()).append("' ");
				sb.append(" value='").append(value == null ? "" : value).append("' >");
				sb.append("</td>");
				sb.append("</tr>");
			}
		}

		return null;
	}

}
