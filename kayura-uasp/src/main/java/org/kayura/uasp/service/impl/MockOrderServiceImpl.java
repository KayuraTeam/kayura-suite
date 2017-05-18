package org.kayura.uasp.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.kayura.utils.DateUtils;
import org.kayura.utils.KeyUtils;
import org.kayura.utils.MapUtils;
import org.kayura.utils.StringUtils;
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.mybatis.type.PageBounds;
import org.kayura.uasp.po.MockOrder;
import org.kayura.uasp.dao.MockOrderMapper;
import org.kayura.uasp.service.MockOrderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MockOrderServiceImpl implements MockOrderService {

	@Autowired
	private MockOrderMapper mockOrderMapper;

	@Override
	public Result<PageList<MockOrder>> selectMockOrders(String tenantId, String keyword, PageParams pageParams) {

		Map<String, Object> args = new HashMap<String, Object>();

		if (StringUtils.isNotEmpty(tenantId)) {
			args.put("tenantId", tenantId);
		}

		if (StringUtils.isNotEmpty(keyword)) {
			args.put("keyword", keyword);
		}

		PageList<MockOrder> orders = mockOrderMapper.selectMockOrders(args, new PageBounds(pageParams));
		return Result.succeed(orders);
	}

	@Override
	public Result<MockOrder> getMockOrderById(String orderId) {

		Map<String, Object> args = MapUtils.make("orderId", orderId);
		MockOrder order = mockOrderMapper.getMockOrderByMap(args);

		return Result.succeed(order);
	}

	@Override
	public GeneralResult createMockOrder(MockOrder mockOrder) {

		if (StringUtils.isEmpty(mockOrder.getOrderId())) {
			mockOrder.setOrderId(KeyUtils.newId());
		}

		Date now = DateUtils.now();

		if (mockOrder.getCreateTime() == null) {
			mockOrder.setCreateTime(now);
		}

		mockOrder.setUpdateTime(now);
		mockOrderMapper.insertMockOrder(mockOrder);

		return Result.succeed();
	}

	@Override
	public GeneralResult updateMockOrder(MockOrder mockOrder) {

		mockOrder.setUpdateTime(DateUtils.now());
		mockOrderMapper.updateMockOrder(mockOrder);

		return Result.succeed();
	}

	@Override
	public GeneralResult deleteMockOrder(String orderId) {
		mockOrderMapper.deleteMockOrder(orderId);
		return Result.succeed();
	}
}
