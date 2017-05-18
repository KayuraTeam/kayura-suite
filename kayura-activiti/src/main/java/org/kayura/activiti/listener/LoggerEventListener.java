package org.kayura.activiti.listener;

import java.util.List;
import java.util.Map;

import org.activiti.engine.delegate.event.ActivitiActivityEvent;
import org.activiti.engine.delegate.event.ActivitiEntityEvent;
import org.activiti.engine.delegate.event.ActivitiEntityWithVariablesEvent;
import org.activiti.engine.delegate.event.ActivitiEvent;
import org.activiti.engine.delegate.event.ActivitiEventListener;
import org.activiti.engine.delegate.event.ActivitiVariableEvent;
import org.activiti.engine.impl.persistence.entity.ExecutionEntity;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kayura.activiti.bpmn.handler.ExtendPropertyHandler;
import org.kayura.activiti.bpmn.model.ExtendProperty;
import org.kayura.activiti.editor.json.converter.ExtendPropertyUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class LoggerEventListener implements ActivitiEventListener {

	protected final Log logger = LogFactory.getLog(getClass());
	protected final ObjectMapper objectMapper = new ObjectMapper();

	@SuppressWarnings("unchecked")
	@Override
	public void onEvent(ActivitiEvent event) {

		logger.debug("");
		logger.debug("====>> starting eventListener <<====");
		logger.debug("  Event Type: " + event.getType());
		logger.debug("  Args Type: " + event.getClass().getName());
		logger.debug("  ExecutionId: " + event.getExecutionId());
		logger.debug("  ProcessInstanceId: " + event.getProcessInstanceId());
		logger.debug("  ProcessDefinitionId: " + event.getProcessDefinitionId());

		if (event instanceof ActivitiEntityEvent) {

			ActivitiEntityEvent e = (ActivitiEntityEvent) event;
			if (e.getEntity() != null) {
				logger.debug("■ Entity Type: " + e.getEntity().getClass());
				
				if (e.getEntity() instanceof ExecutionEntity) {
					
					ExecutionEntity execution = (ExecutionEntity) e.getEntity();
					try {
						if(execution != null){
							logger.debug("■ Execution Variables: " + objectMapper.writeValueAsString(execution.getVariables()));

							Object extAttrs = execution.getActivity().getProperty(ExtendPropertyUtils.PROPERTY_EXTEND_PROPERTIES);
							if(extAttrs != null){
								logger.debug("■ extendProperties: ");
								List<ExtendPropertyHandler> extendProperties = (List<ExtendPropertyHandler>) extAttrs;
								for (ExtendPropertyHandler eph : extendProperties) {
									ExtendProperty ep = eph.createExtendProperty(execution);
									logger.debug("■      " + objectMapper.writeValueAsString(ep));
								}
							}
						}
					} catch (JsonProcessingException e1) {
						e1.printStackTrace();
					}
					
				} else if (e.getEntity() instanceof TaskEntity) {
					TaskEntity task = (TaskEntity) e.getEntity();
					logger.debug("■ TaskName: " + task.getName());
					ExecutionEntity execution = task.getExecution();
					try {
						if(execution != null){
							logger.debug("■ Execution Variables: " + objectMapper.writeValueAsString(execution.getVariables()));

							Object extAttrs = execution.getActivity().getProperty(ExtendPropertyUtils.PROPERTY_EXTEND_PROPERTIES);
							if(extAttrs != null){
								logger.debug("■ extendProperties: ");
								List<ExtendPropertyHandler> extendProperties = (List<ExtendPropertyHandler>) extAttrs;
								for (ExtendPropertyHandler eph : extendProperties) {
									ExtendProperty ep = eph.createExtendProperty(execution);
									logger.debug("■      " + objectMapper.writeValueAsString(ep));
								}
							}
						}
						logger.debug("■ Process Variables: " + objectMapper.writeValueAsString(task.getProcessVariables()));
						logger.debug("■ Task Variables: " + objectMapper.writeValueAsString(task.getVariables()));
					} catch (JsonProcessingException e1) {
						e1.printStackTrace();
					}
				}
			} else {
				logger.debug("■ Entity: null");
			}
		}

		if (event instanceof ActivitiVariableEvent) {

			ActivitiVariableEvent e = (ActivitiVariableEvent) event;
			logger.debug("■ VariableName: " + e.getVariableName());
			logger.debug("■ VariableType: " + e.getVariableType());
			logger.debug("■ VariableValue: " + e.getVariableValue());
			logger.debug("■ TaskId: " + e.getTaskId());
		}

		if (event instanceof ActivitiActivityEvent) {

			ActivitiActivityEvent e = (ActivitiActivityEvent) event;
			logger.debug("■ ActivityId: " + e.getActivityId());
			logger.debug("■ ActivityName: " + e.getActivityName());
			logger.debug("■ ActivityType: " + e.getActivityType());
			logger.debug("■ BehaviorClass: " + e.getBehaviorClass());
		}

		if (event instanceof ActivitiEntityWithVariablesEvent) {

			ActivitiEntityWithVariablesEvent e = (ActivitiEntityWithVariablesEvent) event;
			StringBuilder sb = new StringBuilder();
			Map<?, ?> map = e.getVariables();
			if (map != null) {
				sb.append("■ Variables: ");
				try {
					sb.append(objectMapper.writeValueAsString(map));
				} catch (JsonProcessingException e1) {
					e1.printStackTrace();
				}
			}
			logger.debug(sb.toString());
		}
		logger.debug("====>> eventListener finished <<====");
		logger.debug("");
	}

	@Override
	public boolean isFailOnException() {
		return false;
	}

}
