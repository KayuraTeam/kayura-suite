package org.kayura.activiti.bpmn.parser.handler;

import java.util.List;

import org.activiti.bpmn.model.StartEvent;
import org.activiti.engine.impl.bpmn.parser.BpmnParse;
import org.activiti.engine.impl.bpmn.parser.handler.StartEventParseHandler;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kayura.activiti.bpmn.handler.ExtendPropertyHandler;
import org.kayura.activiti.editor.json.converter.ExtendPropertyUtils;

public class StartEventParseExHandler extends StartEventParseHandler {

	protected final Log logger = LogFactory.getLog(getClass());

	  @Override
	  protected void executeParse(BpmnParse bpmnParse, StartEvent startEvent) {
		super.executeParse(bpmnParse, startEvent);

		ActivityImpl activity = bpmnParse.getCurrentScope().findActivity(startEvent.getId());

		List<ExtendPropertyHandler> extendProperties = ExtendPropertyUtils.parseExtendProperties(bpmnParse, startEvent);
		activity.setProperty(ExtendPropertyUtils.PROPERTY_EXTEND_PROPERTIES, extendProperties);

		logger.debug("★ 解析 Activity: " + startEvent.getId() + ", 从定义文件中读取 ExtendProperties , 读取到了  " + extendProperties.size() + " 条. ");
	}
	
}
