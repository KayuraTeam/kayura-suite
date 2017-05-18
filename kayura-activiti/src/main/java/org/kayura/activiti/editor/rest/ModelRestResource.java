package org.kayura.activiti.editor.rest;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamReader;

import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.ActivitiException;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ModelQuery;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.explorer.util.XmlUtil;
import org.kayura.activiti.editor.json.converter.BpmnJsonExConverter;
import org.kayura.activiti.vo.BpmModelVo;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Paginator;
import org.kayura.utils.StringUtils;
import org.kayura.web.ui.UISupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

@RestController
public class ModelRestResource {

	protected static final Logger logger = LoggerFactory.getLogger(BizFormRestResource.class);

	@Autowired
	protected RepositoryService repositoryService;

	@Autowired
	protected UISupport ui;

	@Autowired
	protected ObjectMapper objectMapper;

	/**
	 * 查询工作流定义列表.
	 * 
	 * @param type
	 *            流程定义类型:0 设计流程;1 运行流程;2 中止流程.
	 * @param tenantId
	 *            所属程户Id.
	 * @param key
	 *            流程Key编号.
	 * @param keyword
	 *            搜索关键字.
	 * @return
	 */
	@RequestMapping(value = "/model/find", method = RequestMethod.GET, produces = "application/json")
	public Map<String, Object> findModelList(HttpServletRequest request, Integer type, String tenantId, String key,
			String keyword) {

		PageList<BpmModelVo> pageList = null;
		PageParams pp = ui.getPageParams(request);

		if (type != null && type == 0) {

			ModelQuery query = repositoryService.createModelQuery();

			if (StringUtils.isNotEmpty(tenantId)) {
				query.modelTenantId(tenantId);
			}

			if (StringUtils.isNotEmpty(key)) {
				query.modelKey(key.toLowerCase());
			}

			long size = query.count();
			List<Model> list = query.listPage(pp.getOffset(), pp.getLimit());
			pageList = new PageList<BpmModelVo>(BpmModelVo.fromModels(list), new Paginator(size));

		} else if (type != null && (type == 1 || type == 2)) {

			ProcessDefinitionQuery query = repositoryService.createProcessDefinitionQuery();

			if (StringUtils.isNotEmpty(tenantId)) {
				query.processDefinitionTenantId(tenantId);
			}

			if (StringUtils.isNotEmpty(key)) {
				query.processDefinitionKey(key.toLowerCase());
			}

			if (type == 1) {
				query.active();
			} else {
				query.suspended();
			}

			long size = query.count();
			List<ProcessDefinition> list = query.orderByProcessDefinitionVersion().desc().listPage(pp.getOffset(),
					pp.getLimit());
			pageList = new PageList<BpmModelVo>(BpmModelVo.fromDefinitions(list), new Paginator(size));
		} else {

			pageList = new PageList<BpmModelVo>(new ArrayList<BpmModelVo>(), new Paginator(0));
		}

		return ui.putData(pageList);
	}

	/**
	 * 删除一个现有的流程定义.
	 * 
	 * @param type
	 *            流程定义类型: 0 设计流程;1 运行流程;2 中止流程;
	 * @param modelId
	 *            流程模型Id.
	 */
	@RequestMapping(value = "/model/{modelId}/{type}/remove", method = RequestMethod.DELETE)
	public void deleteModel(@PathVariable Integer type, @PathVariable String modelId) {

		if (type == 0) {
			repositoryService.deleteModel(modelId);
		} else if (type == 1 || type == 2) {
			repositoryService.deleteDeployment(modelId, true);
		}
	}

