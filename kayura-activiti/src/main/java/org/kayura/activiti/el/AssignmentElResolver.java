package org.kayura.activiti.el;

import java.beans.FeatureDescriptor;
import java.util.Iterator;

import org.activiti.engine.identity.Group;
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.impl.javax.el.ELContext;
import org.activiti.engine.impl.javax.el.ELResolver;
import org.kayura.activiti.service.ActivitiService;
import org.springframework.beans.factory.annotation.Autowired;

public class AssignmentElResolver extends ELResolver {

	@Autowired
	protected ActivitiService activitiService;

	@Override
	public Class<?> getCommonPropertyType(ELContext context, Object base) {
		return Object.class;
	}

	@Override
	public Iterator<FeatureDescriptor> getFeatureDescriptors(ELContext context, Object base) {
		return null;
	}

	@Override
	public Class<?> getType(ELContext context, Object base, Object property) {
		return Object.class;
	}

	@Override
	public Object getValue(ELContext context, Object base, Object property) {

		String userId = Authentication.getAuthenticatedUserId();
		String variable = (String) property;

		if (variable.equals("sameDepartId")) {
			Group group = activitiService.getDepartByUserId(userId);
			if (group != null) {
				context.setPropertyResolved(true);
				return group.getId();
			}
		} else if (variable.equals("samePositionId")) {
			Group group = activitiService.getPositionByUserId(userId);
			if (group != null) {
				context.setPropertyResolved(true);
				return group.getId();
			}
		}

		return null;
	}

	@Override
	public boolean isReadOnly(ELContext context, Object base, Object property) {
		return false;
	}

	@Override
	public void setValue(ELContext context, Object base, Object property, Object value) {

	}

}
