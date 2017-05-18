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
 * ValidateBoxTag
 *
 * @author liangxia@live.com
 */
public class ValidateBoxTag extends TagRender {

	private static final long serialVersionUID = -8287013341372604159L;

	private String name;
	private String type;
	private Boolean required;
	private String validType;
	private Integer delay;
	private String missingMessage;
	private String invalidMessage;
	private String tipPosition;
	private Integer deltaX;
	private Boolean novalidate;

	private String onBeforeValidate;
	private String onValidate;

	@Override
	public String getEasyUITag() {
		return "validatebox";
	}

	@Override
	public String getHtmlTag() {
		return "input";
	}

	@Override
	public Boolean emptyBody() {
		return true;
	}

	@Override
	public void doRenderProperty(JspWriter out) throws Exception {

		if (!isEmpty(getType())) {
			out.write(" type=\"" + getType() + "\"");
		}

		if (!isEmpty(getName())) {
			out.write(" name=\"" + getName() + "\"");
		} else {
			if (!isEmpty(getId())) {
				out.write(" name=\"" + getId() + "\"");
			}
		}
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = new HashMap<String, Object>();

		putMap(map, "required", required);
		putMap(map, "validType", validType);
		putMap(map, "delay", delay);
		putMap(map, "missingMessage", missingMessage);
		putMap(map, "invalidMessage", invalidMessage);
		putMap(map, "tipPosition", tipPosition);
		putMap(map, "deltaX", deltaX);
		putMap(map, "novalidate", novalidate);

		putMap(map, "onBeforeValidate", RawString.make(onBeforeValidate));
		putMap(map, "onValidate", RawString.make(onValidate));

		return map;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Boolean getRequired() {
		return required;
	}

	public void setRequired(Boolean required) {
		this.required = required;
	}

	public String getValidType() {
		return validType;
	}

	public void setValidType(String validType) {
		this.validType = validType;
	}

	public Integer getDelay() {
		return delay;
	}

	public void setDelay(Integer delay) {
		this.delay = delay;
	}

	public String getMissingMessage() {
		return missingMessage;
	}

	public void setMissingMessage(String missingMessage) {
		this.missingMessage = missingMessage;
	}

	public String getInvalidMessage() {
		return invalidMessage;
	}

	public void setInvalidMessage(String invalidMessage) {
		this.invalidMessage = invalidMessage;
	}

	public String getTipPosition() {
		return tipPosition;
	}

	public void setTipPosition(String tipPosition) {
		this.tipPosition = tipPosition;
	}

	public Integer getDeltaX() {
		return deltaX;
	}

	public void setDeltaX(Integer deltaX) {
		this.deltaX = deltaX;
	}

	public Boolean getNovalidate() {
		return novalidate;
	}

	public void setNovalidate(Boolean novalidate) {
		this.novalidate = novalidate;
	}

	public String getOnBeforeValidate() {
		return onBeforeValidate;
	}

	public void setOnBeforeValidate(String onBeforeValidate) {
		this.onBeforeValidate = onBeforeValidate;
	}

	public String getOnValidate() {
		return onValidate;
	}

	public void setOnValidate(String onValidate) {
		this.onValidate = onValidate;
	}

}
