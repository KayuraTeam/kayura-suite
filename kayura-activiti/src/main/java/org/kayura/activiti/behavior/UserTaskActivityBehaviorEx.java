package org.kayura.activiti.behavior;

import org.activiti.engine.impl.bpmn.behavior.UserTaskActivityBehavior;
import org.activiti.engine.impl.pvm.delegate.ActivityExecution;
import org.activiti.engine.impl.task.TaskDefinition;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.fasterxml.jackson.databind.ObjectMapper;

public class UserTaskActivityBehaviorEx extends UserTaskActivityBehavior {

	protected final Log logger = LogFactory.getLog(getClass());
	protected final ObjectMapper objectMapper = new ObjectMapper();

	private static final long serialVersionUID = 1L;

	public UserTaskActivityBehaviorEx(String userTaskId, TaskDefinition taskDefinition) {
		super(userTaskId, taskDefinition);
	}

	@Override
	public void execute(ActivityExecution execution) throws Exception {
		super.execute(execution);

/*		StringBuilder sb = new StringBuilder();

		Object extAttrs = execution.getActivity().getProperty(ExtendPropertyUtils.PROPERTY_EXTEND_PROPERTIES);
		sb.append("★ 正在读取 ExtendProperties -> ");
		if (extAttrs != null) {
			
			sb.append("属性值： [");
			List<ExtendPropertyHandler> extendProperties = (List<ExtendPropertyHandler>) extAttrs;
			for (ExtendPropertyHandler eph : extendProperties) {
				ExtendProperty ep = eph.createExtendProperty(execution);

				sb.append(objectMapper.writeValueAsString(ep));
			}
			sb.append("[");
		} else {
			sb.append("未读取到.");
		}

		logger.debug(sb.toString());*/
	}
}
