/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.mybatis.type;

import java.io.IOException;
import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author liangxia@live.com
 */
public class JsonTypeHandler<E extends Serializable> extends BaseTypeHandler<E> {

	Class<E> type;
	ObjectMapper objectMapper = new ObjectMapper();

	public JsonTypeHandler(Class<E> type) {
		if (type == null)
			throw new IllegalArgumentException("Type argument cannot be null");
		this.type = type;
	}

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, E parameter, JdbcType jdbcType) throws SQLException {
		String s;
		try {
			s = objectMapper.writeValueAsString(parameter);
			ps.setString(i, s);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}

	private E getJsonObject(String json) {
		E o = null;
		try {
			if (json != null && json != "") {
				o = (E) objectMapper.readValue(json, type);
			}
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return o;
	}

	@Override
	public E getNullableResult(ResultSet rs, String columnName) throws SQLException {
		String json = rs.getString(columnName);
		return getJsonObject(json);
	}

	@Override
	public E getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		String json = rs.getString(columnIndex);
		return getJsonObject(json);
	}

	@Override
	public E getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		String json = cs.getString(columnIndex);
		return getJsonObject(json);
	}

}
