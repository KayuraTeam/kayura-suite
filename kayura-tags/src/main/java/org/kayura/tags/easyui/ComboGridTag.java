/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

import org.kayura.tags.types.RawString;

/**
 * ComboGridTag
 *
 * @author liangxia@live.com
 */
public class ComboGridTag extends ComboTag {

	private static final long serialVersionUID = 3183269479587862190L;

	// ComboGrid

	private String loadMsg;
	private String idField;
	private String textField;
	private String mode;

	private String filter;

	// Panel

	private String title;
	private String iconCls;
	private String padding;
	private Integer left;
	private Integer top;
	private String cls;
	private String headerCls;
	private String bodyCls;

	private Boolean fit;
	private Boolean border;
	private Boolean doSize;
	private Boolean noheader;
	private String content;

	private Boolean collapsible;
	private Boolean minimizable;
	private Boolean maximizable;
	private Boolean closable;

	private String header;
	private String tools;
	private String footer;

	private String openAnimation;
	private Integer openDuration;
	private String closeAnimation;
	private Integer closeDuration;

	private Boolean collapsed;
	private Boolean minimized;
	private Boolean maximized;
	private Boolean closed;

	private String href;
	private Boolean cache;
	private String loadingMessage;
	private String extractor;

	private Object queryParams;

	// 事件定义.

	private String onLoad;
	private String onBeforeOpen;
	private String onOpen;
	private String onBeforeClose;
	private String onClose;
	private String onBeforeDestroy;
	private String onDestroy;
	private String onBeforeCollapse;
	private String onCollapse;
	private String onBeforeExpand;
	private String onExpand;
	private String onResize;
	private String onMove;
	private String onMaximize;
	private String onRestore;
	private String onMinimize;

	// DataGrid

	private Object columns;
	private Object frozenColumns;
	private Boolean fitColumns;
	private String resizeHandle;
	private Boolean autoRowHeight;
	private Object toolbar;
	private Boolean striped;
	private String method;
	private Boolean nowrap;
	private String url;
	private Object data;
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
	private String loader;
	private String loadFilter;

	private String editors;
	private String view;

