package org.kayura.activiti.persistence;

import org.activiti.engine.impl.interceptor.Session;
import org.activiti.engine.impl.interceptor.SessionFactory;
import org.activiti.engine.impl.persistence.entity.MembershipIdentityManager;
import org.kayura.activiti.persistence.entity.MembershipEntityManagerImpl;

public class MembershipEntityManagerFactory implements SessionFactory {

	public Class<?> getSessionType() {
		return MembershipIdentityManager.class;
	}

	public Session openSession() {
		return new MembershipEntityManagerImpl();
	}

}
