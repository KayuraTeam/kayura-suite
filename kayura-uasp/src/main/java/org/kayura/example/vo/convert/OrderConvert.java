/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.example.vo.convert;

import java.util.ArrayList;
import java.util.List;

import org.kayura.type.PageList;
import org.kayura.example.po.Order;
import org.kayura.example.vo.OrderVo;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;

public abstract class OrderConvert {
	
	static ModelMapper toVoMapper() {

		ModelMapper mm = new ModelMapper();
		mm.addMappings(new PropertyMap<Order, OrderVo>() {
			@Override
			protected void configure() {
			}
		});
		return mm;
	}

	static ModelMapper toEntityMapper() {

		ModelMapper mm = new ModelMapper();
		mm.addMappings(new PropertyMap<OrderVo, Order>() {
			@Override
			protected void configure() {
			}
		});
		return mm;
	}

	public static PageList<OrderVo> toVos(PageList<Order> list) {

		ModelMapper mm = toVoMapper();

		List<OrderVo> voList = new ArrayList<OrderVo>();
		List<Order> rows = list.getRows();
		for (Order u : rows) {
			OrderVo to = mm.map(u, OrderVo.class);
			voList.add(to);
		}

		return new PageList<OrderVo>(voList, list.getPaginator());
	}

	public static OrderVo toVo(Order entity) {

		ModelMapper mm = toVoMapper();
		OrderVo vo = mm.map(entity, OrderVo.class);
		return vo;
	}

	public static Order toEntity(OrderVo vo) {

		ModelMapper mm = toEntityMapper();
		Order entity = mm.map(vo, Order.class);
		return entity;
	}
}
