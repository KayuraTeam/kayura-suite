package org.kayura.activiti.editor.rest;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.GroupQuery;
import org.activiti.engine.identity.User;
import org.activiti.engine.identity.UserQuery;
import org.kayura.activiti.expression.AssignmenteExpression;
import org.kayura.activiti.service.ActivitiService;
import org.kayura.activiti.vo.AssignItemVo;
import org.kayura.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class IdentityRestResource {

	protected static final Logger logger = LoggerFactory.getLogger(IdentityRestResource.class);

	@Autowired
	protected ActivitiService activitiService;

	@Autowired
	protected IdentityService identityService;

	@Autowired
	private AssignmenteExpression assignmenteExpr;

	/**
	 * 查询群组列表.
	 * 
	 * @param type
	 *            D 部门, P 岗位, G 群组, R 角色, T 表达式分类, E 表达式.
	 * @param keyword
	 *            过滤名称关键字.
	 */
	@RequestMapping(value = "/group/find", method = RequestMethod.GET, produces = "application/json")
	public List<AssignItemVo> findGroups(String type, String keyword) {

		List<AssignItemVo> voItems = new ArrayList<AssignItemVo>();

		if (type.equals("T")) {

			voItems.add(new AssignItemVo("EXPRESSION", "内部表达式", "T"));
		} else if (type.equals("E")) {

			HashMap<String, String> exprs = assignmenteExpr.getItems();
			for (String key : exprs.keySet()) {
				AssignItemVo assign = new AssignItemVo();
				assign.setValue("${" + key + "}");
				assign.setName(exprs.get(key) + "（" + assign.getValue() + "）");
				assign.setType("T");
				voItems.add(assign);
			}
		} else {

			GroupQuery query = identityService.createGroupQuery().groupType(type);
			if (StringUtils.isNotEmpty(keyword)) {
				query.groupNameLike("%" + keyword + "%");
			}
			List<Group> list = query.list();
			for (Group g : list) {
				voItems.add(new AssignItemVo(g.getId(), g.getName(), g.getType()));
			}
		}

		return voItems;
	}

	/**
	 * 查询用户列表.
	 * 
	 * @param groupId
	 *            群组Id.
	 * @param keyword
	 *            搜索关键字.
	 * @return
	 */
	@RequestMapping(value = "/user/find", method = RequestMethod.GET, produces = "application/json")
	public List<AssignItemVo> findUsers(String groupId, String keyword) {

		List<AssignItemVo> voItems = new ArrayList<AssignItemVo>();

		if (groupId.equals("EXPRESSION")) {

			HashMap<String, String> exprs = assignmenteExpr.getItems();
			for (String key : exprs.keySet()) {
				AssignItemVo assign = new AssignItemVo();
				assign.setValue("${" + key + "}");
				assign.setName(exprs.get(key) + "（" + assign.getValue() + "）");
				assign.setType("T");
				voItems.add(assign);
			}
		} else {

			UserQuery query = identityService.createUserQuery().memberOfGroup(groupId);
			if (StringUtils.isNotEmpty(keyword)) {
				query.userFullNameLike("%" + keyword + "%");
			}
			List<User> list = query.list();
			for (User u : list) {
				voItems.add(new AssignItemVo(u.getId(), u.getLastName() + "（" + u.getFirstName() + "）", "U"));
			}
		}

		return voItems;
	}

	/**
	 * 用于返回指派候选者的显示名与类型.
	 * 
	 * @param ids
	 *            指派者Id集,或为用户/群组/特殊表达式.
	 * @param type
	 *            U 用户; G 群组;
	 */
	@RequestMapping(value = "/assign/find", method = RequestMethod.GET, produces = "application/json")
	public List<AssignItemVo> findAssignItems(String ids, String type) {

		List<String> idArray = Arrays.asList(ids.split(","));

		List<String> exprIds = new ArrayList<String>();
		List<String> idArgs = new ArrayList<String>();
		for (String id : idArray) {
			if (StringUtils.isExpression(id)) {
				exprIds.add(id);
			} else {
				idArgs.add(id);
			}
		}

		List<AssignItemVo> items = new ArrayList<AssignItemVo>();
		if (!idArgs.isEmpty()) {
			if (type.equals("U")) {
				items = activitiService.loadAssignUsersByIds(idArgs);
			} else if (type.equals("G")) {
				items = activitiService.loadAssignGroupsByIds(idArgs);
			}
		}

		for (String id : exprIds) {
			if (assignmenteExpr.exists(id)) {
				items.add(new AssignItemVo(id, assignmenteExpr.get(id) + "（" + id + "）", "T"));
			} else {
				items.add(new AssignItemVo(id, id, "T"));
			}
		}

		return items;
	}

}
