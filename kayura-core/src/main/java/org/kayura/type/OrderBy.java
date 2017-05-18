/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.type;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * @author liangxia@live.com
 *
 */
public class OrderBy implements Serializable {
    
    private static final long serialVersionUID = -3402748185352719347L;
    private Direction direction;
    private String property;
    private String orderExpr;
    
    public OrderBy(String property, Direction direction, String orderExpr) {
	this.direction = direction;
	this.property = property;
	this.orderExpr = orderExpr;
    }
    
    public Direction getDirection() {
	return direction;
    }
    
    public String getProperty() {
	return property;
    }
    
    public String getOrderExpr() {
	return orderExpr;
    }
    
    public void setDirection(Direction direction) {
	this.direction = direction;
    }
    
    public void setProperty(String property) {
	this.property = property;
    }
    
    public void setOrderExpr(String orderExpr) {
	this.orderExpr = orderExpr;
    }
    
    private static String INJECTION_REGEX = "[A-Za-z0-9\\_\\-\\+\\.]+";
    
    public static boolean isSQLInjection(String str) {
	return !Pattern.matches(INJECTION_REGEX, str);
    }
    
    @Override
    public String toString() {
	if (isSQLInjection(property)) {
	    throw new IllegalArgumentException("SQLInjection property: " + property);
	}
	if (orderExpr != null && orderExpr.indexOf("?") != -1) {
	    String[] exprs = orderExpr.split("\\?");
	    if (exprs.length == 2) {
		return String.format(orderExpr.replaceAll("\\?", "%s"), property)
			+ (direction == null ? "" : " " + direction.name());
	    }
	    return String.format(orderExpr.replaceAll("\\?", "%s"), property,
		    direction == null ? "" : " " + direction.name());
	}
	return property + (direction == null ? "" : " " + direction.name());
    }
    
    public static List<OrderBy> formString(String orderSegment) {
	return formString(orderSegment, null);
    }
    
    /**
     * @param orderSegment ex: "id.asc,code.desc" or "code.desc"
     */
    public static List<OrderBy> formString(String orderSegment, String orderExpr) {
	if (orderSegment == null || orderSegment.trim().equals("")) {
	    return new ArrayList<OrderBy>(0);
	}
	
	List<OrderBy> results = new ArrayList<OrderBy>();
	String[] orderSegments = orderSegment.trim().split(",");
	for (int i = 0; i < orderSegments.length; i++) {
	    String sortSegment = orderSegments[i];
	    OrderBy order = _formString(sortSegment, orderExpr);
	    if (order != null) {
		results.add(order);
	    }
	}
	return results;
    }
    
    private static OrderBy _formString(String orderSegment, String orderExpr) {
	
	if (orderSegment == null || orderSegment.trim().equals("")
		|| orderSegment.startsWith("null.") || orderSegment.startsWith(".")) {
	    return null;
	}
	
	String[] array = orderSegment.trim().split("\\.");
	if (array.length != 1 && array.length != 2) {
	    throw new IllegalArgumentException(
		    "orderSegment pattern must be {property}.{direction}, input is: "
			    + orderSegment);
	}
	
	return create(array[0], array.length == 2 ? array[1] : "asc", orderExpr);
    }
    
    public static OrderBy create(String property, String direction) {
	return create(property, direction, null);
    }
    
    public static OrderBy create(String property, String direction, String orderExpr) {
	return new OrderBy(property, OrderBy.Direction.fromString(direction), orderExpr);
    }
    
    public static enum Direction {
	ASC, DESC;
	public static Direction fromString(String value) {
	    try {
		return Direction.valueOf(value.toUpperCase(Locale.US));
	    } catch (Exception e) {
		return ASC;
	    }
	}
    }
}