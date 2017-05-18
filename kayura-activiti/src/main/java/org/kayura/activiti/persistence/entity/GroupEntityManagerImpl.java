package org.kayura.activiti.persistence.entity;

import java.util.List;
import java.util.Map;

import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.GroupQuery;
import org.activiti.engine.impl.GroupQueryImpl;
import org.activiti.engine.impl.Page;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.impl.persistence.AbstractManager;
import org.activiti.engine.impl.persistence.entity.GroupEntity;
import org.activiti.engine.impl.persistence.entity.GroupIdentityManager;

public class GroupEntityManagerImpl extends AbstractManager implements GroupIdentityManager {

	public Group createNewGroup(String groupId) {
		throw new RuntimeException("This method is not supported.");
	}

	public void insertGroup(Group group) {
		throw new RuntimeException("This method is not supported.");
	}

	public void updateGroup(Group updatedGroup) {
		throw new RuntimeException("This method is not supported.");
	}

	public void deleteGroup(String groupId) {
		throw new RuntimeException("This method is not supported.");
	}

	public GroupQuery createNewGroupQuery() {
		return new GroupQueryImpl(Context.getProcessEngineConfiguration().getCommandExecutor());
	}

	@SuppressWarnings("unchecked")
	public List<Group> findGroupByQueryCriteria(GroupQueryImpl query, Page page) {
		return getDbSqlSession().selectList("selectGroupByQueryCriteria", query, page);
	}

	public long findGroupCountByQueryCriteria(GroupQueryImpl query) {
		return (Long) getDbSqlSession().selectOne("selectGroupCountByQueryCriteria", query);
	}

	@SuppressWarnings("unchecked")
	public List<Group> findGroupsByUser(String userId) {
		return getDbSqlSession().selectList("selectGroupsByUserId", userId);
	}

	@SuppressWarnings("unchecked")
	public List<Group> findGroupsByNativeQuery(Map<String, Object> parameterMap, int firstResult, int maxResults) {
		return getDbSqlSession().selectListWithRawParameter("selectGroupByNativeQuery", parameterMap, firstResult,
				maxResults);
	}

	public long findGroupCountByNativeQuery(Map<String, Object> parameterMap) {
		return (Long) getDbSqlSession().selectOne("selectGroupCountByNativeQuery", parameterMap);
	}

	@Override
	public boolean isNewGroup(Group group) {
		return ((GroupEntity) group).getRevision() == 0;
	}

}
