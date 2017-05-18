/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspWriter;

/**
 * TabPageTag
 *
 * @author liangxia@live.com
 */
public class TabPageTag extends TagRender {

	private static final long serialVersionUID = 7129084093901075781L;

	private String title;
	private String content;
	private String href;
	private Boolean cache;
	private String iconCls;
	private Integer width;
	private Integer height;
	private Boolean collapsible;

	private Boolean closable;
	private Boolean selected;

	private String padding;

	@Override
	public String getEasyUITag() {
		return null;
	}

	@Override
	public void doRenderProperty(JspWriter out) throws Exception {

	}

	@Override
	public void doRenderBody(JspWriter out) throws Exception {

	}

	@Override
	public void doBeforeStart(JspWriter out) {

		String style = this.getStyle();

		style = style == null ? "" : style;
		if (!isEmpty(getPadding())) {
			if (!style.contains("padding")) {
				style += "padding:" + getPadding() + ";";
			}
		}

		this.setStyle(style);
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "title", title);
		putMap(map, "content", content);
		putMap(map, "href", href);
		putMap(map, "cache", cache);
		putMap(map, "iconCls", iconCls);
		putMap(map, "width", width);
		putMap(map, "height", height);
		putMap(map, "collapsible", collapsible);

		putMap(map, "closable", closable);
		putMap(map, "selected", selected);

		return map;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public Boolean getCollapsible() {
		return collapsible;
	}

	public void setCollapsible(Boolean collapsible) {
		this.collapsible = collapsible;
	}

	public Boolean getClosable() {
		return closable;
	}

	public void setClosable(Boolean closable) {
		this.closable = closable;
	}

	public Boolean getSelected() {
		return selected;
	}

	public void setSelected(Boolean selected) {
		this.selected = selected;
	}

	public String getPadding() {
		return padding;
	}

	public void setPadding(String padding) {
		this.padding = padding;
	}

}
