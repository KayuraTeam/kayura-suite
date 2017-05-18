/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.provider;

/**
 * 用于执行文件存储的执行器.
 * 
 * @author liangxia@live.com
 */
public interface FileUploadProvider {

	String getTempPath();

	String getLogicPath();

	String convertAbsolutePath(String logicPath);
}
