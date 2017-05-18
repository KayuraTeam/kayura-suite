/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.example.dao;

import java.util.Map;

import org.kayura.example.po.Order;
import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.PageList;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderMapper {
	
    int deleteByKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order getById(Integer id);

    PageList<Order> findByMap(Map<String, Object> args, PageBounds pageBounds);

    int updateBySelective(Order record);

    int updateByKey(Order record);
}