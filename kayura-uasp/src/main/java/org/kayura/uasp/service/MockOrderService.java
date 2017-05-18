package org.kayura.uasp.service;

import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.uasp.po.MockOrder;

public interface MockOrderService {

	Result<PageList<MockOrder>> selectMockOrders(String teanantId, String keyword, PageParams pageParams);

	Result<MockOrder> getMockOrderById(String orderId);
	
	GeneralResult createMockOrder(MockOrder mockOrder);

	GeneralResult updateMockOrder(MockOrder mockOrder);

	GeneralResult deleteMockOrder(String orderId);

}
