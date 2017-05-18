/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui;

import java.util.Map;

/**
 * DateTimeSpinnerTag
 *
 * @author liangxia@live.com
 */
public class DateTimeSpinnerTag extends TimeSpinnerTag {

	private static final long serialVersionUID = 4097871830782964215L;

	private String selections;

	@Override
	public String getEasyUITag() {
		return "datetimespinner";
	}

	@Override
	public Map<String, Object> makeOptions() {

		Map<String, Object> map = super.makeOptions();

		putMap(map, "selections", selections);

		return map;
	}

}
