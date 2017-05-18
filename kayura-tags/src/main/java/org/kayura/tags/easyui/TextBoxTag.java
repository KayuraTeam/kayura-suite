/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

import org.kayura.tags.types.RawString;

/**
 * TextBoxTag
 *
 * @author liangxia@live.com
 */
public class TextBoxTag extends ValidateBoxTag {

	private static final long serialVersionUID = 8413951518591159899L;

	private String width;
	private String height;
	private String prompt;
	private String value;
	private Boolean multiline;
	private Boolean editable;
	private Boolean disabled;
	private Boolean readonly;
	private String iconCls;
	private String iconAlign;
	private Integer iconWidth;
	private String buttonText;
	private String buttonIcon;
	private String buttonAlign;

	private String icons;

	private String onChange;
	private String onResize;
	private String onClickButton;
	private String onClickIcon;

	@Override
	public String getEasyUITag() {
		return "textbox";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		putMap(map, "width", width);
		putMap(map, "height", height);
		putMap(map, "prompt", prompt);
		putMap(map, "value", value);
		putMap(map, "multiline", multiline);
		putMap(map, "editable", editable);
		putMap(map, "disabled", disabled);
		putMap(map, "readonly", readonly);
		putMap(map, "iconCls", iconCls);
		putMap(map, "iconAlign", iconAlign);
		putMap(map, "iconWidth", iconWidth);
		putMap(map, "buttonText", buttonText);
		putMap(map, "buttonIcon", buttonIcon);
		putMap(map, "buttonAlign", buttonAlign);

		if (icons != null) {
			if (icons instanceof String) {
				String t = (String) icons;
				putMap(map, "icons", RawString.make(t));
			} else {
				putMap(map, "icons", icons);
			}
		}

		putMap(map, "onChange", onChange);
		putMap(map, "onResize", onResize);
		putMap(map, "onClickButton", onClickButton);
		putMap(map, "onClickIcon", onClickIcon);

		return map;
	}

	public String getWidth() {
		return width;
	}

	public String getHeight() {
		return height;
	}

	public String getPrompt() {
		return prompt;
	}

	public String getValue() {
		return value;
	}

	public Boolean getMultiline() {
		return multiline;
	}

	public Boolean getEditable() {
		return editable;
	}

	public Boolean getDisabled() {
		return disabled;
	}

	public Boolean getReadonly() {
		return readonly;
	}

	public String getIcons() {
		return icons;
	}

	public String getIconCls() {
		return iconCls;
	}

	public String getIconAlign() {
		return iconAlign;
	}

	public Integer getIconWidth() {
		return iconWidth;
	}

	public String getButtonText() {
		return buttonText;
	}

	public String getButtonIcon() {
		return buttonIcon;
	}

	public String getButtonAlign() {
		return buttonAlign;
	}

	public String getOnChange() {
		return onChange;
	}

	public String getOnResize() {
		return onResize;
	}

	public String getOnClickButton() {
		return onClickButton;
	}

	public String getOnClickIcon() {
		return onClickIcon;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public void setPrompt(String prompt) {
		this.prompt = prompt;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public void setMultiline(Boolean multiline) {
		this.multiline = multiline;
	}

	public void setEditable(Boolean editable) {
		this.editable = editable;
	}

	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}

	public void setReadonly(Boolean readonly) {
		this.readonly = readonly;
	}

	public void setIcons(String icons) {
		this.icons = icons;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public void setIconAlign(String iconAlign) {
		this.iconAlign = iconAlign;
	}

	public void setIconWidth(Integer iconWidth) {
		this.iconWidth = iconWidth;
	}

	public void setButtonText(String buttonText) {
		this.buttonText = buttonText;
	}

	public void setButtonIcon(String buttonIcon) {
		this.buttonIcon = buttonIcon;
	}

	public void setButtonAlign(String buttonAlign) {
		this.buttonAlign = buttonAlign;
	}

	public void setOnChange(String onChange) {
		this.onChange = onChange;
	}

	public void setOnResize(String onResize) {
		this.onResize = onResize;
	}

	public void setOnClickButton(String onClickButton) {
		this.onClickButton = onClickButton;
	}

	public void setOnClickIcon(String onClickIcon) {
		this.onClickIcon = onClickIcon;
	}

}
