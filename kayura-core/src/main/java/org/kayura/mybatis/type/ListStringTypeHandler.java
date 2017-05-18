package org.kayura.mybatis.type;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.kayura.utils.StringUtils;

public class ListStringTypeHandler extends BaseTypeHandler<List<String>> {

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, List<String> parameter, JdbcType jdbcType)
			throws SQLException {

		if (parameter != null && !parameter.isEmpty()) {
			String join = StringUtils.join(",", parameter.toArray());
			ps.setString(i, join + ",");
		}
	}

	@Override
	public List<String> getNullableResult(ResultSet rs, String columnName) throws SQLException {

		String list = rs.getString(columnName);
		return stringToList(list);
	}

	private List<String> stringToList(String list) {

		if (list != null) {

			if (list.endsWith(",")) {
				list = list.substring(0, list.length() - 1);
			}

			List<String> strList = new ArrayList<String>();
			strList.addAll(Arrays.asList(list.split(",")));
			return strList;
		}

		return null;
	}

	@Override
	public List<String> getNullableResult(ResultSet rs, int columnIndex) throws SQLException {

		String list = rs.getString(columnIndex);
		return stringToList(list);
	}

	@Override
	public List<String> getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {

		String list = cs.getString(columnIndex);
		return stringToList(list);
	}

}
