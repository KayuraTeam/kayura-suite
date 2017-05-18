package org.kayura.formbuilder.rest;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.apache.commons.lang.StringUtils;
import org.kayura.activiti.web.rest.BaseActivitiRestResource;
import org.kayura.formbuilder.model.FormData;
import org.kayura.formbuilder.model.MapContent;
import org.kayura.formbuilder.service.FormDataService;
import org.kayura.formbuilder.vo.TodoTaskVo;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Paginator;
import org.kayura.type.Result;
import org.kayura.web.ui.UISupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WorkflowRestResoutce extends BaseActivitiRestResource {

	@Autowired
	private FormDataService formDataService;

	@Autowired
	protected UISupport ui;

	protected void saveOrUpdateForm(HttpServletRequest request, FormData formData) {

		MapContent fields = new MapContent();
		Enumeration<String> parameterNames = request.getParameterNames();
		while (parameterNames.hasMoreElements()) {
			String element = parameterNames.nextElement();
			if (element.startsWith("$F_")) {
				String argName = element.substring(3);
				fields.put(argName, request.getParameter(element));
			}
		}

		if (StringUtils.isEmpty(formData.getTitle())) {
			formData.setTitle(formData.getFormName());
		}

		formData.setContent(fields);
		formDataService.insertFormData(formData);
	}

	@RequestMapping(value = "/form/app/todo", method = RequestMethod.GET, produces = "application/json")
	public Object myAppTodoTasks(HttpServletRequest request, String userId) {

		PageParams pp = ui.getPageParams(request);
		List<TodoTaskVo> todoTasks = new ArrayList<TodoTaskVo>();

		TaskQuery taskQuery = this.taskService.createTaskQuery();
		long taskCount = taskQuery.taskCandidateOrAssigned(userId).count();
		if (taskCount > 0) {
			List<Task> tasks = taskQuery.listPage(pp.getOffset(), pp.getLimit());
			for (Task t : tasks) {
				TodoTaskVo todo = new TodoTaskVo();
				todo.setTaskId(t.getId());
				todo.setTitle(t.getName());
				todo.setDisplayTime(t.getCreateTime());
				todoTasks.add(todo);
			}
		}

		PageList<TodoTaskVo> pageList = new PageList<TodoTaskVo>(todoTasks, new Paginator(taskCount));
		return ui.putData(pageList);
	}

	@RequestMapping(value = "/form/app/approve", method = RequestMethod.GET, produces = "application/json")
	public Object myAppApproveForms(HttpServletRequest request, String userId) {

		/*
		 * PageParams pp = ui.getPageParams(request); List<FormOrderVo>
		 * formOrders = new ArrayList<FormOrderVo>();
		 * 
		 * 
		 * PageList<TodoTaskVo> pageList = new PageList<TodoTaskVo>(formOrders,
		 * new Paginator(taskCount)); return ui.putData(pageList);
		 */

		return null;
	}

	@RequestMapping(value = "/form/{dataId}/get", method = RequestMethod.GET, produces = "application/json")
	public Object selectFormDataById(String dataId) {

		Result<FormData> r = formDataService.selectFormDataById(dataId);
		if (r.isSucceed()) {
			return r.getData();
		}
		return error(r.getMessage());
	}

	@RequestMapping(value = "/form/save", method = RequestMethod.POST)
	public void saveFormData(HttpServletRequest request, FormData formData) {

		saveOrUpdateForm(request, formData);
	}

	@RequestMapping(value = "/form/process/start", method = RequestMethod.POST)
	public void submitAutoForm(HttpServletRequest request, FormData formData, String tenantId) {

		saveOrUpdateForm(request, formData);

		Map<String, Object> variables = new HashMap<String, Object>();
		variables.putAll(formData.getContent());
		variables.put("title", formData.getTitle());

		identityService.setAuthenticatedUserId(formData.getCreator());
		runtimeService.startProcessInstanceByKeyAndTenantId(formData.getProcessKey(), formData.getDataId(), variables,
				tenantId);
	}

	@RequestMapping(value = "/form/task/handler", method = RequestMethod.POST)
	public void handlerTask(String taskId, String userId, String comment, String photos, String files) {

		TaskQuery taskQuery = this.taskService.createTaskQuery();
		Task task = taskQuery.taskId(taskId).singleResult();
		if (task != null) {

			if (StringUtils.isNotEmpty(userId)) {
				this.identityService.setAuthenticatedUserId(userId);
			} else {
				this.identityService.setAuthenticatedUserId(task.getAssignee());
			}

			if (StringUtils.isNotEmpty(photos)) {
				List<String> photoList = Arrays.asList(photos.split(","));
				for (String photoUrl : photoList) {
					this.taskService.createAttachment("photo", task.getId(), task.getProcessInstanceId(), "", "",
							photoUrl);
				}
			}

			if (StringUtils.isNotEmpty(files)) {
				List<String> fileList = Arrays.asList(files.split(","));
				for (String fileUrl : fileList) {
					this.taskService.createAttachment("file", task.getId(), task.getProcessInstanceId(), "", "",
							fileUrl);
				}
			}

			this.taskService.addComment(task.getId(), task.getProcessInstanceId(), comment);
			this.taskService.complete(task.getId());
		}
	}

	@RequestMapping(value = "/form/task/addcomment", method = RequestMethod.POST)
	public void addComment(String userId, String businessKey, String comment, String photos, String files) {

		Task task = this.taskService.createTaskQuery().processInstanceBusinessKey(businessKey).singleResult();
		if (task != null) {

			this.identityService.setAuthenticatedUserId(userId);
			this.taskService.addComment(task.getId(), task.getProcessInstanceId(), comment);

			if (StringUtils.isNotEmpty(photos)) {
				List<String> photoList = Arrays.asList(photos.split(","));
				for (String photoUrl : photoList) {
					this.taskService.createAttachment("photo", task.getId(), task.getProcessInstanceId(), "", "",
							photoUrl);
				}
			}

			if (StringUtils.isNotEmpty(files)) {
				List<String> fileList = Arrays.asList(files.split(","));
				for (String fileUrl : fileList) {
					this.taskService.createAttachment("file", task.getId(), task.getProcessInstanceId(), "", "",
							fileUrl);
				}
			}
		}
	}

}
