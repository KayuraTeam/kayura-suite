/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.HashMap;
import java.util.Map;

import org.kayura.tags.types.RawString;

/**
 * TooltipTag
 *
 * @author liangxia@live.com
 */
public class TooltipTag extends TagRender {

	private static final long serialVersionUID = -3060026154462958666L;

	private String position;
	private String content;
	private Boolean trackMouse;
	private Integer deltaX;
	private Integer deltaY;
	private String showEvent;
	private String hideEvent;
	private Integer showDelay;
	private Integer hideDelay;

	private String onShow;
	private String onHide;
	private String onUpdate;
	private String onPosition;
	private String onDestroy;

	@Override
	public String getEasyUITag() {
		return "tooltip";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "position", position);
		putMap(map, "content", content);
		putMap(map, "trackMouse", trackMouse);
		putMap(map, "deltaX", deltaX);
		putMap(map, "deltaY", deltaY);
		putMap(map, "showEvent", showEvent);
		putMap(map, "hideEvent", hideEvent);
		putMap(map, "showDelay", showDelay);
		putMap(map, "hideDelay", hideDelay);

		putMap(map, "onShow", RawString.make(onShow));
		putMap(map, "onHide", RawString.make(onHide));
		putMap(map, "onUpdate", RawString.make(onUpdate));
		putMap(map, "onPosition", RawString.make(onPosition));
		putMap(map, "onDestroy", RawString.make(onDestroy));

		return map;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getTrackMouse() {
		return trackMouse;
	}

	public void setTrackMouse(Boolean trackMouse) {
		this.trackMouse = trackMouse;
	}

	public Integer getDeltaX() {
		return deltaX;
	}

	public void setDeltaX(Integer deltaX) {
		this.deltaX = deltaX;
	}

	public Integer getDeltaY() {
		return deltaY;
	}

	public void setDeltaY(Integer deltaY) {
		this.deltaY = deltaY;
	}

	public String getShowEvent() {
		return showEvent;
	}

	public void setShowEvent(String showEvent) {
		this.showEvent = showEvent;
	}

	public String getHideEvent() {
		return hideEvent;
	}

	public void setHideEvent(String hideEvent) {
		this.hideEvent = hideEvent;
	}

	public Integer getShowDelay() {
		return showDelay;
	}

	public void setShowDelay(Integer showDelay) {
		this.showDelay = showDelay;
	}

	public Integer getHideDelay() {
		return hideDelay;
	}

	public void setHideDelay(Integer hideDelay) {
		this.hideDelay = hideDelay;
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

	public String getOnUpdate() {
		return onUpdate;
	}

	public void setOnUpdate(String onUpdate) {
		this.onUpdate = onUpdate;
	}

	public String getOnPosition() {
		return onPosition;
	}

	public void setOnPosition(String onPosition) {
		this.onPosition = onPosition;
	}

	public String getOnDestroy() {
		return onDestroy;
	}

	public void setOnDestroy(String onDestroy) {
		this.onDestroy = onDestroy;
	}
}
