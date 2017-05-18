/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.service;

import java.util.Date;
import java.util.List;

import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.uasp.po.AutoLogin;
import org.kayura.uasp.po.Identity;
import org.kayura.uasp.po.User;

/**
 * UserService
 * 
 * @author liangxia@live.com
 */
public interface UserService {

	/**
	 * 查询符合条件的用户账号信息.
	 * 
	 * @param keyword 查询关键字.
	 * @param status 用户账号的状态.
	 * @param pageParams 分页信息.
	 * @return 返回已经分页的集合及总记录信息.
	 */
	Result<PageList<User>> findUsers(String tenantId, String keyword, Integer[] status, PageParams pageParams);
	
	/**
	 * 修改用户密码。
	 * 
	 * @param userId 用户主键ID.
	 * @param oldPassword 原密码（加密后）.
	 * @param newPassword 新密码（加密后）.
	 * @return 返回修改结果.
	 */
	GeneralResult changeUserPassword(String userId, String oldPassword, String newPassword);

	/**
	 * 创建一个新用户账号.
	 * 
	 * @param user 用户账号实例对象.
	 */
	GeneralResult createNewUser(User user);
	
	/**
	 * 更新用户基本信息.
	 * 
	 * @param user 用户账号实例对象.
	 * @return
	 */
	GeneralResult updateUserInfo(User user);

	/**
	 * 删除一个用户账号.
	 * 
	 * @param userId 用户账号Id.
	 */
	void deleteUser(String userId);

	/**
	 * @param loginName 有2种值类型：
	 * 		{租户Id}#{用户名}，如： YFS43TF#user1
	 * 		{用户名}，如：user1
	 * @return
	 */
	User getUserByUserName(String loginName);

	/**
	 * @param userId
	 */
	User getUserById(String userId);
	
	/**
	 * 创建一个登录 Token 记录.
	 * 
	 * @param rememberMe
	 */
	void createLoginToken(AutoLogin autoLogin);

	
	/**
	 * 更新一个登录 Token 与 lastUsed 值.
	 * @param seriesId
	 * @param token
	 * @param lastUsed
	 */
	void updateLoginToken(String seriesId, String token, Date lastUsed);
	
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
	 * @param userId 用户Id.
	 */
	void removeLoginTokensByUser(String userId);

	/**
	 * 加载该用户所拥有的权限集合.
	 * 
	 * @param userId
	 * @return
	 */
	List<String> loadPrivileges(String userId);

	/**
	 * 加载该用户的组织身份集合.
	 * @param userId
	 * @return
	 */
	List<Identity> loadIdentities(String userId);
}
