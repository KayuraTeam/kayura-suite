/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.example.dao;

import org.kayura.example.po.Shipper;
import org.springframework.stereotype.Repository;

@Repository
public interface ShipperMapper {
	
    int deleteByKey(Integer id);

    int insert(Shipper record);

    int insertSelective(Shipper record);

    Shipper selectByKey(Integer id);

    int updateBySelective(Shipper record);

    int updateByKey(Shipper record);
}