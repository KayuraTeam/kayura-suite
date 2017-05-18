/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.io.IOException;
import java.util.Map;

import javax.servlet.jsp.JspWriter;

import org.kayura.tags.types.RawString;

/**
 * DataGridTag
 *
 * @author liangxia@live.com
 */
public class DataGridTag extends PanelTag {

	private static final long serialVersionUID = -5756005211714745895L;

	private Boolean customHeader;

	private Object columns;
	private Object frozenColumns;
	private Boolean fitColumns;
	private String resizeHandle;
	private Boolean autoRowHeight;
	private Object toolbar;
	private Boolean striped;
	// private String method;
	private Boolean nowrap;
	private String idField;
	private String url;
	private Object data;
	private String loadMsg;
	private Boolean pagination;
	private Boolean rownumbers;
	private Boolean singleSelect;
	private Boolean ctrlSelect;
	private Boolean checkOnSelect;
	private Boolean selectOnCheck;
	private String pagePosition;
	private Integer pageNumber;
	private Integer pageSize;
	private String pageList;
	private String sortName;
	private String sortOrder;
	private Boolean multiSort;
	private Boolean remoteSort;
	private Boolean showHeader;
	private Boolean showFooter;
	private Integer scrollbarSize;

	private String rowStyler;
	// private String loader;
	private String loadFilter;

	private String editors;
	private String view;

	private String onLoadSuccess;
	// private String onLoadError;
	// private String onBeforeLoad;
	private String onClickRow;
	private String onDblClickRow;
	private String onClickCell;
	private String onDblClickCell;
	private String onBeforeSortColumn;
	private String onSortColumn;
	private String onResizeColumn;
	private String onBeforeSelect;
	private String onSelect;
	private String onBeforeUnselect;
	private String onUnselect;
	private String onSelectAll;
	private String onUnselectAll;
	private String onBeforeCheck;
	private String onCheck;
	private String onBeforeUncheck;
	private String onUncheck;
	private String onCheckAll;
	private String onUncheckAll;
	private String onBeforeEdit;
	private String onBeginEdit;
	private String onEndEdit;
	private String onAfterEdit;
	private String onCancelEdit;
	private String onHeaderContextMenu;
	private String onRowContextMenu;

	@Override
	public String getEasyUITag() {
		return "datagrid";
	}

