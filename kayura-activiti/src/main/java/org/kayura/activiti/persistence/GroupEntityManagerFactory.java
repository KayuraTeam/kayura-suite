package org.kayura.activiti.persistence;

import org.activiti.engine.impl.interceptor.Session;
import org.activiti.engine.impl.interceptor.SessionFactory;
import org.activiti.engine.impl.persistence.entity.GroupIdentityManager;
import org.kayura.activiti.persistence.entity.GroupEntityManagerImpl;

public class GroupEntityManagerFactory implements SessionFactory {

	public Class<?> getSessionType() {
		return GroupIdentityManager.class;
	}

	public Session openSession() {
		return new GroupEntityManagerImpl();
	}

}