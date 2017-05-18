package org.kayura.formbuilder.viewresolver;

import org.kayura.formbuilder.model.FormField;

public interface FormFiledResolver {

	String getfieldType();

	String render(FormField formField, Object value);

}