	@Override
	public String getHtmlTag() {
		return "table";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		if (columns instanceof String) {
			putMap(map, "columns", RawString.make((String) columns));
		} else {
			putMap(map, "columns", columns);
		}

		if (frozenColumns instanceof String) {
			putMap(map, "frozenColumns", RawString.make((String) frozenColumns));
		} else {
			putMap(map, "frozenColumns", frozenColumns);
		}

		putMap(map, "fitColumns", fitColumns);
		putMap(map, "resizeHandle", resizeHandle);
		putMap(map, "autoRowHeight", autoRowHeight);

		if (toolbar != null) {
			if (toolbar instanceof String) {
				String t = (String) toolbar;
				if (t.startsWith("#")) {
					putMap(map, "toolbar", t);
				} else {
					putMap(map, "toolbar", RawString.make(t));
				}
			} else {
				putMap(map, "toolbar", toolbar);
			}
		}

		putMap(map, "striped", striped);
		//putMap(map, "method", method);
		putMap(map, "nowrap", nowrap);
		putMap(map, "idField", idField);
		putMap(map, "url", url);

		if (data != null) {
			if (data instanceof String) {
				String t = (String) data;
				putMap(map, "data", RawString.make(t));
			} else {
				putMap(map, "data", data);
			}
		}

		putMap(map, "loadMsg", loadMsg);
		putMap(map, "pagination", pagination);
		putMap(map, "rownumbers", rownumbers);
		putMap(map, "singleSelect", singleSelect);
		putMap(map, "ctrlSelect", ctrlSelect);
		putMap(map, "checkOnSelect", checkOnSelect);
		putMap(map, "selectOnCheck", selectOnCheck);
		putMap(map, "pagePosition", pagePosition);
		putMap(map, "pageNumber", pageNumber);
		putMap(map, "pageSize", pageSize);
		putMap(map, "pageList", RawString.make(pageList));

		putMap(map, "sortName", sortName);
		putMap(map, "sortOrder", sortOrder);
		putMap(map, "multiSort", multiSort);
		putMap(map, "remoteSort", remoteSort);
		putMap(map, "showHeader", showHeader);
		putMap(map, "showFooter", showFooter);
		putMap(map, "scrollbarSize", scrollbarSize);

		putMap(map, "rowStyler", RawString.make(rowStyler));
		// putMap(map, "loader", RawString.make(loader));
		putMap(map, "loadFilter", RawString.make(loadFilter));

		putMap(map, "editors", RawString.make(editors));
		putMap(map, "view", RawString.make(view));

		// 事件...

		putMap(map, "onLoadSuccess", RawString.make(onLoadSuccess));
		// putMap(map, "onLoadError", RawString.make(onLoadError));
		// putMap(map, "onBeforeLoad", RawString.make(onBeforeLoad));
		putMap(map, "onClickRow", RawString.make(onClickRow));
		putMap(map, "onDblClickRow", RawString.make(onDblClickRow));
		putMap(map, "onClickCell", RawString.make(onClickCell));
		putMap(map, "onDblClickCell", RawString.make(onDblClickCell));
		putMap(map, "onBeforeSortColumn", RawString.make(onBeforeSortColumn));
		putMap(map, "onSortColumn", RawString.make(onSortColumn));
		putMap(map, "onResizeColumn", RawString.make(onResizeColumn));
		putMap(map, "onBeforeSelect", RawString.make(onBeforeSelect));
		putMap(map, "onSelect", RawString.make(onSelect));
		putMap(map, "onBeforeUnselect", RawString.make(onBeforeUnselect));
		putMap(map, "onUnselect", RawString.make(onUnselect));
		putMap(map, "onSelectAll", RawString.make(onSelectAll));
		putMap(map, "onUnselectAll", RawString.make(onUnselectAll));
		putMap(map, "onBeforeCheck", RawString.make(onBeforeCheck));
		putMap(map, "onCheck", RawString.make(onCheck));
		putMap(map, "onBeforeUncheck", RawString.make(onBeforeUncheck));
		putMap(map, "onUncheck", RawString.make(onUncheck));
		putMap(map, "onCheckAll", RawString.make(onCheckAll));
		putMap(map, "onUncheckAll", RawString.make(onUncheckAll));
		putMap(map, "onBeforeEdit", RawString.make(onBeforeEdit));
		putMap(map, "onBeginEdit", RawString.make(onBeginEdit));
		putMap(map, "onEndEdit", RawString.make(onEndEdit));
		putMap(map, "onAfterEdit", RawString.make(onAfterEdit));
		putMap(map, "onCancelEdit", RawString.make(onCancelEdit));
		putMap(map, "onHeaderContextMenu", RawString.make(onHeaderContextMenu));
		putMap(map, "onRowContextMenu", RawString.make(onRowContextMenu));

		return map;
	}

	@Override
	public void doRenderBody(JspWriter out) throws IOException {

		out.write("<thead>");

		if (customHeader == null || customHeader == false) {
			out.write("<tr>");
		}
	}

	@Override
	public void doBeforeEnd(JspWriter out) throws Exception {

		if (customHeader == null || customHeader == false) {
			out.write("</tr>");
		}

		out.write("</thead>");
	}

	public Boolean getCustomHeader() {
		return customHeader;
	}

	public void setCustomHeader(Boolean customHeader) {
		this.customHeader = customHeader;
	}

	public Object getColumns() {
		return columns;
	}

	public void setColumns(Object columns) {
		this.columns = columns;
	}

	public Object getFrozenColumns() {
		return frozenColumns;
	}

	public void setFrozenColumns(Object frozenColumns) {
		this.frozenColumns = frozenColumns;
	}

