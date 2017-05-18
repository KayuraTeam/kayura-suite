package org.kayura.activiti.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.kayura.activiti.repository.IdentityMapper;
import org.kayura.activiti.service.ActivitiService;
import org.kayura.activiti.vo.AssignItemVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ActivitiServiceImpl implements ActivitiService {

	@Autowired(required = false)
	protected IdentityMapper identityMapper;

	public void setIdentityMapper(IdentityMapper identityMapper) {
		this.identityMapper = identityMapper;
	}

	@Override
	public List<AssignItemVo> loadAssignUsersByIds(List<String> ids) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("ids", ids);
		List<User> list = identityMapper.loadUsers(args);

		List<AssignItemVo> items = new ArrayList<AssignItemVo>();
		for (User u : list) {
			items.add(new AssignItemVo(u.getId(), u.getLastName() + "（" + u.getFirstName() + "）", "U"));
		}

		return items;
	}

	@Override
	public List<AssignItemVo> loadAssignGroupsByIds(List<String> ids) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("ids", ids);
		List<Group> list = identityMapper.loadGroups(args);

		List<AssignItemVo> items = new ArrayList<AssignItemVo>();
		for (Group g : list) {
			items.add(new AssignItemVo(g.getId(), g.getName(), g.getType()));
		}

		return items;
	}

	private List<Group> getGroupByUserId(String userId, String groupType) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("userId", userId);
		args.put("groupType", groupType);

		List<Group> list = identityMapper.loadGroups(args);

		return list;
	}

	@Override
	public Group getDepartByUserId(String userId) {

		List<Group> list = getGroupByUserId(userId, "D");
		return !list.isEmpty() ? list.get(0) : null;
	}

	@Override
	public Group getPositionByUserId(String userId) {

		List<Group> list = getGroupByUserId(userId, "P");
		return !list.isEmpty() ? list.get(0) : null;
	}

}
