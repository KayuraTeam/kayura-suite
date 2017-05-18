package org.kayura.web.util;

import javax.servlet.jsp.tagext.TagSupport;

/**
 * Created by JiangFeng on 2014/11/28.
 */
public class HtmlUtils extends TagSupport {

	private static final long serialVersionUID = 1L;

	/**
	 * Shared instance of pre-parsed HTML character entity references.
	 */
	private static final HtmlCharacterEntityReferences characterEntityReferences = new HtmlCharacterEntityReferences();

	public static String escape(String comment) {
		int i;
		char j;
		StringBuffer tmp = new StringBuffer();
		tmp.ensureCapacity(comment.length() * 6);
		for (i = 0; i < comment.length(); i++) {
			j = comment.charAt(i);
			if (Character.isDigit(j) || Character.isLowerCase(j) || Character.isUpperCase(j))
				tmp.append(j);
			else if (j < 256) {
				tmp.append("%");
				if (j < 16)
					tmp.append("0");
				tmp.append(Integer.toString(j, 16));
			} else {
				tmp.append("%u");
				tmp.append(Integer.toString(j, 16));
			}
		}
		return tmp.toString();
	}

	public static String htmlEscape(String input) {
		if (input == null) {
			return null;
		}
		StringBuilder escaped = new StringBuilder(input.length() * 2);
		for (int i = 0; i < input.length(); i++) {
			char character = input.charAt(i);
			String reference = characterEntityReferences.convertToReference(character);
			if (reference != null) {
				escaped.append(reference);
			} else {
				escaped.append(character);
			}
		}
		return escaped.toString();
	}
}
