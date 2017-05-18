package org.kayura.activiti.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.activiti.engine.task.Task;
import org.kayura.serializer.DateTimeJsonSerializer;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class TaskVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	private String name;
	private String title;
	private int priority;
	private String owner;
	private String assignee;
	private String processInstanceId;
	private String businessKey;
	private String executionId;
	private String processDefinitionId;
	private Date createTime;
	private String taskDefinitionKey;
	private Date dueDate;
	private String category;
	private String parentTaskId;
	private String tenantId;
	private String formKey;
	private Map<String, Object> variables;
	private boolean suspended;

	public static List<TaskVo> fromTasks(List<Task> tasks) {

		List<TaskVo> volist = new ArrayList<TaskVo>();
		for (Task t : tasks) {
			volist.add(new TaskVo(t));
		}
		return volist;
	}

	public TaskVo() {

	}

	public TaskVo(Task task) {
		this.id = task.getId();
		this.name = task.getName();
		this.title = task.getDescription();
		this.priority = task.getPriority();
		this.owner = task.getOwner();
		this.assignee = task.getAssignee();
		this.processInstanceId = task.getProcessInstanceId();
		this.executionId = task.getExecutionId();
		this.processDefinitionId = task.getProcessDefinitionId();
		this.createTime = task.getCreateTime();
		this.taskDefinitionKey = task.getTaskDefinitionKey();
		this.dueDate = task.getDueDate();
		this.category = task.getCategory();
		this.parentTaskId = task.getParentTaskId();
		this.tenantId = task.getTenantId();
		this.formKey = task.getFormKey();
		this.suspended = task.isSuspended();
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public int getPriority() {
		return priority;
	}

	public String getOwner() {
		return owner;
	}

	public String getAssignee() {
		return assignee;
	}

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public String getExecutionId() {
		return executionId;
	}

	public String getProcessDefinitionId() {
		return processDefinitionId;
	}

	@JsonSerialize(using = DateTimeJsonSerializer.class)
	public Date getCreateTime() {
		return createTime;
	}

	public String getTaskDefinitionKey() {
		return taskDefinitionKey;
	}

	@JsonSerialize(using = DateTimeJsonSerializer.class)
	public Date getDueDate() {
		return dueDate;
	}

	public String getCategory() {
		return category;
	}

	public String getParentTaskId() {
		return parentTaskId;
	}

	public String getTenantId() {
		return tenantId;
	}

	public String getFormKey() {
		return formKey;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void delegate(String userId) {
	}

	public void setParentTaskId(String parentTaskId) {
		this.parentTaskId = parentTaskId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public void setFormKey(String formKey) {
		this.formKey = formKey;
	}

	public boolean isSuspended() {
		return suspended;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Map<String, Object> getVariables() {
		return variables;
	}

	public void setVariables(Map<String, Object> variables) {
		this.variables = variables;
	}

	public String getBusinessKey() {
		return businessKey;
	}

	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}

}
