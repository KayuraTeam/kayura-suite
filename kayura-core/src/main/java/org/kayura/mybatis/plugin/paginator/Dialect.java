/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.mybatis.plugin.paginator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.session.RowBounds;
import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.OrderBy;

/**
 * @author liang.xia
 *
 */
public abstract class Dialect {

	protected MappedStatement mappedStatement;
	protected PageBounds pageBounds;
	protected Object parameterObject;
	protected BoundSql boundSql;
	protected List<ParameterMapping> parameterMappings;
	protected Map<String, Object> pageParameters = new HashMap<String, Object>();

	private String pageSQL;
	private String countSQL;

	public Dialect(MappedStatement mappedStatement, Object parameterObject, PageBounds pageBounds) {
		this.mappedStatement = mappedStatement;
		this.parameterObject = parameterObject;
		this.pageBounds = pageBounds;

		init();
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	protected void init() {
		boundSql = mappedStatement.getBoundSql(parameterObject);
		parameterMappings = new ArrayList<ParameterMapping>(boundSql.getParameterMappings());

		if (parameterObject instanceof Map) {
			pageParameters.putAll((Map) parameterObject);
		} else {
			for (ParameterMapping parameterMapping : parameterMappings) {
				pageParameters.put(parameterMapping.getProperty(), parameterObject);
			}
		}

		StringBuffer bufferSql = new StringBuffer(boundSql.getSql().trim());
		if (bufferSql.lastIndexOf(";") == bufferSql.length() - 1) {
			bufferSql.deleteCharAt(bufferSql.length() - 1);
		}

		String sql = bufferSql.toString();
		pageSQL = sql;
		if (pageBounds.getOrders() != null && !pageBounds.getOrders().isEmpty()) {
			pageSQL = getSortString(sql, pageBounds.getOrders());
		}
		if (pageBounds.getOffset() != RowBounds.NO_ROW_OFFSET || pageBounds.getLimit() != RowBounds.NO_ROW_LIMIT) {
			pageSQL = getLimitString(pageSQL, "__offset", pageBounds.getOffset(), "__limit", pageBounds.getLimit());
		}

		countSQL = getCountString(sql);
	}

	public List<ParameterMapping> getParameterMappings() {
		return parameterMappings;
	}

	public Object getParameterObject() {
		return pageParameters;
	}

	public String getPageSQL() {
		return pageSQL;
	}

	protected void setPageParameter(String name, Object value, Class<?> type) {
		ParameterMapping parameterMapping = new ParameterMapping.Builder(mappedStatement.getConfiguration(), name, type)
				.build();
		parameterMappings.add(parameterMapping);
		pageParameters.put(name, value);
	}

	public String getCountSQL() {
		return countSQL;
	}

	protected String getLimitString(String sql, String offsetName, int offset, String limitName, int limit) {
		throw new UnsupportedOperationException("paged queries not supported");
	}

	protected String getCountString(String sql) {
		return "select count(1) from (" + sql + ") tmp_count";
	}

	protected String getSortString(String sql, List<OrderBy> orders) {
		if (orders == null || orders.isEmpty()) {
			return sql;
		}

		StringBuffer buffer = new StringBuffer("select * from (");
		buffer.append(sql).append(") temp_order order by ");

		for (OrderBy order : orders) {
			if (order != null) {
				buffer.append(order.toString()).append(", ");
			}
		}

		buffer.delete(buffer.length() - 2, buffer.length());
		return buffer.toString();
	}

}
