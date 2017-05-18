/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.example.service;

import java.util.Map;

import org.kayura.example.po.Customer;
import org.kayura.example.vo.OrderDetailVo;
import org.kayura.example.vo.OrderVo;
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;

public interface ExampleService {

	PageList<OrderVo> findOrders(Map<String, Object> args, PageParams pageParams);

	OrderVo getOrderById(Integer orderId);

	GeneralResult saveOrUpdateOrder(OrderVo order);

	GeneralResult deleteOrderById(Integer orderId);

	PageList<OrderDetailVo> findOrderDetails(Map<String, Object> args, PageParams pageParams);

	OrderDetailVo getOrderDetailById(Integer orderDetailId);

	GeneralResult saveOrUpdateOrderDetail(OrderDetailVo orderDetail);

	GeneralResult deleteOrderDetailById(Integer orderDetailId);

	Result<PageList<Customer>> findCustomers(String keyword, PageParams pageParams);

}
