/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.query;

/**
 * AbstractQuery
 *
 * @author liangxia@live.com
 */
public abstract class AbstractQuery<T extends Query<?, ?>, U> implements Query<T, U> {

	public static final String SORTORDER_ASC = "asc";
	public static final String SORTORDER_DESC = "desc";

	@SuppressWarnings("unused")
	private static enum ResultType {
		LIST, LIST_PAGE, SINGLE_RESULT, COUNT
	}

}
