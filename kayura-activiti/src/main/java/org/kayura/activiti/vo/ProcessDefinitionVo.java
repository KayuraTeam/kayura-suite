package org.kayura.activiti.vo;

import java.io.Serializable;

import org.activiti.engine.repository.ProcessDefinition;

public class ProcessDefinitionVo implements ProcessDefinition, Serializable {

	private static final long serialVersionUID = -6297841702766708989L;

	private String id;
	private String category;
	private String name;
	private String key;
	private String description;
	private int version;
	private String resourceName;
	private String deploymentId;
	private String diagramResourceName;
	private boolean hasStartFormKey;
	private boolean hasGraphicalNotation;
	private boolean suspended;
	private String tenantId;

	public ProcessDefinitionVo(ProcessDefinition o) {
		this.id = o.getId();
		this.category = o.getCategory();
		this.name = o.getName();
		this.key = o.getKey();
		this.description = o.getDescription();
		this.version = o.getVersion();
		this.resourceName = o.getResourceName();
		this.deploymentId = o.getDeploymentId();
		this.diagramResourceName = o.getDiagramResourceName();
		this.hasStartFormKey = o.hasStartFormKey();
		this.hasGraphicalNotation = o.hasGraphicalNotation();
		this.suspended = o.isSuspended();
		this.tenantId = o.getTenantId();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public String getDeploymentId() {
		return deploymentId;
	}

	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
	}

	public String getDiagramResourceName() {
		return diagramResourceName;
	}

	public void setDiagramResourceName(String diagramResourceName) {
		this.diagramResourceName = diagramResourceName;
	}

	@Override
	public boolean hasStartFormKey() {
		return this.hasStartFormKey;
	}

	public void setStartFormKey(boolean hasStartFormKey) {
		this.hasStartFormKey = hasStartFormKey;
	}

	@Override
	public boolean hasGraphicalNotation() {
		return this.hasGraphicalNotation;
	}

	public void setGraphicalNotation(boolean hasGraphicalNotation) {
		this.hasGraphicalNotation = hasGraphicalNotation;
	}

	public boolean isSuspended() {
		return suspended;
	}

	public void setSuspended(boolean suspended) {
		this.suspended = suspended;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

}
