package org.kayura.activiti.bpmn.parser.handler;

import java.util.List;

import org.activiti.bpmn.model.UserTask;
import org.activiti.engine.impl.bpmn.parser.BpmnParse;
import org.activiti.engine.impl.bpmn.parser.handler.UserTaskParseHandler;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kayura.activiti.bpmn.handler.ExtendPropertyHandler;
import org.kayura.activiti.editor.json.converter.ExtendPropertyUtils;

public class UserTaskParseExHandler extends UserTaskParseHandler {

	protected final Log logger = LogFactory.getLog(getClass());

	@Override
	protected void executeParse(BpmnParse bpmnParse, UserTask userTask) {
		super.executeParse(bpmnParse, userTask);

		ActivityImpl activity = bpmnParse.getCurrentScope().findActivity(userTask.getId());

		List<ExtendPropertyHandler> extendProperties = ExtendPropertyUtils.parseExtendProperties(bpmnParse, userTask);
		activity.setProperty(ExtendPropertyUtils.PROPERTY_EXTEND_PROPERTIES, extendProperties);

		logger.debug("★ 解析 Activity: " + userTask.getId() + ", 从定义文件中读取 ExtendProperties , 读取到了  " + extendProperties.size() + " 条. ");
	}

}
