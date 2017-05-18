/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.Tag;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kayura.tags.easyui.types.Toolbar;
import org.kayura.tags.types.FucString;
import org.kayura.tags.types.RawString;
import org.kayura.tags.types.TagUtils;

/**
 * EasyUI 标签库基础渲染器。
 *
 * @author liangxia@live.com
 */
public abstract class TagRender extends BodyTagSupport {

	private static final long serialVersionUID = -2565725992851402935L;

	public static final String ANIMATION_SLIDE = "slide";
	public static final String ANIMATION_FADE = "fade";
	public static final String ANIMATION_SHOW = "show";

	protected final Log logger = LogFactory.getLog(this.getClass());

	private Boolean disabledTag = false;
	private String classStyle;
	private String style;

	/**
	 * 获取 EasyUI 定义的标签样式名.
	 */
	public abstract String getEasyUITag();

	/**
	 * 获取 EasyUI 标签使用的 HTML 标签名,默认使用 div 标签.
	 */
	public String getHtmlTag() {
		return "div";
	}

	/**
	 * 表示为一个无Body的标签, 返回 true &lt;input /&gt; 否则如 &lt;div&gt;&lt;/div&gt;
	 * 
	 * @return
	 */
	public Boolean emptyBody() {
		return false;
	}

	/**
	 * 当生成标签时的用于添加属性，如：&lt;div {动作} &gt;&lt;/div&gt;
	 * 
	 * @param writer
	 */
	public void doRenderProperty(JspWriter out) throws Exception {

	}

	/**
	 * 当生成标签内容时的动作，如：&lt;div&gt;{动作}&lt;/div&gt;
	 * 
	 * @param writer
	 */
	public void doRenderBody(JspWriter out) throws Exception {

	}

	public abstract Map<String, Object> makeOptions();

	public void putMap(Map<String, Object> map, String key, Object value) {
		if (value != null) {
			map.put(key, value);
		}
	}

	public String json(Object value) {

		return TagUtils.json(value);
	}

	public String json(List<Toolbar> toolbars) {

		if (toolbars == null || toolbars.isEmpty()) {
			return "";
		}

		StringBuilder sb = new StringBuilder();
		Boolean hasNext = false;

		sb.append("[");
		for (Toolbar t : toolbars) {

			if (hasNext) {
				sb.append(",");
			}

			sb.append("{");

			if (!isEmpty(t.getText())) {
				sb.append("text:\"" + t.getText() + "\",");
			}

			if (!isEmpty(t.getIconCls())) {
				sb.append("iconCls:\"" + t.getIconCls() + "\",");
			}

			sb.append("handler:function(){ " + t.getHandler() + " }");
			sb.append("}");

			hasNext = true;
		}
		sb.append("]");

		return sb.toString();
	}

	/**
	 * 将 EasyUI 选项参数集转换为字符表示形式.
	 * 
	 * @return
	 */
	public String optionsToString() {

		StringBuilder sb = new StringBuilder("");
		Map<String, Object> map = makeOptions();
		if (map != null) {
			for (Entry<String, Object> o : map.entrySet()) {

				Object v = o.getValue();
				if (v != null) {

					String k = o.getKey();
					if (v instanceof RawString) {
						String rs = ((RawString) v).getValue();
						if (!isEmpty(rs)) {
							sb.append("," + k + ":" + rs);
						}
					} else if (v instanceof FucString) {
						String fs = ((FucString) v).getContent();
						if (!isEmpty(fs)) {
							sb.append("," + k + ":" + fs);
						}
					} else if (v instanceof Integer || v instanceof Boolean || v instanceof Double) {
						sb.append("," + k + ":" + v);
					} else if (v instanceof String || v instanceof Enum) {
						sb.append("," + k + ":\"" + v + "\"");
					} else if (v instanceof Object) {
						sb.append("," + k + ":").append(json(v));
					}
				}
			}
		}

		if (sb.length() > 0) {
			sb.delete(0, 1);
		}

		return sb.toString();
	}

	protected Boolean isEmpty(String value) {

		return value == null || "".equals(value.trim());
	}

	public void doBeforeStart(JspWriter out) throws Exception {

	}

	public void doBeforeEnd(JspWriter out) throws Exception {

	}

	public void doAfterEnd(JspWriter out) throws Exception {

	}

	@Override
	public int doStartTag() {

		JspWriter out = this.pageContext.getOut();
		try {
			doBeforeStart(out);
			out.write("<" + this.getHtmlTag());
			if (!isEmpty(getId())) {
				out.write(" id=\"" + getId() + "\"");
			}
			if (!isEmpty(getEasyUITag())) {

				if (disabledTag) {
					if (!isEmpty(getClassStyle())) {
						out.write(" class=\"" + getClassStyle().trim() + "\"");
					}
				} else {
					if (!isEmpty(getClassStyle())) {
						out.write(" class=\"easyui-" + getEasyUITag() + " " + getClassStyle().trim() + "\"");
					} else {
						out.write(" class=\"easyui-" + getEasyUITag() + "\"");
					}
				}
			} else {
				if (!isEmpty(getClassStyle())) {
					out.write(" class=\"" + getClassStyle().trim() + "\"");
				}
			}
			if (!isEmpty(getStyle())) {
				out.write(" style=\"" + getStyle() + "\"");
			}
			String options = optionsToString();
			if (!isEmpty(options)) {
				options = options.replace('\'', '"');
				out.write(" data-options='" + options + "'");
			}
			doRenderProperty(out);
			if (emptyBody()) {
				out.write("/>");
			} else {
				out.write(">");
				doRenderBody(out);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}

		return EVAL_BODY_INCLUDE;
	}

	@Override
	public int doEndTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		try {
			if (!emptyBody()) {
				doBeforeEnd(out);
				out.write("</" + getHtmlTag() + ">");
			}
			doAfterEnd(out);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Tag.EVAL_PAGE;
	}

	public String getClassStyle() {
		return this.classStyle;
	}

	public void setClassStyle(String classStyle) {
		this.classStyle = classStyle;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public Boolean getDisabledTag() {
		return disabledTag;
	}

	public void setDisabledTag(Boolean disabledTag) {
		this.disabledTag = disabledTag;
	}

}
