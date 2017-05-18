/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

import org.kayura.tags.types.RawString;
import org.kayura.tags.types.TagUtils;

/**
 * ComboTreeTag
 *
 * @author liangxia@live.com
 */
public class ComboTreeTag extends ComboTag {

	private static final long serialVersionUID = 8115052203978775212L;

	// private Boolean editable;

	private String url;
	private String method;
	private Boolean animate;
	private Boolean checkbox;
	private Boolean cascadeCheck;
	private Boolean onlyLeafCheck;
	private Boolean lines;
	private Boolean dnd;
	private Object data;
	private Object queryParams;
	private String formatter;
	private String filter;
	private String loader;
	private String loadFilter;

	private String onClick;
	private String onDblClick;
	private String onBeforeLoad;
	private String onLoadSuccess;
	private String onLoadError;
	private String onBeforeExpand;
	private String onExpand;
	private String onBeforeCollapse;
	private String onCollapse;
	private String onBeforeCheck;
	private String onCheck;
	private String onBeforeSelect;
	private String onSelect;
	private String onContextMenu;
	private String onBeforeDrag;
	private String onStartDrag;
	private String onStopDrag;
	private String onDragEnter;
	private String onDragOver;
	private String onDragLeave;
	private String onBeforeDrop;
	private String onDrop;
	private String onBeforeEdit;
	private String onAfterEdit;
	private String onCancelEdit;

	@Override
	public String getEasyUITag() {
		return "combotree";
	}