	private String onLoadSuccess;
	private String onLoadError;
	private String onBeforeLoad;
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
		return "combogrid";
	}
	
	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		// ComboGrid

		putMap(map, "loadMsg", loadMsg);
		putMap(map, "idField", idField);
		putMap(map, "textField", textField);
		putMap(map, "mode", mode);

		putMap(map, "filter", RawString.make(filter));
		
		// Panel
		
		putMap(map, "title", title);
		putMap(map, "iconCls", iconCls);
		putMap(map, "left", left);
		putMap(map, "top", top);
		putMap(map, "cls", cls);
		putMap(map, "headerCls", headerCls);
		putMap(map, "bodyCls", bodyCls);
		putMap(map, "fit", fit);
		putMap(map, "border", border);
		putMap(map, "doSize", doSize);
		putMap(map, "noheader", noheader);
		putMap(map, "content", content);
		putMap(map, "collapsible", collapsible);
		putMap(map, "minimizable", minimizable);
		putMap(map, "maximizable", maximizable);
		putMap(map, "closable", closable);

		if (tools != null) {
			if (tools instanceof String) {
				String t = (String) tools;
				if (t.startsWith("#")) {
					putMap(map, "tools", t);
				} else {
					putMap(map, "tools", RawString.make(t));
				}
			} else {
				putMap(map, "tools", tools);
			}
		}

		if (footer != null) {
			if (footer instanceof String) {
				String t = (String) footer;
				if (t.startsWith("#")) {
					putMap(map, "footer", t);
				} else {
					putMap(map, "footer", RawString.make(t));
				}
			} else {
				putMap(map, "footer", footer);
			}
		}

		putMap(map, "openAnimation", openAnimation);
		putMap(map, "openDuration", openDuration);
		putMap(map, "closeAnimation", closeAnimation);
		putMap(map, "closeDuration", closeDuration);
		putMap(map, "collapsed", collapsed);
		putMap(map, "minimized", minimized);
		putMap(map, "maximized", maximized);

		putMap(map, "closed", closed);
		putMap(map, "href", href);
		putMap(map, "cache", cache);
		putMap(map, "loadingMessage", loadingMessage);
		putMap(map, "extractor", RawString.make(extractor));
		putMap(map, "method", method);

		if (queryParams instanceof String) {
			putMap(map, "queryParams", RawString.make((String) queryParams));
		} else {
			putMap(map, "queryParams", queryParams);
		}
		
		putMap(map, "loader", RawString.make(loader));

		putMap(map, "onBeforeLoad", RawString.make(onBeforeLoad));
		putMap(map, "onLoad", RawString.make(onLoad));
		putMap(map, "onLoadError", RawString.make(onLoadError));
		putMap(map, "onBeforeOpen", RawString.make(onBeforeOpen));
		putMap(map, "onOpen", RawString.make(onOpen));
		putMap(map, "onBeforeClose", RawString.make(onBeforeClose));
		putMap(map, "onClose", RawString.make(onClose));
		putMap(map, "onBeforeDestroy", RawString.make(onBeforeDestroy));
		putMap(map, "onDestroy", RawString.make(onDestroy));
		putMap(map, "onBeforeCollapse", RawString.make(onBeforeCollapse));
		putMap(map, "onCollapse", RawString.make(onCollapse));
		putMap(map, "onBeforeExpand", RawString.make(onBeforeExpand));
		putMap(map, "onExpand", RawString.make(onExpand));
		putMap(map, "onResize", RawString.make(onResize));
		putMap(map, "onMove", RawString.make(onMove));
		putMap(map, "onMaximize", RawString.make(onMaximize));
		putMap(map, "onRestore", RawString.make(onRestore));
		putMap(map, "onMinimize", RawString.make(onMinimize));

		// DataGrid

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
		putMap(map, "method", method);
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
		putMap(map, "loader", RawString.make(loader));
		putMap(map, "loadFilter", RawString.make(loadFilter));

		putMap(map, "editors", RawString.make(editors));
		putMap(map, "view", RawString.make(view));

		// 事件...

		putMap(map, "onLoadSuccess", RawString.make(onLoadSuccess));
		putMap(map, "onLoadError", RawString.make(onLoadError));
		putMap(map, "onBeforeLoad", RawString.make(onBeforeLoad));
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getPadding() {
		return padding;
	}

	public void setPadding(String padding) {
		this.padding = padding;
	}

	public Integer getLeft() {
		return left;
	}

	public void setLeft(Integer left) {
		this.left = left;
	}

	public Integer getTop() {
		return top;
	}

	public void setTop(Integer top) {
		this.top = top;
	}

	public String getCls() {
		return cls;
	}

	public void setCls(String cls) {
		this.cls = cls;
	}

	public String getHeaderCls() {
		return headerCls;
	}

	public void setHeaderCls(String headerCls) {
		this.headerCls = headerCls;
	}

	public String getBodyCls() {
		return bodyCls;
	}

	public void setBodyCls(String bodyCls) {
		this.bodyCls = bodyCls;
	}

	public Boolean getFit() {
		return fit;
	}

	public void setFit(Boolean fit) {
		this.fit = fit;
	}

	public Boolean getBorder() {
		return border;
	}

	public void setBorder(Boolean border) {
		this.border = border;
	}

	public Boolean getDoSize() {
		return doSize;
	}

	public void setDoSize(Boolean doSize) {
		this.doSize = doSize;
	}

	public Boolean getNoheader() {
		return noheader;
	}

	public void setNoheader(Boolean noheader) {
		this.noheader = noheader;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getCollapsible() {
		return collapsible;
	}

	public void setCollapsible(Boolean collapsible) {
		this.collapsible = collapsible;
	}

	public Boolean getMinimizable() {
		return minimizable;
	}

	public void setMinimizable(Boolean minimizable) {
		this.minimizable = minimizable;
	}

	public Boolean getMaximizable() {
		return maximizable;
	}

	public void setMaximizable(Boolean maximizable) {
		this.maximizable = maximizable;
	}

	public Boolean getClosable() {
		return closable;
	}

	public void setClosable(Boolean closable) {
		this.closable = closable;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getTools() {
		return tools;
	}

	public void setTools(String tools) {
		this.tools = tools;
	}

	public String getFooter() {
		return footer;
	}

	public void setFooter(String footer) {
		this.footer = footer;
	}

	public String getOpenAnimation() {
		return openAnimation;
	}

	public void setOpenAnimation(String openAnimation) {
		this.openAnimation = openAnimation;
	}

	public Integer getOpenDuration() {
		return openDuration;
	}

	public void setOpenDuration(Integer openDuration) {
		this.openDuration = openDuration;
	}

	public String getCloseAnimation() {
		return closeAnimation;
	}

	public void setCloseAnimation(String closeAnimation) {
		this.closeAnimation = closeAnimation;
	}

	public Integer getCloseDuration() {
		return closeDuration;
	}

	public void setCloseDuration(Integer closeDuration) {
		this.closeDuration = closeDuration;
	}

	public Boolean getCollapsed() {
		return collapsed;
	}

	public void setCollapsed(Boolean collapsed) {
		this.collapsed = collapsed;
	}

	public Boolean getMinimized() {
		return minimized;
	}

	public void setMinimized(Boolean minimized) {
		this.minimized = minimized;
	}

	public Boolean getMaximized() {
		return maximized;
	}

	public void setMaximized(Boolean maximized) {
		this.maximized = maximized;
	}

	public Boolean getClosed() {
		return closed;
	}

	public void setClosed(Boolean closed) {
		this.closed = closed;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public Boolean getCache() {
		return cache;
	}

	public void setCache(Boolean cache) {
		this.cache = cache;
	}

	public String getLoadingMessage() {
		return loadingMessage;
	}

	public void setLoadingMessage(String loadingMessage) {
		this.loadingMessage = loadingMessage;
	}

	public String getExtractor() {
		return extractor;
	}

	public void setExtractor(String extractor) {
		this.extractor = extractor;
	}

	public Object getQueryParams() {
		return queryParams;
	}

	public void setQueryParams(Object queryParams) {
		this.queryParams = queryParams;
	}

	public String getOnLoad() {
		return onLoad;
	}

	public void setOnLoad(String onLoad) {
		this.onLoad = onLoad;
	}

	public String getOnBeforeOpen() {
		return onBeforeOpen;
	}

	public void setOnBeforeOpen(String onBeforeOpen) {
		this.onBeforeOpen = onBeforeOpen;
	}

	public String getOnOpen() {
		return onOpen;
	}

	public void setOnOpen(String onOpen) {
		this.onOpen = onOpen;
	}

	public String getOnBeforeClose() {
		return onBeforeClose;
	}

	public void setOnBeforeClose(String onBeforeClose) {
		this.onBeforeClose = onBeforeClose;
	}

	public String getOnClose() {
		return onClose;
	}

	public void setOnClose(String onClose) {
		this.onClose = onClose;
	}

	public String getOnBeforeDestroy() {
		return onBeforeDestroy;
	}

	public void setOnBeforeDestroy(String onBeforeDestroy) {
		this.onBeforeDestroy = onBeforeDestroy;
	}

	public String getOnDestroy() {
		return onDestroy;
	}

	public void setOnDestroy(String onDestroy) {
		this.onDestroy = onDestroy;
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

	public String getOnResize() {
		return onResize;
	}

	public void setOnResize(String onResize) {
		this.onResize = onResize;
	}

	public String getOnMove() {
		return onMove;
	}

	public void setOnMove(String onMove) {
		this.onMove = onMove;
	}

	public String getOnMaximize() {
		return onMaximize;
	}

	public void setOnMaximize(String onMaximize) {
		this.onMaximize = onMaximize;
	}

	public String getOnRestore() {
		return onRestore;
	}

	public void setOnRestore(String onRestore) {
		this.onRestore = onRestore;
	}

	public String getOnMinimize() {
		return onMinimize;
	}

	public void setOnMinimize(String onMinimize) {
		this.onMinimize = onMinimize;
	}

	public String getLoadMsg() {
		return loadMsg;
	}

	public void setLoadMsg(String loadMsg) {
		this.loadMsg = loadMsg;
	}

	public String getIdField() {
		return idField;
	}

	public void setIdField(String idField) {
		this.idField = idField;
	}

	public String getTextField() {
		return textField;
	}

	public void setTextField(String textField) {
		this.textField = textField;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
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

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public Boolean getNowrap() {
		return nowrap;
	}

	public void setNowrap(Boolean nowrap) {
		this.nowrap = nowrap;
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

	public String getOnLoadError() {
		return onLoadError;
	}

	public void setOnLoadError(String onLoadError) {
		this.onLoadError = onLoadError;
	}

	public String getOnBeforeLoad() {
		return onBeforeLoad;
	}

	public void setOnBeforeLoad(String onBeforeLoad) {
		this.onBeforeLoad = onBeforeLoad;
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
