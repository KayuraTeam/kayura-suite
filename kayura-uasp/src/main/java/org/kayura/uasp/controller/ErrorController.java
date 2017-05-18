/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.controller;

import javax.servlet.http.HttpServletRequest;

import org.kayura.web.controllers.UaspController;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * ErrorController
 *
 * @author liangxia@live.com
 */
@Controller
public class ErrorController extends UaspController {

	@RequestMapping(value = "/error/403", method = RequestMethod.GET)
	public ModelAndView denied(HttpServletRequest request) {

		ModelAndView mv = view("views/error/403");
		mv.addObject("type", "failed");

		Object o = request.getSession().getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		if (o != null && o instanceof RuntimeException) {

			RuntimeException ex = (RuntimeException) o;
			mv.addObject("message", ex.getMessage());
		}

		return mv;
	}

	@RequestMapping(value = "/error/404", method = RequestMethod.GET)
	public ModelAndView notfound() {

		return view("views/error/404");
	}
}
