/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.type;

import java.io.Serializable;

/**
 * @author liangxia@live.com
 *
 */
public class Paginator implements Serializable {

	private static final long serialVersionUID = 7118660261326512200L;
	private static final int DEFAULT_SLIDERS_COUNT = 7;

	private int pageSize;
	private int pageIndex;
	private long totalCount;

	public Paginator(long totalCount) {
		this.totalCount = totalCount;
	}

	public Paginator(int pageIndex, int pageSize, int totalCount) {
		super();
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.pageIndex = computePageNo(pageIndex);
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public boolean isFirstPage() {
		return pageIndex <= 1;
	}

	public boolean isLastPage() {
		return pageIndex >= getTotalPages();
	}

	public int getPrePage() {
		if (isHasPrePage()) {
			return pageIndex - 1;
		} else {
			return pageIndex;
		}
	}

	public int getNextPage() {
		if (isHasNextPage()) {
			return pageIndex + 1;
		} else {
			return pageIndex;
		}
	}

	public boolean isDisabledPage(int page) {
		return ((page < 1) || (page > getTotalPages()) || (page == this.pageIndex));
	}

	public boolean isHasPrePage() {
		return (pageIndex - 1 >= 1);
	}

	public boolean isHasNextPage() {
		return (pageIndex + 1 <= getTotalPages());
	}

	public int getStartRow() {
		if (getPageSize() <= 0 || totalCount <= 0)
			return 0;
		return pageIndex > 0 ? (pageIndex - 1) * getPageSize() + 1 : 0;
	}

	public int getEndRow() {
		return (int) (pageIndex > 0 ? Math.min(pageSize * pageIndex, getTotalCount()) : 0);
	}

	public int getOffset() {
		return pageIndex > 0 ? (pageIndex - 1) * getPageSize() : 0;
	}

	public int getTotalPages() {
		if (totalCount <= 0) {
			return 0;
		}
		if (pageSize <= 0) {
			return 0;
		}

		int count = (int) (totalCount / pageSize);
		if (totalCount % pageSize > 0) {
			count++;
		}
		return count;
	}

	protected int computePageNo(int page) {
		return computePageNumber(page, pageSize, totalCount);
	}

	public Integer[] getSlider() {
		return slider(DEFAULT_SLIDERS_COUNT);
	}

	public Integer[] slider(int slidersCount) {
		return generateLinkPageNumbers(getPageIndex(), (int) getTotalPages(), slidersCount);
	}

	private static int computeLastPageNumber(long totalItems, int pageSize) {
		if (pageSize <= 0)
			return 1;
		int result = (int) (totalItems % pageSize == 0 ? totalItems / pageSize : totalItems / pageSize + 1);
		if (result <= 1)
			result = 1;
		return result;
	}

	private static int computePageNumber(int page, int pageSize, long totalItems) {
		if (page <= 1) {
			return 1;
		}
		if (Integer.MAX_VALUE == page || page > computeLastPageNumber(totalItems, pageSize)) {
			return computeLastPageNumber(totalItems, pageSize);
		}
		return page;
	}

	private static Integer[] generateLinkPageNumbers(int currentPageNumber, int lastPageNumber, int count) {
		int avg = count / 2;

		int startPageNumber = currentPageNumber - avg;
		if (startPageNumber <= 0) {
			startPageNumber = 1;
		}

		int endPageNumber = startPageNumber + count - 1;
		if (endPageNumber > lastPageNumber) {
			endPageNumber = lastPageNumber;
		}

		if (endPageNumber - startPageNumber < count) {
			startPageNumber = endPageNumber - count;
			if (startPageNumber <= 0) {
				startPageNumber = 1;
			}
		}

		java.util.List<Integer> result = new java.util.ArrayList<Integer>();
		for (int i = startPageNumber; i <= endPageNumber; i++) {
			result.add(new Integer(i));
		}
		return result.toArray(new Integer[result.size()]);
	}

	@Override
	public String toString() {
		final StringBuilder sb = new StringBuilder();
		sb.append("Paginator");
		sb.append("{page=").append(pageIndex);
		sb.append(", limit=").append(pageSize);
		sb.append(", totalCount=").append(totalCount);
		sb.append('}');
		return sb.toString();
	}
}