	/**
	 * 将一个设计中的流程定义发布为运行时流程.
	 * 
	 * @param modelId
	 *            流程模型Id.
	 */
	@RequestMapping(value = "/model/{modelId}/deploy", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public void deployProcess(@PathVariable String modelId, String category) {

		try {
			Model modelNode = repositoryService.getModel(modelId);

			byte[] extra = repositoryService.getModelEditorSourceExtra(modelId);
			ByteArrayInputStream extraSteam = new ByteArrayInputStream(extra);

			byte[] modelEditorSource = repositoryService.getModelEditorSource(modelId);
			JsonNode jsonNode = new ObjectMapper().readTree(modelEditorSource);
			BpmnModel bpmnModel = new BpmnJsonExConverter().convertToBpmnModel(jsonNode);

			String processName = modelNode.getName() + ".bpmn20.xml";
			String pngName = modelNode.getName() + ".png";

			repositoryService.createDeployment().name(modelNode.getName()).category(category)
					.tenantId(modelNode.getTenantId()).addInputStream(pngName, extraSteam)
					.addBpmnModel(processName, bpmnModel).deploy();

		} catch (Exception e) {
			logger.error("Error Deploy Model", e);
			throw new ActivitiException("Error Deploy Model", e);
		}
	}

	@RequestMapping(value = "/model/import", method = RequestMethod.POST)
	public void importModel(String key, String tenantId, MultipartFile file) {

		try {

			String fileName = file.getOriginalFilename();
			if (fileName.endsWith(".bpmn20.xml") || fileName.endsWith(".bpmn")) {

				XMLInputFactory xif = XmlUtil.createSafeXmlInputFactory();
				InputStreamReader in = new InputStreamReader(new ByteArrayInputStream(file.getBytes()), "UTF-8");
				XMLStreamReader xtr = xif.createXMLStreamReader(in);
				BpmnModel bpmnModel = new BpmnXMLConverter().convertToBpmnModel(xtr);

				if (bpmnModel.getMainProcess() != null && bpmnModel.getMainProcess().getId() != null) {

					if (!bpmnModel.getLocationMap().isEmpty()) {

						String processName = bpmnModel.getMainProcess().getName();
						if (StringUtils.isEmpty(processName)) {
							processName = bpmnModel.getMainProcess().getId();
						}

						Model model = repositoryService.newModel();
						ObjectNode metaInfo = new ObjectMapper().createObjectNode();
						metaInfo.put("name", processName);
						metaInfo.put("revision", 1);

						model.setMetaInfo(metaInfo.toString());
						model.setName(processName);
						if (StringUtils.isNotEmpty(tenantId)) {
							model.setTenantId(tenantId);
						}
						model.setKey(key);

						repositoryService.saveModel(model);

						ObjectNode editorNode = new BpmnJsonExConverter().convertToJson(bpmnModel);
						repositoryService.addModelEditorSource(model.getId(), editorNode.toString().getBytes("UTF-8"));
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error Import Model", e);
			throw new ActivitiException("Error Import Model", e);
		}
	}

	@RequestMapping(value = "/model/create", method = RequestMethod.POST)
	public void saveNewModel(Map<String, Object> map, String tenantId, String key, String name, String desc) {

		try {
			// "properties":{"process_id":"appleave","name":"璇峰亣鍗曞鎵?
			ObjectNode editorNode = objectMapper.createObjectNode();
			editorNode.put("id", "canvas");
			editorNode.put("resourceId", "canvas");

			ObjectNode properties = objectMapper.createObjectNode();
			properties.put("process_id", key);
			properties.put("name", name);
			editorNode.set("properties", properties);

			ObjectNode stencilSetNode = objectMapper.createObjectNode();
			stencilSetNode.put("namespace", "http://b3mn.org/stencilset/bpmn2.0#");
			editorNode.set("stencilset", stencilSetNode);

			Model model = repositoryService.newModel();

			ObjectNode metaInfo = new ObjectMapper().createObjectNode();
			metaInfo.put("name", name);
			metaInfo.put("revision", 1);
			metaInfo.put("description", desc);
			model.setMetaInfo(metaInfo.toString());

			model.setName(name);
			if (StringUtils.isNotEmpty(tenantId)) {
				model.setTenantId(tenantId);
			}
			model.setKey(key);

			repositoryService.saveModel(model);
			repositoryService.addModelEditorSource(model.getId(), editorNode.toString().getBytes("UTF-8"));

		} catch (Exception e) {
			logger.error("Error Save New Model", e);
			throw new ActivitiException("Error Save New Model", e);
		}
	}

	@RequestMapping(value = "/model/{modelId}/res", method = RequestMethod.GET)
	public void viewModel(HttpServletResponse response, @PathVariable String modelId, Integer status, Integer type) {

		try {
			if (status == 1 || status == 2) {

				ProcessDefinition pd = repositoryService.createProcessDefinitionQuery().processDefinitionId(modelId)
						.singleResult();
				String resName = pd.getResourceName();
				if (type == 2) {
					resName = pd.getDiagramResourceName();
				}
				InputStream stream = repositoryService.getResourceAsStream(pd.getDeploymentId(), resName);

				byte[] buffer = new byte[4096];
				int bytesRead = -1;
				while ((bytesRead = stream.read(buffer)) != -1) {
					response.getOutputStream().write(buffer, 0, bytesRead);
				}
			} else if (status == 0) {

				Model model = repositoryService.getModel(modelId);
				byte[] buffer = null;
				if (model.hasEditorSource() && type == 1) {
					JsonNode jsonNode = new ObjectMapper().readTree(repositoryService.getModelEditorSource(modelId));
					BpmnModel bpmnModel = new BpmnJsonExConverter().convertToBpmnModel(jsonNode);
					BpmnXMLConverter bpmnXMLConverter = new BpmnXMLConverter();
					buffer = bpmnXMLConverter.convertToXML(bpmnModel);
				} else if (model.hasEditorSourceExtra() && type == 2) {
					buffer = repositoryService.getModelEditorSourceExtra(modelId);
				}
				if (buffer != null) {
					response.getOutputStream().write(buffer);
				}
			}
		} catch (Exception e) {
			logger.error("显示资源内容时发生异常。", e);
		}
	}
}