	public Boolean getFitColumns() {
		return fitColumns;
	}

	public void setFitColumns(Boolean fitColumns) {
		this.fitColumns = fitColumns;
	}

	public String getResizeHandle() {
		return resizeHandle;
	}

	public void setResizeHandle(String resizeHandle) {
		this.resizeHandle = resizeHandle;
	}

	public Boolean getAutoRowHeight() {
		return autoRowHeight;
	}

	public void setAutoRowHeight(Boolean autoRowHeight) {
		this.autoRowHeight = autoRowHeight;
	}

	public Object getToolbar() {
		return toolbar;
	}

	public void setToolbar(Object toolbar) {
		this.toolbar = toolbar;
	}

	public Boolean getStriped() {
		return striped;
	}

	public void setStriped(Boolean striped) {
		this.striped = striped;
	}

	public Boolean getNowrap() {
		return nowrap;
	}

	public void setNowrap(Boolean nowrap) {
		this.nowrap = nowrap;
	}

	public String getIdField() {
		return idField;
	}

	public void setIdField(String idField) {
		this.idField = idField;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getLoadMsg() {
		return loadMsg;
	}

	public void setLoadMsg(String loadMsg) {
		this.loadMsg = loadMsg;
	}

	public Boolean getPagination() {
		return pagination;
	}

	public void setPagination(Boolean pagination) {
		this.pagination = pagination;
	}

	public Boolean getRownumbers() {
		return rownumbers;
	}

	public void setRownumbers(Boolean rownumbers) {
		this.rownumbers = rownumbers;
	}

	public Boolean getSingleSelect() {
		return singleSelect;
	}

	public void setSingleSelect(Boolean singleSelect) {
		this.singleSelect = singleSelect;
	}

	public Boolean getCtrlSelect() {
		return ctrlSelect;
	}

	public void setCtrlSelect(Boolean ctrlSelect) {
		this.ctrlSelect = ctrlSelect;
	}

	public Boolean getCheckOnSelect() {
		return checkOnSelect;
	}

	public void setCheckOnSelect(Boolean checkOnSelect) {
		this.checkOnSelect = checkOnSelect;
	}

	public Boolean getSelectOnCheck() {
		return selectOnCheck;
	}

	public void setSelectOnCheck(Boolean selectOnCheck) {
		this.selectOnCheck = selectOnCheck;
	}

	public String getPagePosition() {
		return pagePosition;
	}

	public void setPagePosition(String pagePosition) {
		this.pagePosition = pagePosition;
	}

	public Integer getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String getPageList() {
		return pageList;
	}

	public void setPageList(String pageList) {
		this.pageList = pageList;
	}

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public String getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}

	public Boolean getMultiSort() {
		return multiSort;
	}

	public void setMultiSort(Boolean multiSort) {
		this.multiSort = multiSort;
	}

	public Boolean getRemoteSort() {
		return remoteSort;
	}

	public void setRemoteSort(Boolean remoteSort) {
		this.remoteSort = remoteSort;
	}

	public Boolean getShowHeader() {
		return showHeader;
	}

	public void setShowHeader(Boolean showHeader) {
		this.showHeader = showHeader;
	}

	public Boolean getShowFooter() {
		return showFooter;
	}

	public void setShowFooter(Boolean showFooter) {
		this.showFooter = showFooter;
	}

	public Integer getScrollbarSize() {
		return scrollbarSize;
	}

	public void setScrollbarSize(Integer scrollbarSize) {
		this.scrollbarSize = scrollbarSize;
	}

	public String getRowStyler() {
		return rowStyler;
	}

	public void setRowStyler(String rowStyler) {
		this.rowStyler = rowStyler;
	}

	public String getLoadFilter() {
		return loadFilter;
	}

	public void setLoadFilter(String loadFilter) {
		this.loadFilter = loadFilter;
	}

	public String getEditors() {
		return editors;
	}

