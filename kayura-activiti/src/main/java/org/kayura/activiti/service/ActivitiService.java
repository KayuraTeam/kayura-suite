package org.kayura.activiti.service;

import java.util.List;

import org.activiti.engine.identity.Group;
import org.kayura.activiti.vo.AssignItemVo;

public interface ActivitiService {
	
	List<AssignItemVo> loadAssignUsersByIds(List<String> ids);

	List<AssignItemVo> loadAssignGroupsByIds(List<String> ids);
	
	Group getDepartByUserId(String userId);

	Group getPositionByUserId(String userId);
	
}
