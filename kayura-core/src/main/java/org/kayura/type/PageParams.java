/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.type;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.kayura.type.OrderBy.Direction;

/**
 * @author liangxia@live.com
 */
public class PageParams implements Serializable {

	private static final long serialVersionUID = -950104274492012413L;

	public final static int NO_PAGE = 1;
	public static final int NO_ROW_OFFSET = 0;
	public static final int NO_ROW_LIMIT = Integer.MAX_VALUE;

	protected int page = NO_PAGE;
	protected int limit = NO_ROW_LIMIT;
	protected List<OrderBy> orderbys = new ArrayList<OrderBy>();
	protected boolean containsTotalCount;
	protected Boolean asyncTotalCount;

	public PageParams() {
		containsTotalCount = false;
	}

	public PageParams(int limit) {
		this.limit = limit;
		this.containsTotalCount = false;
	}

	public PageParams(int page, int limit) {
		this(page, limit, new ArrayList<OrderBy>(), true);
	}

	public PageParams(int page, int limit, boolean containsTotalCount) {
		this(page, limit, new ArrayList<OrderBy>(), containsTotalCount);
	}

	public PageParams(List<OrderBy> orders) {
		this(NO_PAGE, NO_ROW_LIMIT, orders, false);
	}

	public PageParams(OrderBy... order) {
		this(NO_PAGE, NO_ROW_LIMIT, order);
		this.containsTotalCount = false;
	}

	public PageParams(int page, int limit, OrderBy... order) {
		this(page, limit, Arrays.asList(order), true);
	}

	public PageParams(int page, int limit, List<OrderBy> orders) {
		this(page, limit, orders, true);
	}

	public PageParams(int page, int limit, List<OrderBy> orders, boolean containsTotalCount) {
		this.page = page;
		this.limit = limit;
		this.orderbys = orders;
		this.containsTotalCount = containsTotalCount;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public boolean isContainsTotalCount() {
		return containsTotalCount;
	}

	public void setContainsTotalCount(boolean containsTotalCount) {
		this.containsTotalCount = containsTotalCount;
	}

	public List<OrderBy> getOrders() {
		return orderbys;
	}

	public void setOrders(List<OrderBy> orders) {
		this.orderbys = orders;
	}

	public void setOrderBy(String property, Direction direction) {
		if (this.orderbys == null) {
			this.orderbys = new ArrayList<OrderBy>();
		}

		orderbys.add(new OrderBy(property, direction, ""));
	}

	public Boolean getAsyncTotalCount() {
		return asyncTotalCount;
	}

	public void setAsyncTotalCount(Boolean asyncTotalCount) {
		this.asyncTotalCount = asyncTotalCount;
	}

	public int getOffset() {
		if (page >= 1) {
			return (page - 1) * limit;
		}
		return 0;
	}

	@Override
	public String toString() {
		final StringBuilder sb = new StringBuilder("PageParams{");
		sb.append("page=").append(page);
		sb.append(", limit=").append(limit);
		sb.append(", orders=").append(orderbys);
		sb.append(", containsTotalCount=").append(containsTotalCount);
		sb.append(", asyncTotalCount=").append(asyncTotalCount);
		sb.append('}');
		return sb.toString();
	}
}