/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.example.dao;

import java.util.Map;

import org.kayura.example.po.OrderDetail;
import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.PageList;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetailMapper {
	
    int deleteByKey(Integer id);

    int insert(OrderDetail record);

    int insertSelective(OrderDetail record);

    OrderDetail getById(Integer id);

    PageList<OrderDetail> findByMap(Map<String, Object> args, PageBounds pageBounds);

    int updateBySelective(OrderDetail record);

    int updateByKey(OrderDetail record);
}