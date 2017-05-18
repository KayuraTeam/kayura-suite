/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.example.vo.convert;

import java.util.ArrayList;
import java.util.List;

import org.kayura.type.PageList;
import org.kayura.example.po.OrderDetail;
import org.kayura.example.vo.OrderDetailVo;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;

public abstract class OrderDetailConvert {
	
	static ModelMapper toVoMapper() {

		ModelMapper mm = new ModelMapper();
		mm.addMappings(new PropertyMap<OrderDetail, OrderDetailVo>() {
			@Override
			protected void configure() {
			}
		});
		return mm;
	}

	static ModelMapper toEntityMapper() {

		ModelMapper mm = new ModelMapper();
		mm.addMappings(new PropertyMap<OrderDetailVo, OrderDetail>() {
			@Override
			protected void configure() {
			}
		});
		return mm;
	}

	public static PageList<OrderDetailVo> toVos(PageList<OrderDetail> list) {

		ModelMapper mm = toVoMapper();

		List<OrderDetailVo> voList = new ArrayList<OrderDetailVo>();
		List<OrderDetail> rows = list.getRows();
		for (OrderDetail u : rows) {
			OrderDetailVo to = mm.map(u, OrderDetailVo.class);
			voList.add(to);
		}

		return new PageList<OrderDetailVo>(voList, list.getPaginator());
	}

	public static OrderDetailVo toVo(OrderDetail entity) {

		ModelMapper mm = toVoMapper();
		OrderDetailVo vo = mm.map(entity, OrderDetailVo.class);
		return vo;
	}

	public static OrderDetail toEntity(OrderDetailVo vo) {

		ModelMapper mm = toEntityMapper();
		OrderDetail entity = mm.map(vo, OrderDetail.class);
		return entity;
	}
}
