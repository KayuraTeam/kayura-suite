/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.Map;

import org.kayura.tags.types.RawString;

/**
 * PaginationTag
 *
 * @author liangxia@live.com
 */
public class PaginationTag extends TagRender {

	private static final long serialVersionUID = -5020852893511760948L;

	private Integer total;
	private Integer pageSize;
	private Integer pageNumber;
	private String pageList;
	private Boolean loading;
	private Object buttons;
	private String layout;
	private Integer links;
	private Boolean showPageList;
	private Boolean showRefresh;
	private String beforePageText;
	private String afterPageText;
	private String displayMsg;

	private String onSelectPage;
	private String onBeforeRefresh;
	private String onRefresh;
	private String onChangePageSize;

	@Override
	public String getEasyUITag() {
		return "pagination";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "total", total);
		putMap(map, "pageSize", pageSize);
		putMap(map, "pageNumber", pageNumber);
		putMap(map, "pageList", RawString.make(pageList));
		putMap(map, "loading", loading);

		if (buttons != null) {
			if (buttons instanceof String) {
				String t = (String) buttons;
				if (t.startsWith("#")) {
					putMap(map, "buttons", t);
				} else {
					putMap(map, "buttons", RawString.make(t));
				}
			} else {
				putMap(map, "buttons", buttons);
			}
		}

		putMap(map, "layout", RawString.make(layout));
		putMap(map, "links", links);
		putMap(map, "showPageList", showPageList);
		putMap(map, "showRefresh", showRefresh);
		putMap(map, "beforePageText", beforePageText);
		putMap(map, "afterPageText", afterPageText);
		putMap(map, "displayMsg", displayMsg);

		putMap(map, "onSelectPage", RawString.make(onSelectPage));
		putMap(map, "onBeforeRefresh", RawString.make(onBeforeRefresh));
		putMap(map, "onRefresh", RawString.make(onRefresh));
		putMap(map, "onChangePageSize", RawString.make(onChangePageSize));

		return map;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}

	public String getPageList() {
		return pageList;
	}

	public void setPageList(String pageList) {
		this.pageList = pageList;
	}

	public Boolean getLoading() {
		return loading;
	}

	public void setLoading(Boolean loading) {
		this.loading = loading;
	}

	public Object getButtons() {
		return buttons;
	}

	public void setButtons(Object buttons) {
		this.buttons = buttons;
	}

	public String getLayout() {
		return layout;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}

	public Integer getLinks() {
		return links;
	}

	public void setLinks(Integer links) {
		this.links = links;
	}

	public Boolean getShowPageList() {
		return showPageList;
	}

	public void setShowPageList(Boolean showPageList) {
		this.showPageList = showPageList;
	}

	public Boolean getShowRefresh() {
		return showRefresh;
	}

	public void setShowRefresh(Boolean showRefresh) {
		this.showRefresh = showRefresh;
	}

	public String getBeforePageText() {
		return beforePageText;
	}

	public void setBeforePageText(String beforePageText) {
		this.beforePageText = beforePageText;
	}

	public String getAfterPageText() {
		return afterPageText;
	}

	public void setAfterPageText(String afterPageText) {
		this.afterPageText = afterPageText;
	}

	public String getDisplayMsg() {
		return displayMsg;
	}

	public void setDisplayMsg(String displayMsg) {
		this.displayMsg = displayMsg;
	}

	public String getOnSelectPage() {
		return onSelectPage;
	}

	public void setOnSelectPage(String onSelectPage) {
		this.onSelectPage = onSelectPage;
	}

	public String getOnBeforeRefresh() {
		return onBeforeRefresh;
	}

	public void setOnBeforeRefresh(String onBeforeRefresh) {
		this.onBeforeRefresh = onBeforeRefresh;
	}

	public String getOnRefresh() {
		return onRefresh;
	}

	public void setOnRefresh(String onRefresh) {
		this.onRefresh = onRefresh;
	}

	public String getOnChangePageSize() {
		return onChangePageSize;
	}

	public void setOnChangePageSize(String onChangePageSize) {
		this.onChangePageSize = onChangePageSize;
	}

}
