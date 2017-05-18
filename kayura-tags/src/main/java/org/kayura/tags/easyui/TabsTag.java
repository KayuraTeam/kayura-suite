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
 * EasyUI.Tabs 选项卡.
 *
 * @author liangxia@live.com
 */
public class TabsTag extends TagRender {

	private static final long serialVersionUID = 4286663942597887006L;

	private Integer width;
	private Integer height;
	private Boolean plain;
	private Boolean fit;
	private Boolean border;
	private Integer scrollIncrement;
	private Integer scrollDuration;

	private Object tools;

	private String toolPosition;
	private String tabPosition;
	private Integer headerWidth;
	private Integer tabWidth;
	private Integer tabHeight;
	private Integer selected;

	private Boolean showHeader;
	private Boolean justified;
	private Boolean narrow;
	private Boolean pill;

	// 事件.

	private String onLoad;
	private String onSelect;
	private String onUnselect;
	private String onBeforeClose;
	private String onClose;
	private String onAdd;
	private String onUpdate;
	private String onContextMenu;

	@Override
	public String getEasyUITag() {
		return "tabs";
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

		this.setStyle(style);
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "plain", plain);
		putMap(map, "fit", fit);
		putMap(map, "border", border);
		putMap(map, "scrollIncrement", scrollIncrement);
		putMap(map, "scrollDuration", scrollDuration);

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

		putMap(map, "toolPosition", toolPosition);
		putMap(map, "tabPosition", tabPosition);
		putMap(map, "headerWidth", headerWidth);
		putMap(map, "tabWidth", tabWidth);
		putMap(map, "tabHeight", tabHeight);
		putMap(map, "selected", selected);
		putMap(map, "showHeader", showHeader);
		putMap(map, "justified", justified);
		putMap(map, "narrow", narrow);
		putMap(map, "pill", pill);
		
		putMap(map, "onLoad", RawString.make(onLoad));
		putMap(map, "onSelect", RawString.make(onSelect));
		putMap(map, "onUnselect", RawString.make(onUnselect));
		putMap(map, "onBeforeClose", RawString.make(onBeforeClose));
		putMap(map, "onClose", RawString.make(onClose));
		putMap(map, "onAdd", RawString.make(onAdd));
		putMap(map, "onUpdate", RawString.make(onUpdate));
		putMap(map, "onContextMenu", RawString.make(onContextMenu));

		return map;
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

	public Boolean getPlain() {
		return plain;
	}

	public void setPlain(Boolean plain) {
		this.plain = plain;
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

	public Integer getScrollIncrement() {
		return scrollIncrement;
	}

	public void setScrollIncrement(Integer scrollIncrement) {
		this.scrollIncrement = scrollIncrement;
	}

	public Integer getScrollDuration() {
		return scrollDuration;
	}

	public void setScrollDuration(Integer scrollDuration) {
		this.scrollDuration = scrollDuration;
	}

	public Object getTools() {
		return tools;
	}

	public void setTools(Object tools) {
		this.tools = tools;
	}

	public String getToolPosition() {
		return toolPosition;
	}

	public void setToolPosition(String toolPosition) {
		this.toolPosition = toolPosition;
	}

	public String getTabPosition() {
		return tabPosition;
	}

	public void setTabPosition(String tabPosition) {
		this.tabPosition = tabPosition;
	}

	public Integer getHeaderWidth() {
		return headerWidth;
	}

	public void setHeaderWidth(Integer headerWidth) {
		this.headerWidth = headerWidth;
	}

	public Integer getTabWidth() {
		return tabWidth;
	}

	public void setTabWidth(Integer tabWidth) {
		this.tabWidth = tabWidth;
	}

	public Integer getTabHeight() {
		return tabHeight;
	}

	public void setTabHeight(Integer tabHeight) {
		this.tabHeight = tabHeight;
	}

	public Integer getSelected() {
		return selected;
	}

	public void setSelected(Integer selected) {
		this.selected = selected;
	}

	public Boolean getShowHeader() {
		return showHeader;
	}

	public void setShowHeader(Boolean showHeader) {
		this.showHeader = showHeader;
	}

	public Boolean getJustified() {
		return justified;
	}

	public void setJustified(Boolean justified) {
		this.justified = justified;
	}

	public Boolean getNarrow() {
		return narrow;
	}

	public void setNarrow(Boolean narrow) {
		this.narrow = narrow;
	}

	public Boolean getPill() {
		return pill;
	}

	public void setPill(Boolean pill) {
		this.pill = pill;
	}

	public String getOnLoad() {
		return onLoad;
	}

	public void setOnLoad(String onLoad) {
		this.onLoad = onLoad;
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

	public String getOnAdd() {
		return onAdd;
	}

	public void setOnAdd(String onAdd) {
		this.onAdd = onAdd;
	}

	public String getOnUpdate() {
		return onUpdate;
	}

	public void setOnUpdate(String onUpdate) {
		this.onUpdate = onUpdate;
	}

	public String getOnContextMenu() {
		return onContextMenu;
	}

	public void setOnContextMenu(String onContextMenu) {
		this.onContextMenu = onContextMenu;
	}

}
