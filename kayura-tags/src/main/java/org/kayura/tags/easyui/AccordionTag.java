/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.Map;

import org.kayura.tags.types.RawString;

/**
 * AccordionTag
 *
 * @author liangxia@live.com
 */
public class AccordionTag extends TagRender {

	private static final long serialVersionUID = 3796873336589297553L;

	private Integer width;
	private Integer height;
	private Boolean fit;
	private Boolean border;
	private Boolean animate;
	private Boolean multiple;
	private Integer selected;

	private String onSelect;
	private String onUnselect;
	private String onAdd;
	private String onBeforeRemove;
	private String onRemove;

	@Override
	public String getEasyUITag() {
		return "accordion";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "width", width);
		putMap(map, "height", height);
		putMap(map, "fit", fit);
		putMap(map, "border", border);
		putMap(map, "animate", animate);
		putMap(map, "multiple", multiple);
		putMap(map, "selected", selected);

		putMap(map, "onSelect", RawString.make(onSelect));
		putMap(map, "onUnselect", RawString.make(onUnselect));
		putMap(map, "onAdd", RawString.make(onAdd));
		putMap(map, "onBeforeRemove", RawString.make(onBeforeRemove));
		putMap(map, "onRemove", RawString.make(onRemove));

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

	public Boolean getAnimate() {
		return animate;
	}

	public void setAnimate(Boolean animate) {
		this.animate = animate;
	}

	public Boolean getMultiple() {
		return multiple;
	}

	public void setMultiple(Boolean multiple) {
		this.multiple = multiple;
	}

	public Integer getSelected() {
		return selected;
	}

	public void setSelected(Integer selected) {
		this.selected = selected;
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

	public String getOnAdd() {
		return onAdd;
	}

	public void setOnAdd(String onAdd) {
		this.onAdd = onAdd;
	}

	public String getOnBeforeRemove() {
		return onBeforeRemove;
	}

	public void setOnBeforeRemove(String onBeforeRemove) {
		this.onBeforeRemove = onBeforeRemove;
	}

	public String getOnRemove() {
		return onRemove;
	}

	public void setOnRemove(String onRemove) {
		this.onRemove = onRemove;
	}

}
