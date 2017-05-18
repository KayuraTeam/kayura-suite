package org.kayura.activiti.behavior;

import org.activiti.bpmn.model.UserTask;
import org.activiti.engine.impl.bpmn.parser.factory.DefaultActivityBehaviorFactory;
import org.activiti.engine.impl.task.TaskDefinition;

public class ActivityBehaviorFactoryEx extends DefaultActivityBehaviorFactory {

	public UserTaskActivityBehaviorEx createUserTaskActivityBehavior(UserTask userTask, TaskDefinition taskDefinition) {
		return new UserTaskActivityBehaviorEx(userTask.getId(), taskDefinition);
	}

}
