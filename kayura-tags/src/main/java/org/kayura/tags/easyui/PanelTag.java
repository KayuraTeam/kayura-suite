/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspWriter;

import org.kayura.tags.types.RawString;

/**
 * PanelTag
 *
 * @author liangxia@live.com
 */
public class PanelTag extends TagRender {

	private static final long serialVersionUID = -76763980342295508L;

	// 属性定义.

	private String title;
	private String iconCls;
	private String width;
	private String height;
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
	private String method;

	private Object queryParams;
	private String loader;

	// 事件定义.

	private String onBeforeLoad;
	private String onLoad;
	private String onLoadError;
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

	@Override
	public String getEasyUITag() {
		return "panel";
	}

	@Override
	public void doBeforeStart(JspWriter out) {

		String style = this.getStyle();

		style = style == null ? "" : style;
		if (getWidth() != null) {
			if (!style.contains("width:")) {
				style += "width:" + getWidth() + ";";
			}
		}

		if (getHeight() != null) {
			if (!style.contains("height:")) {
				style += "height:" + getHeight() + ";";
			}
		}

		if (getPadding() != null) {
			if (!style.contains("padding:")) {
				style += "padding:" + getPadding() + ";";
			}
		}

		this.setStyle(style);
	}

	@Override
	public void doRenderBody(JspWriter out) throws IOException {

		if (!isEmpty(getHeader())) {
			out.write("<header>" + getHeader() + "</header>");
		}
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

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

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
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

	public String getTools() {
		return tools;
	}

	public void setTools(String tools) {
		this.tools = tools;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
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

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public Object getQueryParams() {
		return queryParams;
	}

	public void setQueryParams(Object queryParams) {
		this.queryParams = queryParams;
	}

	public String getLoader() {
		return loader;
	}

	public void setLoader(String loader) {
		this.loader = loader;
	}

	public String getOnBeforeLoad() {
		return onBeforeLoad;
	}

	public void setOnBeforeLoad(String onBeforeLoad) {
		this.onBeforeLoad = onBeforeLoad;
	}

	public String getOnLoad() {
		return onLoad;
	}

	public void setOnLoad(String onLoad) {
		this.onLoad = onLoad;
	}

	public String getOnLoadError() {
		return onLoadError;
	}

	public void setOnLoadError(String onLoadError) {
		this.onLoadError = onLoadError;
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

}
