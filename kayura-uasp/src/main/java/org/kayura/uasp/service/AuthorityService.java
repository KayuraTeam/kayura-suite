/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.service;

import java.util.List;

import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.uasp.po.Group;
import org.kayura.uasp.po.MenuItem;
import org.kayura.uasp.po.MenuScheme;
import org.kayura.uasp.po.Module;
import org.kayura.uasp.po.Role;

/**
 * @author liangxia@live.com
 */
public interface AuthorityService {

	// 权限交互接口.

	/**
	 * 获取用户拥有权限的菜单方案及菜单项.
	 * 
	 * @param userId
	 * @return
	 */
	Result<List<MenuScheme>> getUserMenus(String userId);

	// 菜单方案（MenuScheme）.

	/**
	 * 获取菜单方案维护列表.
	 * 
	 * @param tenantId 所属租户Id.
	 * @param args 查询参数. keyword.
	 * @param pageParams 分页参数.
	 * @return 返回分页的菜单方案集合.
	 */
	Result<PageList<MenuScheme>> findMenuSchemes(String tenantId, String keyword, PageParams pageParams);

	Result<MenuScheme> getMenuSchemeById(String menuSchemeId);

	GeneralResult createMenuScheme(MenuScheme menuScheme);

	GeneralResult updateMenuScheme(MenuScheme menuScheme);

	GeneralResult removeMenuScheme(String menuSchemeId);

	GeneralResult removeMenuSchemes(List<String> menuSchemeIds);

	// 菜单项（MenuItem）.

	Result<PageList<MenuItem>> findMenuItems(String tenantId, String parentId, String keyword, PageParams pageParams);

	Result<MenuItem> getMenuItemById(String menuItemId);

	GeneralResult createMenuItem(MenuItem menuItem);

	GeneralResult updateMenuItem(MenuItem menuItem);

	GeneralResult removeMenuItem(String menuItemId);

	GeneralResult removeMenuItems(List<String> menuItemIds);

	// 功能模块（Module）.

	Result<PageList<Module>> findModules(String parentId, String keyword, PageParams pageParams);

	Result<Module> getModuleById(String moduleId);

	GeneralResult createModule(Module module);

	GeneralResult updateModule(Module module);

	GeneralResult removeModule(String moduleId);

	GeneralResult removeModules(List<String> moduleIds);

	// 角色（Role）.

	Result<PageList<Role>> findRoles(String tenantId, String keyword, PageParams pageParams);

	Result<Role> getRoleById(String roleId);

	GeneralResult createRole(Role role);

	GeneralResult updateRole(Role role);

	GeneralResult removeRole(String roleId);

	GeneralResult removeRoles(List<String> roleIds);

	// 角色模块（RoleModule）.

	GeneralResult addRoleModule(String roleId, String moduleId, List<String> actions);

	GeneralResult removeRoleModule(String roleId, String moduleId);

	// 组（Group）.

	Result<PageList<Group>> findGroups(String tenantId, String keyword, PageParams pageParams);

	Result<Group> getGroupById(String groupId);

	GeneralResult createGroup(Group group);

	GeneralResult updateGroup(Group group);

	GeneralResult removeGroup(String groupId);

	GeneralResult removeGroups(List<String> groupIds);

	// 组角色（GroupRole）.

	GeneralResult addGroupRole(String groupId, String roleId);

	GeneralResult removeGroupRole(String groupId, String roleId);

	// 用户组（UserGroup）

	GeneralResult addUserGroup(String userId, String groupId);

	GeneralResult removeUserGroup(String userId, String groupId);

	// 用户角色（UserRole）

	GeneralResult addUserRole(String userId, String roleId);

	GeneralResult removeUserRole(String userId, String roleId);

	// 其它.

	Result<List<Role>> findUserRoles(String userId);

	Result<List<Group>> findUserGroups(String userId);

}
