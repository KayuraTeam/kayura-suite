package org.kayura.uasp.rest;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.kayura.security.LoginUser;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.uasp.po.MockOrder;
import org.kayura.uasp.service.MockOrderService;
import org.kayura.utils.KeyUtils;
import org.kayura.utils.StringUtils;
import org.kayura.web.rest.UaspRestResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MockOrderRestResource extends UaspRestResource {

	@Autowired
	private MockOrderService mockOrderService;

	@RequestMapping(value = "mockorder/find", method = RequestMethod.GET)
	public Map<String, Object> findMockOrders(HttpServletRequest request, String keyword) {

		PageParams pageParams = ui.getPageParams(request);

		LoginUser user = this.getLoginUser();
		Result<PageList<MockOrder>> r = mockOrderService.selectMockOrders(user.getTenantId(), keyword, pageParams);

		return result(r.getCode(), r.getMessage(), ui.putData(r.getData()));
	}

	@RequestMapping(value = "mockorder/{orderId}/get", method = RequestMethod.GET)
	public Map<String, Object> getMockOrderById(HttpServletRequest request, @PathVariable String orderId) {

		Result<MockOrder> r = mockOrderService.getMockOrderById(orderId);
		return result(r.getCode(), r.getMessage(), r.getData());
	}

	@RequestMapping(value = "mockorder/save", method = RequestMethod.POST)
	public void saveUpdateMockOrder(MockOrder mockOrder) {

		if (StringUtils.isEmpty(mockOrder.getOrderId())) {

			mockOrder.setOrderId(KeyUtils.newId());
			mockOrder.setTenantId(this.getLoginUser().getTenantId());

			mockOrderService.createMockOrder(mockOrder);
		} else {

			mockOrderService.updateMockOrder(mockOrder);
		}
	}

	@RequestMapping(value = "mockorder/{orderId}/remove", method = RequestMethod.DELETE)
	public void removeMockOrder(@PathVariable String orderId) {

		mockOrderService.deleteMockOrder(orderId);
	}

}
