package org.kayura.activiti.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ProcessDefinition;

public class BpmModelVo implements Serializable {

	private static final long serialVersionUID = 6198003040213204103L;

	private String id;
	private String name;
	private String description;
	private String key;
	private String category;
	private Date updateTime;
	private Integer version;
	private String deploymentId;
	private String resourceName;
	private String diagramResourceName;

	public static List<BpmModelVo> fromModels(List<Model> models) {

		List<BpmModelVo> volist = new ArrayList<BpmModelVo>();
		for (Model m : models) {
			volist.add(new BpmModelVo(m));
		}
		return volist;
	}

	public static List<BpmModelVo> fromDefinitions(List<ProcessDefinition> definitions) {

		List<BpmModelVo> volist = new ArrayList<BpmModelVo>();
		for (ProcessDefinition m : definitions) {
			volist.add(new BpmModelVo(m));
		}
		return volist;
	}

	public BpmModelVo(ProcessDefinition o) {
		this.id = o.getId();
		this.category = o.getCategory();
		this.name = o.getName();
		this.key = o.getKey();
		this.description = o.getDescription();
		this.version = o.getVersion();
		this.deploymentId = o.getDeploymentId();
		this.resourceName = o.getResourceName();
		this.diagramResourceName = o.getDiagramResourceName();
	}

	public BpmModelVo(Model o) {
		this.id = o.getId();
		this.category = o.getCategory();
		this.name = o.getName();
		this.key = o.getKey();
		this.version = o.getVersion();
		this.updateTime = o.getLastUpdateTime();
		this.deploymentId = o.getDeploymentId();
		this.resourceName = "";
		this.diagramResourceName = "";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public String getDeploymentId() {
		return deploymentId;
	}

	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public String getDiagramResourceName() {
		return diagramResourceName;
	}

	public void setDiagramResourceName(String diagramResourceName) {
		this.diagramResourceName = diagramResourceName;
	}

}
