/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.core;

import org.kayura.type.GeneralResult;
import org.kayura.type.Result;

/**
 * @author liangxia@live.com
 *
 */
public class PostResult extends Result<Object> {

	private static final long serialVersionUID = 247868975293321852L;

	private Exception exception;

	public String getType() {

		Integer code = this.getCode();

		if (code == Result.SUCCEED) {
			return "success";
		} else if (code == Result.FAILED) {
			return "failed";
		} else if (code == Result.ERROR) {
			return "error";
		}

		return "unknown";
	}

	public Exception getException() {
		return exception;
	}

	public void setException(Exception ex) {
		this.setCode(ERROR);
		this.setMessage(ex.getMessage());
		this.exception = ex;
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

	public void setResult(GeneralResult result) {

		this.setCode(result.getCode());
		this.setMessage(result.getMessage());

		if (result.getData() != null) {
			this.setData(result.getData());
		}

		if (result.getException() != null) {
			this.setException(result.getException());
		}
	}

	public void setResult(Integer code, String message) {

		this.setCode(code);
		this.setMessage(message);
	}

	public void setResult(Integer code, String message, Object data) {

		this.setCode(code);
		this.setMessage(message);
		this.setData(data);
	}
}
