package org.kayura.activiti.persistence.entity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.Picture;
import org.activiti.engine.identity.User;
import org.activiti.engine.identity.UserQuery;
import org.activiti.engine.impl.Page;
import org.activiti.engine.impl.UserQueryImpl;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.impl.persistence.AbstractManager;
import org.activiti.engine.impl.persistence.entity.IdentityInfoEntity;
import org.activiti.engine.impl.persistence.entity.UserEntity;
import org.activiti.engine.impl.persistence.entity.UserIdentityManager;

public class UserEntityManagerImpl extends AbstractManager implements UserIdentityManager {

	public User createNewUser(String userId) {
		throw new RuntimeException("This method is not supported.");
	}

	public void insertUser(User user) {
		throw new RuntimeException("This method is not supported.");
	}

	public void updateUser(User updatedUser) {
		throw new RuntimeException("This method is not supported.");
	}

	public void deleteUser(String userId) {
		throw new RuntimeException("This method is not supported.");
	}

	public User findUserById(String userId) {
		return (UserEntity) getDbSqlSession().selectOne("selectUserById", userId);
	}

	@SuppressWarnings("unchecked")
	public List<User> findUserByQueryCriteria(UserQueryImpl query, Page page) {
		return getDbSqlSession().selectList("selectUserByQueryCriteria", query, page);
	}

	public long findUserCountByQueryCriteria(UserQueryImpl query) {
		return (Long) getDbSqlSession().selectOne("selectUserCountByQueryCriteria", query);
	}

	@SuppressWarnings("unchecked")
	public List<Group> findGroupsByUser(String userId) {
		return getDbSqlSession().selectList("selectGroupsByUserId", userId);
	}

	public UserQuery createNewUserQuery() {
		return new UserQueryImpl(Context.getProcessEngineConfiguration().getCommandExecutor());
	}

	public IdentityInfoEntity findUserInfoByUserIdAndKey(String userId, String key) {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("userId", userId);
		parameters.put("key", key);
		return (IdentityInfoEntity) getDbSqlSession().selectOne("selectIdentityInfoByUserIdAndKey", parameters);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<String> findUserInfoKeysByUserIdAndType(String userId, String type) {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("userId", userId);
		parameters.put("type", type);
		return (List) getDbSqlSession().getSqlSession().selectList("selectIdentityInfoKeysByUserIdAndType", parameters);
	}

	public Boolean checkPassword(String userId, String password) {
		User user = findUserById(userId);
		if ((user != null) && (password != null) && (password.equals(user.getPassword()))) {
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	public List<User> findPotentialStarterUsers(String proceDefId) {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("procDefId", proceDefId);
		return (List<User>) getDbSqlSession().selectOne("selectUserByQueryCriteria", parameters);

	}

	@SuppressWarnings("unchecked")
	public List<User> findUsersByNativeQuery(Map<String, Object> parameterMap, int firstResult, int maxResults) {
		return getDbSqlSession().selectListWithRawParameter("selectUserByNativeQuery", parameterMap, firstResult,
				maxResults);
	}

	public long findUserCountByNativeQuery(Map<String, Object> parameterMap) {
		return (Long) getDbSqlSession().selectOne("selectUserCountByNativeQuery", parameterMap);
	}

	@Override
	public boolean isNewUser(User user) {
		return ((UserEntity) user).getRevision() == 0;
	}

	@Override
	public Picture getUserPicture(String userId) {
		throw new RuntimeException("This method is not supported.");
	}

	@Override
	public void setUserPicture(String userId, Picture picture) {
		throw new RuntimeException("This method is not supported.");
	}

}
