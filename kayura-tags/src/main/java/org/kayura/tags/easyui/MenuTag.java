/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspWriter;

import org.kayura.tags.easyui.types.MenuItem;
import org.kayura.tags.easyui.utils.MenuUtils;
import org.kayura.tags.types.RawString;

/**
 * MenuTag
 *
 * @author liangxia@live.com
 */
public class MenuTag extends TagRender {

	private static final long serialVersionUID = -8944090500464264703L;

	private Integer zIndex;
	private Integer left;
	private Integer top;
	private String align;
	private Integer minWidth;
	private Integer itemHeight;
	private Integer duration;
	private Boolean hideOnUnhover;
	private Boolean inline;
	private Boolean fit;
	private Boolean noline;

	private String onShow;
	private String onHide;
	private String onClick;

	private List<MenuItem> menus;

	@Override
	public String getEasyUITag() {
		return "menu";
	}

	@Override
	public void doRenderProperty(JspWriter out) throws Exception {

	}

	@Override
	public void doRenderBody(JspWriter out) throws Exception {

		if (menus != null && !menus.isEmpty()) {

			String menuHtml = MenuUtils.html(menus);
			out.write(menuHtml);
		}
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "zIndex", zIndex);
		putMap(map, "left", left);
		putMap(map, "top", top);
		putMap(map, "align", align);
		putMap(map, "minWidth", minWidth);
		putMap(map, "itemHeight", itemHeight);
		putMap(map, "duration", duration);
		putMap(map, "hideOnUnhover", hideOnUnhover);
		putMap(map, "inline", inline);
		putMap(map, "fit", fit);
		putMap(map, "noline", noline);

		putMap(map, "onShow", RawString.make(onShow));
		putMap(map, "onHide", RawString.make(onHide));
		putMap(map, "onClick", RawString.make(onClick));

		return map;
	}

	public Integer getzIndex() {
		return zIndex;
	}

	public void setzIndex(Integer zIndex) {
		this.zIndex = zIndex;
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

	public String getAlign() {
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	public Integer getMinWidth() {
		return minWidth;
	}

	public void setMinWidth(Integer minWidth) {
		this.minWidth = minWidth;
	}

	public Integer getItemHeight() {
		return itemHeight;
	}

	public void setItemHeight(Integer itemHeight) {
		this.itemHeight = itemHeight;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public Boolean getHideOnUnhover() {
		return hideOnUnhover;
	}

	public void setHideOnUnhover(Boolean hideOnUnhover) {
		this.hideOnUnhover = hideOnUnhover;
	}

	public Boolean getInline() {
		return inline;
	}

	public void setInline(Boolean inline) {
		this.inline = inline;
	}

	public Boolean getFit() {
		return fit;
	}

	public void setFit(Boolean fit) {
		this.fit = fit;
	}

	public Boolean getNoline() {
		return noline;
	}

	public void setNoline(Boolean noline) {
		this.noline = noline;
	}

	public String getOnShow() {
		return onShow;
	}

	public void setOnShow(String onShow) {
		this.onShow = onShow;
	}

	public String getOnHide() {
		return onHide;
	}

	public void setOnHide(String onHide) {
		this.onHide = onHide;
	}

	public String getOnClick() {
		return onClick;
	}

	public void setOnClick(String onClick) {
		this.onClick = onClick;
	}

	public List<MenuItem> getMenus() {
		return menus;
	}

	public void setMenus(List<MenuItem> menus) {
		this.menus = menus;
	}

}
