package org.kayura.activiti.repository;

import java.util.List;
import java.util.Map;

import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface IdentityMapper {

	List<User> loadUsers(Map<String, Object> args);

	List<Group> loadGroups(Map<String, Object> args);
}
