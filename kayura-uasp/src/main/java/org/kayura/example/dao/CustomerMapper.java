/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.example.dao;

import java.util.Map;

import org.kayura.example.po.Customer;
import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.PageList;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerMapper {

	PageList<Customer> findByMap(Map<String, Object> args, PageBounds pageBounds);

	int deleteByKey(String id);

	int insert(Customer record);

	int insertSelective(Customer record);

	Customer selectByKey(String id);

	int updateBySelective(Customer record);

	int updateByKey(Customer record);
}