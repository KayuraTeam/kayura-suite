/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.mybatis.plugin;

import org.kayura.mybatis.plugin.paginator.Dialect;
import org.kayura.mybatis.plugin.paginator.SqlHelper;
import org.kayura.mybatis.plugin.paginator.dialect.MySQLDialect;
import org.kayura.mybatis.plugin.paginator.dialect.OracleDialect;
import org.kayura.mybatis.plugin.paginator.dialect.SQLServer2005Dialect;
import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.PageList;
import org.kayura.type.Paginator;
import org.kayura.utils.PropertiesUtils;

import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.cache.Cache;
import org.apache.ibatis.cache.CacheKey;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.MappedStatement.Builder;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

/**
 * @author liangxia@live.com
 */
@Intercepts(value = { @Signature(type = Executor.class, method = "query", args = { MappedStatement.class, Object.class,
		RowBounds.class, ResultHandler.class }) })
public class PagerInterceptor implements Interceptor {

	private static Log logger = LogFactory.getLog(PagerInterceptor.class);

	static int MAPPED_STATEMENT_INDEX = 0;
	static int PARAMETER_INDEX = 1;
	static int ROWBOUNDS_INDEX = 2;
	static int RESULT_HANDLER_INDEX = 3;

	static Map<String, String> dialectAlias = new HashMap<String, String>();
	static ExecutorService Pool;
	String dialectClass;
	boolean asyncTotalCount = false;

