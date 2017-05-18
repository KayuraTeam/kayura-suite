/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspWriter;

import org.kayura.tags.types.FucString;
import org.kayura.tags.types.RawString;

/**
 * FormTag
 *
 * @author liangxia@live.com
 */
public class FormTag extends TagRender {

	private static final long serialVersionUID = 1370013979855555183L;

	private String method = "POST";
	private Boolean novalidate;
	private Boolean ajax;
	private Object queryParams;
	private String url;
	private Boolean multipart;
	
	private String success;

	private String onSubmit;
	private String onBeforeLoad;
	private String onLoadSuccess;
	private String onLoadError;
	private String onChange;

	@Override
	public String getEasyUITag() {
		return null;
	}

	@Override
	public String getHtmlTag() {
		return "form";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "novalidate", novalidate);
		putMap(map, "ajax", ajax);
		putMap(map, "url", url);

		if (queryParams instanceof String) {
			putMap(map, "queryParams", RawString.make((String) queryParams));
		} else {
			putMap(map, "queryParams", queryParams);
		}

		putMap(map, "success", FucString.make(success));
		
		putMap(map, "onSubmit", RawString.make(onSubmit));
		putMap(map, "onBeforeLoad", RawString.make(onBeforeLoad));
		putMap(map, "onLoadSuccess", RawString.make(onLoadSuccess));
		putMap(map, "onLoadError", RawString.make(onLoadError));
		putMap(map, "onChange", RawString.make(onChange));

		return map;
	}

	@Override
	public void doRenderProperty(JspWriter out) throws Exception {

		if (!isEmpty(getMethod())) {
			out.write(" method='" + getMethod() + "'");
		}

		if (multipart != null && multipart.booleanValue()) {
			out.write(" enctype=\"multipart/form-data\"");
		}
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public Boolean getNovalidate() {
		return novalidate;
	}

	public void setNovalidate(Boolean novalidate) {
		this.novalidate = novalidate;
	}

	public Boolean getAjax() {
		return ajax;
	}

	public void setAjax(Boolean ajax) {
		this.ajax = ajax;
	}

	public Object getQueryParams() {
		return queryParams;
	}

	public void setQueryParams(Object queryParams) {
		this.queryParams = queryParams;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Boolean getMultipart() {
		return multipart;
	}

	public void setMultipart(Boolean multipart) {
		this.multipart = multipart;
	}

	public String getOnSubmit() {
		return onSubmit;
	}

	public void setOnSubmit(String onSubmit) {
		this.onSubmit = onSubmit;
	}

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
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

	public String getOnChange() {
		return onChange;
	}

	public void setOnChange(String onChange) {
		this.onChange = onChange;
	}

}