	@Override
	public Boolean emptyBody() {

		return !isEmpty(url) || data != null;
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		// putMap(map, "editable", editable);

		// tree
		
		if (!isEmpty(method)) {
			if (TagUtils.METHOD_POST.equals(method.toUpperCase()) || TagUtils.METHOD_GET.equals(method.toUpperCase())) {
				putMap(map, "method", method);
			} else {
				if (logger.isErrorEnabled()) {
					logger.error("定义的 method 值: " + method + " 无效。");
				}
			}
		}

		putMap(map, "url", url);
		putMap(map, "animate", animate);
		putMap(map, "checkbox", checkbox);
		putMap(map, "cascadeCheck", cascadeCheck);
		putMap(map, "onlyLeafCheck", onlyLeafCheck);
		putMap(map, "lines", lines);
		putMap(map, "dnd", dnd);

		if (data != null) {
			if (data instanceof String) {
				putMap(map, "data", RawString.make((String) data));
			} else {
				putMap(map, "data", data);
			}
		}

		if (queryParams != null) {
			if (queryParams instanceof String) {
				putMap(map, "queryParams", RawString.make((String) queryParams));
			} else {
				putMap(map, "queryParams", queryParams);
			}
		}

		putMap(map, "formatter", RawString.make(formatter));
		putMap(map, "filter", RawString.make(filter));
		putMap(map, "loader", RawString.make(loader));
		putMap(map, "loadFilter", RawString.make(loadFilter));

		putMap(map, "onClick", RawString.make(onClick));
		putMap(map, "onDblClick", RawString.make(onDblClick));
		putMap(map, "onBeforeLoad", RawString.make(onBeforeLoad));
		putMap(map, "onLoadSuccess", RawString.make(onLoadSuccess));
		putMap(map, "onLoadError", RawString.make(onLoadError));
		putMap(map, "onBeforeExpand", RawString.make(onBeforeExpand));
		putMap(map, "onExpand", RawString.make(onExpand));
		putMap(map, "onBeforeCollapse", RawString.make(onBeforeCollapse));
		putMap(map, "onCollapse", RawString.make(onCollapse));
		putMap(map, "onBeforeCheck", RawString.make(onBeforeCheck));
		putMap(map, "onCheck", RawString.make(onCheck));
		putMap(map, "onBeforeSelect", RawString.make(onBeforeSelect));
		putMap(map, "onSelect", RawString.make(onSelect));
		putMap(map, "onContextMenu", RawString.make(onContextMenu));
		putMap(map, "onBeforeDrag", RawString.make(onBeforeDrag));
		putMap(map, "onStartDrag", RawString.make(onStartDrag));
		putMap(map, "onStopDrag", RawString.make(onStopDrag));
		putMap(map, "onDragEnter", RawString.make(onDragEnter));
		putMap(map, "onDragOver", RawString.make(onDragOver));
		putMap(map, "onDragLeave", RawString.make(onDragLeave));
		putMap(map, "onBeforeDrop", RawString.make(onBeforeDrop));
		putMap(map, "onDrop", RawString.make(onDrop));
		putMap(map, "onBeforeEdit", RawString.make(onBeforeEdit));
		putMap(map, "onAfterEdit", RawString.make(onAfterEdit));
		putMap(map, "onCancelEdit", RawString.make(onCancelEdit));
		
		return map;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public Boolean getAnimate() {
		return animate;
	}

	public void setAnimate(Boolean animate) {
		this.animate = animate;
	}

	public Boolean getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(Boolean checkbox) {
		this.checkbox = checkbox;
	}

	public Boolean getCascadeCheck() {
		return cascadeCheck;
	}

	public void setCascadeCheck(Boolean cascadeCheck) {
		this.cascadeCheck = cascadeCheck;
	}

	public Boolean getOnlyLeafCheck() {
		return onlyLeafCheck;
	}

	public void setOnlyLeafCheck(Boolean onlyLeafCheck) {
		this.onlyLeafCheck = onlyLeafCheck;
	}

	public Boolean getLines() {
		return lines;
	}

	public void setLines(Boolean lines) {
		this.lines = lines;
	}

	public Boolean getDnd() {
		return dnd;
	}

	public void setDnd(Boolean dnd) {
		this.dnd = dnd;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public Object getQueryParams() {
		return queryParams;
	}

	public void setQueryParams(Object queryParams) {
		this.queryParams = queryParams;
	}

	public String getFormatter() {
		return formatter;
	}

	public void setFormatter(String formatter) {
		this.formatter = formatter;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	public String getLoader() {
		return loader;
	}

	public void setLoader(String loader) {
		this.loader = loader;
	}

	public String getLoadFilter() {
		return loadFilter;
	}

	public void setLoadFilter(String loadFilter) {
		this.loadFilter = loadFilter;
	}

	public String getOnClick() {
		return onClick;
	}

	public void setOnClick(String onClick) {
		this.onClick = onClick;
	}

	public String getOnDblClick() {
		return onDblClick;
	}

	public void setOnDblClick(String onDblClick) {
		this.onDblClick = onDblClick;
	}

	public String getOnBeforeLoad() {
		return onBeforeLoad;
	}

	public void setOnBeforeLoad(String onBeforeLoad) {
		this.onBeforeLoad = onBeforeLoad;
	}

	public String getOnLoadSuccess() {
		return onLoadSuccess;
	}

	public void setOnLoadSuccess(String onLoadSuccess) {
		this.onLoadSuccess = onLoadSuccess;
	}

	public String getOnLoadError() {
		return onLoadError;
	}

	public void setOnLoadError(String onLoadError) {
		this.onLoadError = onLoadError;
	}

	public String getOnBeforeExpand() {
		return onBeforeExpand;
	}

	public void setOnBeforeExpand(String onBeforeExpand) {
		this.onBeforeExpand = onBeforeExpand;
	}

	public String getOnExpand() {
		return onExpand;
	}

	public void setOnExpand(String onExpand) {
		this.onExpand = onExpand;
	}

	public String getOnBeforeCollapse() {
		return onBeforeCollapse;
	}

	public void setOnBeforeCollapse(String onBeforeCollapse) {
		this.onBeforeCollapse = onBeforeCollapse;
	}

	public String getOnCollapse() {
		return onCollapse;
	}

	public void setOnCollapse(String onCollapse) {
		this.onCollapse = onCollapse;
	}

	public String getOnBeforeCheck() {
		return onBeforeCheck;
	}

	public void setOnBeforeCheck(String onBeforeCheck) {
		this.onBeforeCheck = onBeforeCheck;
	}

	public String getOnCheck() {
		return onCheck;
	}

	public void setOnCheck(String onCheck) {
		this.onCheck = onCheck;
	}

	public String getOnBeforeSelect() {
		return onBeforeSelect;
	}

	public void setOnBeforeSelect(String onBeforeSelect) {
		this.onBeforeSelect = onBeforeSelect;
	}

	public String getOnSelect() {
		return onSelect;
	}

	public void setOnSelect(String onSelect) {
		this.onSelect = onSelect;
	}

	public String getOnContextMenu() {
		return onContextMenu;
	}

	public void setOnContextMenu(String onContextMenu) {
		this.onContextMenu = onContextMenu;
	}

	public String getOnBeforeDrag() {
		return onBeforeDrag;
	}

	public void setOnBeforeDrag(String onBeforeDrag) {
		this.onBeforeDrag = onBeforeDrag;
	}

	public String getOnStartDrag() {
		return onStartDrag;
	}

	public void setOnStartDrag(String onStartDrag) {
		this.onStartDrag = onStartDrag;
	}

	public String getOnStopDrag() {
		return onStopDrag;
	}

	public void setOnStopDrag(String onStopDrag) {
		this.onStopDrag = onStopDrag;
	}

	public String getOnDragEnter() {
		return onDragEnter;
	}

	public void setOnDragEnter(String onDragEnter) {
		this.onDragEnter = onDragEnter;
	}

	public String getOnDragOver() {
		return onDragOver;
	}

	public void setOnDragOver(String onDragOver) {
		this.onDragOver = onDragOver;
	}

	public String getOnDragLeave() {
		return onDragLeave;
	}

	public void setOnDragLeave(String onDragLeave) {
		this.onDragLeave = onDragLeave;
	}

	public String getOnBeforeDrop() {
		return onBeforeDrop;
	}

	public void setOnBeforeDrop(String onBeforeDrop) {
		this.onBeforeDrop = onBeforeDrop;
	}

	public String getOnDrop() {
		return onDrop;
	}

	public void setOnDrop(String onDrop) {
		this.onDrop = onDrop;
	}

	public String getOnBeforeEdit() {
		return onBeforeEdit;
	}

	public void setOnBeforeEdit(String onBeforeEdit) {
		this.onBeforeEdit = onBeforeEdit;
	}

	public String getOnAfterEdit() {
		return onAfterEdit;
	}

	public void setOnAfterEdit(String onAfterEdit) {
		this.onAfterEdit = onAfterEdit;
	}

	public String getOnCancelEdit() {
		return onCancelEdit;
	}

	public void setOnCancelEdit(String onCancelEdit) {
		this.onCancelEdit = onCancelEdit;
	}

}
