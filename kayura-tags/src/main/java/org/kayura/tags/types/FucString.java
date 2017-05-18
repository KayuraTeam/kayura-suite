/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.types;

/**
 * FucString
 *
 * @author liangxia@live.com
 */
public class FucString {

	public static FucString make(String value) {

		if (value != null && value.trim().length() > 0) {
			return new FucString(value);
		} else {
			return null;
		}
	}

	private String content;

	@Override
	public String toString() {
		return getContent();
	}

	public FucString(String content) {
		this.content = content;
	}

	public String getContent() {

		if (TagUtils.isEmpty(this.content)) {
			return this.content;
		}

		String js = content.trim();

		// function(){ xxx }
		// (){ xxx }
		// xxxx

		StringBuilder sb = new StringBuilder();
		if (!js.startsWith("function")) {
			sb.append("function");
		} else {
			js = js.substring(7);
		}

		if (!js.trim().startsWith("(")) {
			sb.append("()");
		} else {

			int len = js.indexOf(")") + 1;
			sb.append(js.substring(0, len));
			js = js.substring(len).trim();
		}

		if (!js.startsWith("{")) {
			sb.append("{");
		}
		sb.append(js);
		if (!js.endsWith("}")) {
			sb.append("}");
		}

		return sb.toString();
	}

	public void setContent(String content) {
		this.content = content;
	}

}
