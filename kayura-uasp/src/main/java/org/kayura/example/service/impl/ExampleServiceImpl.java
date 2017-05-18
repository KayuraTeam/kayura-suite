/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.example.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.utils.StringUtils;
import org.kayura.example.service.ExampleService;
import org.kayura.example.vo.OrderDetailVo;
import org.kayura.example.vo.OrderVo;
import org.kayura.example.vo.convert.OrderConvert;
import org.kayura.example.vo.convert.OrderDetailConvert;
import org.kayura.example.dao.CustomerMapper;
import org.kayura.example.dao.OrderDetailMapper;
import org.kayura.example.dao.OrderMapper;
import org.kayura.example.po.Customer;
import org.kayura.example.po.Order;
import org.kayura.example.po.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author liangxia@live.com
 */
@Service
public class ExampleServiceImpl implements ExampleService {

	@Autowired
	private CustomerMapper customerMapper;

	@Autowired
	private OrderMapper orderMapper;

	@Autowired
	private OrderDetailMapper orderDetailMapper;

	@Override
	public PageList<OrderVo> findOrders(Map<String, Object> args, PageParams pageParams) {

		PageList<Order> orders = orderMapper.findByMap(args, new PageBounds(pageParams));
		return OrderConvert.toVos(orders);
	}

	@Override
	public OrderVo getOrderById(Integer orderId) {

		Order entity = orderMapper.getById(orderId);
		return OrderConvert.toVo(entity);
	}

	@Override
	public GeneralResult saveOrUpdateOrder(OrderVo order) {

		try {
			Order entity = OrderConvert.toEntity(order);
			if (order.getId() == 0) {
				orderMapper.insert(entity);
			} else {
				orderMapper.updateByKey(entity);
			}
		} catch (Exception e) {
			Result.error("订单保存失败。", e);
		}

		return Result.succeed("订单保存成功。");
	}

	@Override
	public GeneralResult deleteOrderById(Integer orderId) {

		try {
			orderMapper.deleteByKey(orderId);
		} catch (Exception e) {
			Result.error("订单删除失败。", e);
		}

		return Result.succeed("订单删除成功。");
	}

	@Override
	public PageList<OrderDetailVo> findOrderDetails(Map<String, Object> args, PageParams pageParams) {

		PageList<OrderDetail> details = orderDetailMapper.findByMap(args, new PageBounds(pageParams));
		return OrderDetailConvert.toVos(details);
	}

	@Override
	public OrderDetailVo getOrderDetailById(Integer detailId) {

		OrderDetail entity = orderDetailMapper.getById(detailId);
		return OrderDetailConvert.toVo(entity);
	}

	@Override
	public GeneralResult saveOrUpdateOrderDetail(OrderDetailVo orderDetail) {

		try {
			OrderDetail entity = OrderDetailConvert.toEntity(orderDetail);
			if (orderDetail.getId() == 0) {
				orderDetailMapper.insert(entity);
			} else {
				orderDetailMapper.updateByKey(entity);
			}
		} catch (Exception e) {
			Result.error("订单保存失败。", e);
		}

		return Result.succeed("订单保存成功。");
	}

	@Override
	public GeneralResult deleteOrderDetailById(Integer detailId) {

		try {
			orderDetailMapper.deleteByKey(detailId);
		} catch (Exception e) {
			Result.error("订单清单项删除失败。", e);
		}
		return Result.succeed("订单清单项保存成功。");
	}

	@Override
	public Result<PageList<Customer>> findCustomers(String keyword, PageParams pageParams) {

		Map<String, Object> args = new HashMap<String, Object>();

		if (!StringUtils.isEmpty(keyword)) {
			args.put("keyword", "%" + keyword + "%");
		}

		PageList<Customer> list = customerMapper.findByMap(args, new PageBounds(pageParams));

		return new Result<PageList<Customer>>(Result.SUCCEED, list);
	}

}
