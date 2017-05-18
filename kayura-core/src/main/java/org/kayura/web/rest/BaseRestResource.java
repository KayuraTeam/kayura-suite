package org.kayura.web.rest;

import java.util.HashMap;
import java.util.Map;

import org.kayura.core.PostAction;
import org.kayura.core.PostResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.utils.StringUtils;
import org.kayura.web.ui.UISupport;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;

public abstract class BaseRestResource {

	protected final Log logger = LogFactory.getLog(this.getClass());

	@Autowired
	protected UISupport ui;

	@Autowired
	protected ObjectMapper objectMapper;

	protected PageParams getPageParams(HttpServletRequest req) {
		return ui.getPageParams(req);
	}

	protected void putData(Map<String, Object> model, PageList<?> pageList) {
		ui.putData(model, pageList);
	}

	protected Map<String, Object> result(Integer code, String message, Object data) {

		Map<String, Object> map = new HashMap<String, Object>();

		if (code == Result.SUCCEED) {

			map.put("success", true);
		} else {

			String type = "";
			if (code == Result.SUCCEED) {
				type = "success";
			} else if (code == Result.FAILED) {
				type = "failed";
			} else if (code == Result.ERROR) {
				type = "error";
			}

			map.put("success", false);
			map.put("type", type);
		}

		if (StringUtils.isNotEmpty(message)) {
			map.put("message", message);
		}

		if (data != null) {
			map.put("data", data);
		}

		return map;
	}

	protected Map<String, Object> error(String message) {

		return result(Result.ERROR, message, null);
	}

	protected Map<String, Object> success(String message, Object data) {

		return result(Result.SUCCEED, message, data);
	}

	protected void postExecute(Map<String, Object> model, PostAction postAction) {

		PostResult postResult = new PostResult();

		try {
			postAction.invoke(postResult);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			postResult.setError(e.getMessage());
		}

		model.clear();
		model.put("success", postResult.isSucceed());
		model.put("type", postResult.getType());
		model.put("message", postResult.getMessage());
		model.put("data", postResult.getData());
	}

	protected String json(Object data) {
		String s = null;
		try {
			s = objectMapper.writeValueAsString(data);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}
		return s;
	}

}
