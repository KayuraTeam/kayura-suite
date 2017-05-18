package org.kayura.uasp.dao;

import java.util.Map;

import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.PageList;
import org.kayura.uasp.po.MockOrder;
import org.springframework.stereotype.Repository;

@Repository
public interface MockOrderMapper {

	PageList<MockOrder> selectMockOrders(Map<String, Object> args, PageBounds pageBounds);
	
	MockOrder getMockOrderByMap(Map<String, Object> args);

	void insertMockOrder(MockOrder mockOrder);

	void updateMockOrder(MockOrder mockOrder);

	void deleteMockOrder(String orderId);
}
