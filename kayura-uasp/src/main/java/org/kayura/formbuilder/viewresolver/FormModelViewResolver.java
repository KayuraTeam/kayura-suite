package org.kayura.formbuilder.viewresolver;

import java.util.List;

import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.FormFieldList;

public class FormModelViewResolver {

	private List<FormFiledResolver> viewResolvers;

	public List<FormFiledResolver> getViewResolvers() {
		return viewResolvers;
	}

	public String render(FormFieldList formFields) {

		StringBuilder sb = new StringBuilder();
		sb.append("<table>");
		for (FormField formField : formFields) {
			FormFiledResolver resolver = getFormFiledResolver(formField);
			if (resolver != null) {
				sb.append(resolver.render(formField, ""));
			}
		}
		sb.append("</table>");
		return sb.toString();
	}

	private FormFiledResolver getFormFiledResolver(FormField formField) {

		for (FormFiledResolver resolver : viewResolvers) {
			if (formField.getFieldType().equalsIgnoreCase(resolver.getfieldType())) {
				return resolver;
			}
		}
		return null;
	}

}
