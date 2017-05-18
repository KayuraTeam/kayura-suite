/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

/**
 * WindowTag
 *
 * @author liangxia@live.com
 */
public class WindowTag extends PanelTag {

	private static final long serialVersionUID = 5026645285707881171L;

	private Integer zIndex;
	private Boolean draggable;
	private Boolean resizable;
	private Boolean shadow;
	private Boolean inline;
	private Boolean modal;

	@Override
	public String getEasyUITag() {
		return "window";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		putMap(map, "zIndex", zIndex);
		putMap(map, "draggable", draggable);
		putMap(map, "resizable", resizable);
		putMap(map, "shadow", shadow);
		putMap(map, "inline", inline);
		putMap(map, "modal", modal);

		return map;
	}

	public Integer getzIndex() {
		return zIndex;
	}

	public void setzIndex(Integer zIndex) {
		this.zIndex = zIndex;
	}

	public Boolean getDraggable() {
		return draggable;
	}

	public void setDraggable(Boolean draggable) {
		this.draggable = draggable;
	}

	public Boolean getResizable() {
		return resizable;
	}

	public void setResizable(Boolean resizable) {
		this.resizable = resizable;
	}

	public Boolean getShadow() {
		return shadow;
	}

	public void setShadow(Boolean shadow) {
		this.shadow = shadow;
	}

	public Boolean getInline() {
		return inline;
	}

	public void setInline(Boolean inline) {
		this.inline = inline;
	}

	public Boolean getModal() {
		return modal;
	}

	public void setModal(Boolean modal) {
		this.modal = modal;
	}

}
