/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.type;

import java.util.HashMap;
import java.util.Map;

/**
 * @author liangxia@live.com
 */
public class GeneralResult extends Result<Map<String, Object>> {

	private static final long serialVersionUID = 1606589046205613193L;

	private Exception exception;

	public GeneralResult() {
		this.setData(new HashMap<String, Object>());
	}

	public Exception getException() {
		return exception;
	}

	public void setError(String message, Exception exception) {
		this.setCode(ERROR);
		this.setMessage(message);
		this.exception = exception;
	}

	public void setFalied(String message) {
		this.setCode(FAILED);
		this.setMessage(message);
	}

	public void setException(Exception exception) {
		this.setCode(ERROR);
		this.exception = exception;
	}

	public void add(String key, Object value) {
		Map<String, Object> data = this.getData();
		data.put(key, value);
	}

	public Object get(String key) {
		Map<String, Object> data = this.getData();
		return data.get(key);
	}

	/**
	 * 获取 Data 数据项的字符集.
	 * 
	 * @param key 数据项的键.
	 * @return 返回该项的字符集 ( toString ).
	 */
	public String getString(String key) {
		return Convert.toString(get(key));
	}

	/**
	 * 获取 Boolean 类型值的数据项.
	 * 
	 * @param key 数据项的键.
	 * @return 返回该项的Boolean值,强制转换.
	 */
	public Boolean getBool(String key) {
		return (Boolean) get(key);
	}

}