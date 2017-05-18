package org.kayura.activiti.persistence.entity;

import org.activiti.engine.impl.persistence.AbstractManager;
import org.activiti.engine.impl.persistence.entity.MembershipIdentityManager;

public class MembershipEntityManagerImpl extends AbstractManager implements MembershipIdentityManager {

	public void createMembership(String userId, String groupId) {
		throw new RuntimeException("This method is not supported.");
	}

	public void deleteMembership(String userId, String groupId) {
		throw new RuntimeException("This method is not supported.");
	}

}
