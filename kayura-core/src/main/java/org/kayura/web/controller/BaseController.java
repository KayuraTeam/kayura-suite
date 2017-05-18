package org.kayura.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.kayura.type.Result;
import org.kayura.web.rest.BaseRestResource;
import org.springframework.web.servlet.ModelAndView;

public abstract class BaseController extends BaseRestResource {

	public ModelAndView view(String viewName) {

		return new ModelAndView(viewName);
	}

	public ModelAndView view(String viewName, Object model) {

		ModelAndView mv = view(viewName);
		mv.addObject("model", model);

		return mv;
	}

	protected ModelAndView errorPage(Result<?> r) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", r.getMessage());
		return errorPage(map);
	}

	protected ModelAndView errorPage(String message, String details) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", message);
		map.put("details", details);

		return errorPage(map);
	}

	protected ModelAndView errorPage(String message) {

		return errorPage(message, "");
	}

	protected ModelAndView errorPage(Map<String, Object> map) {

		return new ModelAndView("shared/error", map);
	}
}