	public void setEditors(String editors) {
		this.editors = editors;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public String getOnLoadSuccess() {
		return onLoadSuccess;
	}

	public void setOnLoadSuccess(String onLoadSuccess) {
		this.onLoadSuccess = onLoadSuccess;
	}

	public String getOnClickRow() {
		return onClickRow;
	}

	public void setOnClickRow(String onClickRow) {
		this.onClickRow = onClickRow;
	}

	public String getOnDblClickRow() {
		return onDblClickRow;
	}

	public void setOnDblClickRow(String onDblClickRow) {
		this.onDblClickRow = onDblClickRow;
	}

	public String getOnClickCell() {
		return onClickCell;
	}

	public void setOnClickCell(String onClickCell) {
		this.onClickCell = onClickCell;
	}

	public String getOnDblClickCell() {
		return onDblClickCell;
	}

	public void setOnDblClickCell(String onDblClickCell) {
		this.onDblClickCell = onDblClickCell;
	}

	public String getOnBeforeSortColumn() {
		return onBeforeSortColumn;
	}

	public void setOnBeforeSortColumn(String onBeforeSortColumn) {
		this.onBeforeSortColumn = onBeforeSortColumn;
	}

	public String getOnSortColumn() {
		return onSortColumn;
	}

	public void setOnSortColumn(String onSortColumn) {
		this.onSortColumn = onSortColumn;
	}

	public String getOnResizeColumn() {
		return onResizeColumn;
	}

	public void setOnResizeColumn(String onResizeColumn) {
		this.onResizeColumn = onResizeColumn;
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

	public String getOnBeforeUnselect() {
		return onBeforeUnselect;
	}

	public void setOnBeforeUnselect(String onBeforeUnselect) {
		this.onBeforeUnselect = onBeforeUnselect;
	}

	public String getOnUnselect() {
		return onUnselect;
	}

	public void setOnUnselect(String onUnselect) {
		this.onUnselect = onUnselect;
	}

	public String getOnSelectAll() {
		return onSelectAll;
	}

	public void setOnSelectAll(String onSelectAll) {
		this.onSelectAll = onSelectAll;
	}

	public String getOnUnselectAll() {
		return onUnselectAll;
	}

	public void setOnUnselectAll(String onUnselectAll) {
		this.onUnselectAll = onUnselectAll;
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

	public String getOnBeforeUncheck() {
		return onBeforeUncheck;
	}

	public void setOnBeforeUncheck(String onBeforeUncheck) {
		this.onBeforeUncheck = onBeforeUncheck;
	}

	public String getOnUncheck() {
		return onUncheck;
	}

	public void setOnUncheck(String onUncheck) {
		this.onUncheck = onUncheck;
	}

	public String getOnCheckAll() {
		return onCheckAll;
	}

	public void setOnCheckAll(String onCheckAll) {
		this.onCheckAll = onCheckAll;
	}

	public String getOnUncheckAll() {
		return onUncheckAll;
	}

	public void setOnUncheckAll(String onUncheckAll) {
		this.onUncheckAll = onUncheckAll;
	}

	public String getOnBeforeEdit() {
		return onBeforeEdit;
	}

	public void setOnBeforeEdit(String onBeforeEdit) {
		this.onBeforeEdit = onBeforeEdit;
	}

	public String getOnBeginEdit() {
		return onBeginEdit;
	}

	public void setOnBeginEdit(String onBeginEdit) {
		this.onBeginEdit = onBeginEdit;
	}

	public String getOnEndEdit() {
		return onEndEdit;
	}

	public void setOnEndEdit(String onEndEdit) {
		this.onEndEdit = onEndEdit;
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

	public String getOnHeaderContextMenu() {
		return onHeaderContextMenu;
	}

	public void setOnHeaderContextMenu(String onHeaderContextMenu) {
		this.onHeaderContextMenu = onHeaderContextMenu;
	}

	public String getOnRowContextMenu() {
		return onRowContextMenu;
	}

	public void setOnRowContextMenu(String onRowContextMenu) {
		this.onRowContextMenu = onRowContextMenu;
	}

}
