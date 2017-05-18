/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.mybatis.type;

import org.kayura.type.OrderBy;
import org.kayura.type.PageParams;
import org.kayura.type.OrderBy.Direction;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

/**
 * @author liangxia@live.com
 */
public class PageBounds extends RowBounds implements Serializable {

	private static final long serialVersionUID = 4749581887359387697L;

	public final static int NO_PAGE = 1;

	protected int page = NO_PAGE;
	protected int limit = NO_ROW_LIMIT;
	protected List<OrderBy> orderbys = new ArrayList<OrderBy>();
	protected boolean containsTotalCount;
	protected Boolean asyncTotalCount;

	public PageBounds() {
		containsTotalCount = false;
	}

	public PageBounds(PageParams pageParams) {
		this.page = pageParams.getPage();
		this.limit = pageParams.getLimit();
		this.orderbys = pageParams.getOrders();
		this.containsTotalCount = pageParams.isContainsTotalCount();
		this.asyncTotalCount = pageParams.getAsyncTotalCount();
	}

	public PageBounds(RowBounds rowBounds) {
		if (rowBounds instanceof PageBounds) {
			PageBounds pageBounds = (PageBounds) rowBounds;
			this.page = pageBounds.page;
			this.limit = pageBounds.limit;
			this.orderbys = pageBounds.orderbys;
			this.containsTotalCount = pageBounds.containsTotalCount;
			this.asyncTotalCount = pageBounds.asyncTotalCount;
		} else {
			this.page = rowBounds.getLimit();
			this.limit = rowBounds.getLimit();
		}
	}

	public PageBounds(int limit) {
		this.limit = limit;
		this.containsTotalCount = false;
	}

	public PageBounds(int page, int limit) {
		this(page, limit, new ArrayList<OrderBy>(), true);
	}

	public PageBounds(int page, int limit, boolean containsTotalCount) {
		this(page, limit, new ArrayList<OrderBy>(), containsTotalCount);
	}

	public PageBounds(List<OrderBy> orders) {
		this(NO_PAGE, NO_ROW_LIMIT, orders, false);
	}

	public PageBounds(OrderBy... order) {
		this(NO_PAGE, NO_ROW_LIMIT, order);
		this.containsTotalCount = false;
	}

	public PageBounds(int page, int limit, OrderBy... order) {
		this(page, limit, Arrays.asList(order), true);
	}

	public PageBounds(int page, int limit, List<OrderBy> orders) {
		this(page, limit, orders, true);
	}

	public PageBounds(int page, int limit, List<OrderBy> orders, boolean containsTotalCount) {
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
		final StringBuilder sb = new StringBuilder("PageBounds{");
		sb.append("page=").append(page);
		sb.append(", limit=").append(limit);
		sb.append(", orders=").append(orderbys);
		sb.append(", containsTotalCount=").append(containsTotalCount);
		sb.append(", asyncTotalCount=").append(asyncTotalCount);
		sb.append('}');
		return sb.toString();
	}
}