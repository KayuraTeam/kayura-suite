package org.kayura.tags.easyui;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.kayura.tags.types.FormAttribute;
import org.kayura.tags.types.TagUtils;

public class AutoFormTag extends SimpleTagSupport {

	public static final String TYPE_STRING = "string";
	public static final String TYPE_TEXT = "text";
	public static final String TYPE_DATE = "date";
	public static final String TYPE_DATETIME = "datetime";
	public static final String TYPE_TIME = "time";
	public static final String TYPE_NUMBER = "number";
	public static final String TYPE_ENUM = "enum";

	private List<FormAttribute> formAttributes;

	@Override
	public void doTag() throws JspException, IOException {

		if (formAttributes == null) {
			throw new JspTagException("必须指定表单属性集。");
		}

		JspWriter out = this.getJspContext().getOut();
		out.write("<table cellpadding='5' style='width:100%'>");
		for (FormAttribute fa : formAttributes) {

			if (fa.isReadable()) {

				out.write("<tr><td>");
				out.write(fa.getName());
				out.write(":</td><td>");

				if (fa.isWriteable()) {

					if (TYPE_STRING.equals(fa.getType())) {
						out.write("<input class='easyui-textbox' name='");
						out.write(fa.getId());
						out.write("' style='width:80%' value='");
						if (!TagUtils.isEmpty(fa.getValue())) {
							out.write(fa.getValue());
						}
						out.write("' ");
						if (fa.isRequired()) {
							out.write("required='required'");
						}
						out.write(" />");
					} else if (TYPE_TEXT.equals(fa.getType())) {
						out.write("<input class='easyui-textbox' name='");
						out.write(fa.getId());
						out.write("' style='width:80%;height:50px' multiline='true' value='");
						if (!TagUtils.isEmpty(fa.getValue())) {
							out.write(fa.getValue());
						}
						out.write("' ");
						if (fa.isRequired()) {
							out.write("required='required'");
						}
						out.write(" />");
					} else if (TYPE_DATE.equals(fa.getType())) {
						out.write("<input class='easyui-datebox' name='");
						out.write(fa.getId());
						out.write("' style='width:150px' value='");
						if (!TagUtils.isEmpty(fa.getValue())) {
							out.write(fa.getValue());
						}
						out.write("' ");
						if (fa.isRequired()) {
							out.write("required='required'");
						}
						out.write(" />");
					} else if (TYPE_DATETIME.equals(fa.getType())) {
						out.write("<input class='easyui-datetimebox' name='");
						out.write(fa.getId());
						out.write("' style='width:150px' value='");
						if (!TagUtils.isEmpty(fa.getValue())) {
							out.write(fa.getValue());
						}
						out.write("' ");
						if (fa.isRequired()) {
							out.write("required='required'");
						}
						out.write(" />");
					} else if (TYPE_TIME.equals(fa.getType())) {
						out.write("<input class='easyui-timespinner' name='");
						out.write(fa.getId());
						out.write("' style='width:120px' value='");
						if (!TagUtils.isEmpty(fa.getValue())) {
							out.write(fa.getValue());
						}
						out.write("' ");
						if (fa.isRequired()) {
							out.write("required='required'");
						}
						out.write(" />");
					} else if (TYPE_NUMBER.equals(fa.getType())) {
						out.write("<input class='easyui-numberbox' name='");
						out.write(fa.getId());
						out.write("' style='width:120px' value='");
						if (!TagUtils.isEmpty(fa.getValue())) {
							out.write(fa.getValue());
						}
						out.write("' ");
						if (fa.isRequired()) {
							out.write("required='required'");
						}
						out.write(" />");
					} else if (TYPE_ENUM.equals(fa.getType())) {
						out.write("<select class='easyui-combobox' style='width:auto;' name='");
						out.write(fa.getId());
						out.write("' data-options=\"panelHeight:'auto'");
						if (!TagUtils.isEmpty(fa.getValue())) {
							out.write(",value:'" + fa.getValue() + "'");
						}
						out.write("\" ");
						if (fa.isRequired()) {
							out.write(" required='required'");
						}
						out.write(">");

						Map<String, String> items = fa.getItems();
						for (String k : items.keySet()) {
							out.write("<option value='" + k + "'>" + items.get(k) + "</option>");
						}

						out.write("</select>");
					}
				} else {
					out.write(fa.getValue());
				}

				out.write("</td></tr>");
			}
		}
		out.write("</table>");
	}

	public List<FormAttribute> getFormAttributes() {
		return formAttributes;
	}

	public void setFormAttributes(List<FormAttribute> formAttributes) {
		this.formAttributes = formAttributes;
	}

}
