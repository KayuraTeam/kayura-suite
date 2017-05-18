/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspWriter;

import org.kayura.tags.types.RawString;

/**
 * ColumnTag
 *
 * @author liangxia@live.com
 */
public class ColumnTag extends TagRender {

	private static final long serialVersionUID = -7362265790359475241L;

	private String title;
	private String field;
	private Integer width;
	private Integer rowspan;
	private Integer colspan;
	private String align;
	private String halign;
	private Boolean sortable;
	private String order;
	private Boolean resizable;
	private Boolean fixed;
	private Boolean hidden;
	private Boolean checkbox;

	private String formatter;
	private String styler;
	private String sorter;
	private String editor;

	@Override
	public String getEasyUITag() {
		return null;
	}

	@Override
	public String getHtmlTag() {
		return "th";
	}

	@Override
	public void doRenderProperty(JspWriter out) throws Exception {

/*		if (rowspan != null) {
			out.write(" rowspan=\"" + rowspan + "\"");
		}

		if (colspan != null) {
			out.write(" colspan=\"" + colspan + "\"");
		}*/
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "rowspan", rowspan);
		putMap(map, "colspan", colspan);
		
		putMap(map, "title", title);
		putMap(map, "field", field);
		putMap(map, "width", width);
		putMap(map, "align", align);
		putMap(map, "halign", halign);
		putMap(map, "sortable", sortable);
		putMap(map, "order", order);
		putMap(map, "resizable", resizable);
		putMap(map, "fixed", fixed);
		putMap(map, "hidden", hidden);
		putMap(map, "checkbox", checkbox);

		putMap(map, "formatter", RawString.make(formatter));
		putMap(map, "styler", RawString.make(styler));
		putMap(map, "sorter", RawString.make(sorter));
		putMap(map, "editor", RawString.make(editor));

		return map;
	}

	public String getTitle() {
		return title;
	}

	public String getField() {
		return field;
	}

	public Integer getWidth() {
		return width;
	}

	public Integer getRowspan() {
		return rowspan;
	}

	public Integer getColspan() {
		return colspan;
	}

	public String getAlign() {
		return align;
	}

	public String getHalign() {
		return halign;
	}

	public Boolean getSortable() {
		return sortable;
	}

	public String getOrder() {
		return order;
	}

	public Boolean getResizable() {
		return resizable;
	}

	public Boolean getFixed() {
		return fixed;
	}

	public Boolean getHidden() {
		return hidden;
	}

	public Boolean getCheckbox() {
		return checkbox;
	}

	public String getFormatter() {
		return formatter;
	}

	public String getStyler() {
		return styler;
	}

	public String getSorter() {
		return sorter;
	}

	public String getEditor() {
		return editor;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setField(String field) {
		this.field = field;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public void setRowspan(Integer rowspan) {
		this.rowspan = rowspan;
	}

	public void setColspan(Integer colspan) {
		this.colspan = colspan;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	public void setHalign(String halign) {
		this.halign = halign;
	}

	public void setSortable(Boolean sortable) {
		this.sortable = sortable;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public void setResizable(Boolean resizable) {
		this.resizable = resizable;
	}

	public void setFixed(Boolean fixed) {
		this.fixed = fixed;
	}

	public void setHidden(Boolean hidden) {
		this.hidden = hidden;
	}

	public void setCheckbox(Boolean checkbox) {
		this.checkbox = checkbox;
	}

	public void setFormatter(String formatter) {
		this.formatter = formatter;
	}

	public void setStyler(String styler) {
		this.styler = styler;
	}

	public void setSorter(String sorter) {
		this.sorter = sorter;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

}
