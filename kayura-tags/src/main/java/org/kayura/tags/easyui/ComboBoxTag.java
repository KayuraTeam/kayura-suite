/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

import org.kayura.tags.types.RawString;
import org.kayura.tags.types.TagUtils;

/**
 * ComboBoxTag
 *
 * @author liangxia@live.com
 */
public class ComboBoxTag extends ComboTag {

	private static final long serialVersionUID = -3501316707895724419L;

	public static final String MODE_REMOTE = "REMOTE";
	public static final String MODE_LOCAL = "LOCAL";

	private String valueField;
	private String textField;
	private String groupField;

	private String mode;
	private String url;
	private String method;

	private Object data;
	private Object queryParams;

	private String groupFormatter;
	private String filter;
	private String formatter;
	private String loader;
	private String loadFilter;

	private String onBeforeLoad;
	private String onLoadSuccess;
	private String onLoadError;
	private String onSelect;
	private String onUnselect;

	@Override
	public String getEasyUITag() {
		return "combobox";
	}

	@Override
	public Boolean emptyBody() {

		return !isEmpty(url) || data != null;
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		putMap(map, "url", url);

		if (!isEmpty(mode)) {
			if (MODE_REMOTE.equals(mode.toUpperCase()) || MODE_LOCAL.equals(mode.toUpperCase())) {
				putMap(map, "mode", mode);
			} else {
				if (logger.isErrorEnabled()) {
					logger.error("定义的 mode 值: " + mode + " 无效。");
				}
			}
		}

		if (!isEmpty(method)) {
			if (TagUtils.METHOD_POST.equals(method.toUpperCase()) || TagUtils.METHOD_GET.equals(method.toUpperCase())) {
				putMap(map, "method", method);
			} else {
				if (logger.isErrorEnabled()) {
					logger.error("定义的 method 值: " + method + " 无效。");
				}
			}
		}

		if (data instanceof String) {
			data = RawString.make((String) data);
		}
		putMap(map, "data", data);

		if (queryParams instanceof String) {
			queryParams = RawString.make((String) queryParams);
		}
		putMap(map, "queryParams", queryParams);

		putMap(map, "valueField", valueField);
		putMap(map, "textField", textField);
		putMap(map, "groupField", groupField);

		putMap(map, "groupFormatter", RawString.make(groupFormatter));
		putMap(map, "filter", RawString.make(filter));
		putMap(map, "formatter", RawString.make(formatter));
		putMap(map, "loader", RawString.make(loader));
		putMap(map, "loadFilter", RawString.make(loadFilter));

		putMap(map, "onBeforeLoad", RawString.make(onBeforeLoad));
		putMap(map, "onLoadSuccess", RawString.make(onLoadSuccess));
		putMap(map, "onLoadError", RawString.make(onLoadError));
		putMap(map, "onSelect", RawString.make(onSelect));
		putMap(map, "onUnselect", RawString.make(onUnselect));

		return map;
	}

	public String getValueField() {
		return valueField;
	}

	public void setValueField(String valueField) {
		this.valueField = valueField;
	}

	public String getTextField() {
		return textField;
	}

	public void setTextField(String textField) {
		this.textField = textField;
	}

	public String getGroupField() {
		return groupField;
	}

	public void setGroupField(String groupField) {
		this.groupField = groupField;
	}

	public String getGroupFormatter() {
		return groupFormatter;
	}

	public void setGroupFormatter(String groupFormatter) {
		this.groupFormatter = groupFormatter;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
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

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	public String getFormatter() {
		return formatter;
	}

	public void setFormatter(String formatter) {
		this.formatter = formatter;
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

	public String getOnSelect() {
		return onSelect;
	}

	public void setOnSelect(String onSelect) {
		this.onSelect = onSelect;
	}

	public String getOnUnselect() {
		return onUnselect;
	}

	public void setOnUnselect(String onUnselect) {
		this.onUnselect = onUnselect;
	}

}