	static {
		dialectAlias.put("mysql", MySQLDialect.class.getName());
		dialectAlias.put("sqlserver", SQLServer2005Dialect.class.getName());
		dialectAlias.put("oracle", OracleDialect.class.getName());
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Object intercept(final Invocation invocation) throws Throwable {

		final Object[] queryArgs = invocation.getArgs();
		final RowBounds rowBounds = (RowBounds) queryArgs[ROWBOUNDS_INDEX];

		if (!(rowBounds instanceof PageBounds)) {
			return invocation.proceed();
		}

		final Executor executor = (Executor) invocation.getTarget();
		final MappedStatement ms = (MappedStatement) queryArgs[MAPPED_STATEMENT_INDEX];
		final Object parameter = queryArgs[PARAMETER_INDEX];
		final PageBounds pageBounds = new PageBounds(rowBounds);

		logger.trace("OffsetLimitInterceptor.intercept:");

		if (pageBounds.getOffset() == RowBounds.NO_ROW_OFFSET && pageBounds.getLimit() == RowBounds.NO_ROW_LIMIT
				&& pageBounds.getOrders().isEmpty()) {
			return invocation.proceed();
		}

		final Dialect dialect;
		try {
			Class<?> clazz = Class.forName(dialectClass);
			Constructor<?> constructor = clazz.getConstructor(MappedStatement.class, Object.class, PageBounds.class);
			dialect = (Dialect) constructor.newInstance(new Object[] { ms, parameter, pageBounds });
		} catch (Exception e) {
			throw new ClassNotFoundException("Cannot create dialect instance: " + dialectClass, e);
		}

		final BoundSql boundSql = ms.getBoundSql(parameter);

		queryArgs[MAPPED_STATEMENT_INDEX] = copyFromNewSql(ms, boundSql, dialect.getPageSQL(),
				dialect.getParameterMappings(), dialect.getParameterObject());
		queryArgs[PARAMETER_INDEX] = dialect.getParameterObject();
		queryArgs[ROWBOUNDS_INDEX] = new RowBounds(RowBounds.NO_ROW_OFFSET, RowBounds.NO_ROW_LIMIT);

		Boolean async = pageBounds.getAsyncTotalCount() == null ? asyncTotalCount : pageBounds.getAsyncTotalCount();
		Future<List> listFuture = call(new Callable<List>() {
			public List call() throws Exception {
				return (List) invocation.proceed();
			}
		}, async);

		if (pageBounds.isContainsTotalCount()) {
			Callable<Paginator> countTask = new Callable<Paginator>() {
				public Paginator call() throws Exception {
					Integer count;
					Cache cache = ms.getCache();
					if (cache != null && ms.isUseCache() && ms.getConfiguration().isCacheEnabled()) {
						CacheKey cacheKey = executor.createCacheKey(ms, parameter, new PageBounds(),
								copyFromBoundSql(ms, boundSql, dialect.getCountSQL(), boundSql.getParameterMappings(),
										boundSql.getParameterObject()));
						count = (Integer) cache.getObject(cacheKey);
						if (count == null) {
							count = SqlHelper.getCount(ms, parameter, boundSql, dialect);
							cache.putObject(cacheKey, count);
						}
					} else {
						count = SqlHelper.getCount(ms, parameter, boundSql, dialect);
					}
					return new Paginator(pageBounds.getPage(), pageBounds.getLimit(), count);
				}
			};
			Future<Paginator> countFutrue = call(countTask, async);
			return new PageList<Object>(listFuture.get(), countFutrue.get());
		}

		return listFuture.get();
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private <T> Future<T> call(Callable callable, boolean async) {
		if (async) {
			return Pool.submit(callable);
		} else {
			FutureTask<T> future = new FutureTask<T>(callable);
			future.run();
			return future;
		}
	}

	private MappedStatement copyFromNewSql(MappedStatement ms, BoundSql boundSql, String sql,
			List<ParameterMapping> parameterMappings, Object parameter) {
		BoundSql newBoundSql = copyFromBoundSql(ms, boundSql, sql, parameterMappings, parameter);
		return copyFromMappedStatement(ms, new BoundSqlSqlSource(newBoundSql));
	}

	private BoundSql copyFromBoundSql(MappedStatement ms, BoundSql boundSql, String sql,
			List<ParameterMapping> parameterMappings, Object parameter) {
		BoundSql newBoundSql = new BoundSql(ms.getConfiguration(), sql, parameterMappings, parameter);
		for (ParameterMapping mapping : boundSql.getParameterMappings()) {
			String prop = mapping.getProperty();
			if (boundSql.hasAdditionalParameter(prop)) {
				newBoundSql.setAdditionalParameter(prop, boundSql.getAdditionalParameter(prop));
			}
		}
		return newBoundSql;
	}

	private MappedStatement copyFromMappedStatement(MappedStatement ms, SqlSource newSqlSource) {
		Builder builder = new Builder(ms.getConfiguration(), ms.getId(), newSqlSource, ms.getSqlCommandType());

		builder.resource(ms.getResource());
		builder.fetchSize(ms.getFetchSize());
		builder.statementType(ms.getStatementType());
		builder.keyGenerator(ms.getKeyGenerator());

		if (ms.getKeyProperties() != null && ms.getKeyProperties().length != 0) {
			StringBuffer keyProperties = new StringBuffer();
			for (String keyProperty : ms.getKeyProperties()) {
				keyProperties.append(keyProperty).append(",");
			}
			keyProperties.delete(keyProperties.length() - 1, keyProperties.length());
			builder.keyProperty(keyProperties.toString());
		}

		builder.timeout(ms.getTimeout());
		builder.parameterMap(ms.getParameterMap());
		builder.resultMaps(ms.getResultMaps());
		builder.resultSetType(ms.getResultSetType());
		builder.cache(ms.getCache());
		builder.flushCacheRequired(ms.isFlushCacheRequired());
		builder.useCache(ms.isUseCache());

		return builder.build();
	}

	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	public void setProperties(Properties properties) {
		PropertiesUtils propertiesHelper = new PropertiesUtils(properties);
		String dialect = propertiesHelper.getRequiredString("dialect").toLowerCase();
		if (dialectAlias.containsKey(dialect)) {
			dialect = dialectAlias.get(dialect);
		}
		setDialectClass(dialect);
		setAsyncTotalCount(propertiesHelper.getBoolean("asyncTotalCount", false));
		setPoolMaxSize(propertiesHelper.getInt("poolMaxSize", 0));
	}

	public static class BoundSqlSqlSource implements SqlSource {
		BoundSql boundSql;

		public BoundSqlSqlSource(BoundSql boundSql) {
			this.boundSql = boundSql;
		}

		public BoundSql getBoundSql(Object parameterObject) {
			return boundSql;
		}
	}

	public void setDialectClass(String dialectClass) {
		logger.debug("dialectClass:  " + dialectClass);
		this.dialectClass = dialectClass;
	}

	public void setAsyncTotalCount(boolean asyncTotalCount) {
		logger.debug("asyncTotalCount: " + asyncTotalCount);
		this.asyncTotalCount = asyncTotalCount;
	}

	public void setPoolMaxSize(int poolMaxSize) {
		if (poolMaxSize > 0) {
			logger.debug("poolMaxSize: " + poolMaxSize);
			Pool = Executors.newFixedThreadPool(poolMaxSize);
		} else {
			Pool = Executors.newCachedThreadPool();
		}
	}
}
