/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.mybatis.plugin.paginator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;

/**
 * @author liang.xia
 *
 */
public class SqlHelper {
	private static Log logger = LogFactory.getLog(SqlHelper.class);

	public static int getCount(final MappedStatement mappedStatement, final Object parameterObject,
			final BoundSql boundSql, Dialect dialect) throws SQLException {
		final String count_sql = dialect.getCountSQL();

		logger.debug("Total count SQL [" + count_sql + "] ");
		logger.debug("Total count Parameters: " + parameterObject);

		Connection connection = null;
		PreparedStatement countStmt = null;
		ResultSet rs = null;
		try {
			connection = mappedStatement.getConfiguration().getEnvironment().getDataSource()
					.getConnection();
			countStmt = connection.prepareStatement(count_sql);
			DefaultParameterHandler handler = new DefaultParameterHandler(mappedStatement,
					parameterObject, boundSql);
			handler.setParameters(countStmt);

			rs = countStmt.executeQuery();
			int count = 0;
			if (rs.next()) {
				count = rs.getInt(1);
			}
			logger.debug("Total count: " + count);
			return count;
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} finally {
				try {
					if (countStmt != null) {
						countStmt.close();
					}
				} finally {
					if (connection != null && !connection.isClosed()) {
						connection.close();
					}
				}
			}
		}
	}
}
