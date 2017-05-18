package org.kayura.activiti.persistence;

import org.kayura.activiti.persistence.entity.UserEntityManagerImpl;

import org.activiti.engine.impl.interceptor.Session;
import org.activiti.engine.impl.interceptor.SessionFactory;
import org.activiti.engine.impl.persistence.entity.UserIdentityManager;

public class UserEntityManagerFactory implements SessionFactory {

	public Class<?> getSessionType() {
		return UserIdentityManager.class;
	}

	public Session openSession() {
		return new UserEntityManagerImpl();
	}

}