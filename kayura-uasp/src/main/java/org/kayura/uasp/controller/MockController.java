/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.controller;

import org.kayura.web.controllers.UaspController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * MockController
 *
 * @author liangxia@live.com
 */
@Controller
public class MockController extends UaspController {

	@RequestMapping(value = "/mock/fileup", method = RequestMethod.GET)
	public ModelAndView fileUpload() {

		return this.view("views/mock/fileup");
	}

	@RequestMapping(value = "/mock/order/list", method = RequestMethod.GET)
	public ModelAndView mockOrderList() {
		
		ModelAndView view = this.view("views/mock/order-list");
		view.addObject("tenantId", this.getLoginUser().getTenantId());
		return view;
	}

	@RequestMapping(value = "/mock/order/new", method = RequestMethod.GET)
	public ModelAndView createMockOrder() {

		return this.view("views/mock/order-edit");
	}

	@RequestMapping(value = "/mock/order/edit", method = RequestMethod.GET)
	public ModelAndView editMockOrder(String id) {

		ModelAndView view = this.view("views/mock/order-edit");
		view.addObject("orderId", id);
		return view;
	}

}
