/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.PageList;
import org.kayura.uasp.po.AutoLogin;
import org.kayura.uasp.po.User;
import org.springframework.stereotype.Repository;

/**
 * 用户账号的数据库访问接口.
 * 
 * @author liangxia@live.com
 */
@Repository
public interface UserMapper {

	/**
	 * 查询出符合条件的用户分页列表.
	 * 
	 * @param args
	 *            可选参数:
	 *            <p>
	 *            keyword 查询关键字.
	 *            <p>
	 *            authType 权限类型.
	 *            <p>
	 *            status 用户状态.
	 * @param pageBounds
	 *            分页参数信息.
	 * @return 已经分页的结果集.
	 */
	PageList<User> findUsersByMap(Map<String, Object> args, PageBounds pageBounds);

	/**
	 * 检查用户记录是否存在.
	 * 
	 * @param args
	 *            可选参数:
	 *            <p>
	 *            userId 用户Id
	 *            <p>
	 *            userName 用户名.
	 *            <p>
	 *            loginName 登录名,可使用“账号、手机号、邮箱”做为登录名.
	 *            <p>
	 *            password 密码字符串.
	 *            <p>
	 *            status 用户状态.
	 * @return 如果存在返回 true 否则返回 false.
	 */
	Boolean isExistsByMap(Map<String, Object> args);

	/**
	 * 向数据库中插入新用户记录.
	 * 
	 * @param user
	 *            用户对象.
	 */
	void insertUser(User user);

	/**
	 * 更新现在用户记录.
	 * 
	 * @param user
	 *            用户对象.
	 */
	void updateUserInfo(User user);

	/**
	 * @param userId
	 * @param newPassword
	 */
	void changePassword(@Param("id") String id, @Param("password") String newPassword);

	/**
	 * 删除一个用户记录.
	 * 
	 * @param user
	 *            用户对象.
	 */
	void deleteUser(String userId);

	/**
	 * 查询出唯一的用户.
	 * 
	 * @param args
	 *            可选参数:
	 *            <p>
	 *            userId 用户Id
	 *            <p>
	 *            userName 用户名.
	 *            <p>
	 *            loginName 登录名,可使用“账号、手机号、邮箱”做为登录名.
	 *            <p>
	 *            password 密码字符串.
	 *            <p>
	 *            status 用户状态.
	 * @return 如果存在返回 true 否则返回 false.
	 */
	User getUserByMap(Map<String, Object> args);

	/**
	 * 创建一个登录 Token 记录.
	 * 
	 * @param entity
	 */
	void createLoginToken(AutoLogin entity);

	/**
	 * 更新一个登录 Token 与 lastUsed 值.
	 *
	 * @param args
	 *            String seriesId, String token, Date lastUsed
	 */
	void updateLoginToken(Map<String, Object> args);

	/**
	 * 获取登录 Token 数据.
	 * 
	 * @param seriesId
	 * @return
	 */
	AutoLogin getLoginTokenById(String seriesId);

	/**
	 * 删除指定用户下的所有登录信息.
	 * 
	 * @param userId
	 *            用户Id.
	 */
	void removeLoginTokensByUser(String userId);

}
