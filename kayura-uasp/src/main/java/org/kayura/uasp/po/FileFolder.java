/**
 * Copyright 2015-2015 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.po;

import org.kayura.utils.StringUtils;

/**
 * FileFolder
 *
 * @author liangxia@live.com
 */
public class FileFolder {

	public static final String SYSFOLDER = "SYSFOLDER";
	public static final String MYFOLDER = "MYFOLDER";
	public static final String NOTCLASSIFIED = "NOTCLASSIFIED";
	public static final String MYGROUP = "MYGROUP";
	public static final String GROUPITEM = "GROUPITEM";
	public static final String MYSHARE = "MYSHARE";
	public static final String SHARER = "SHARER";

	private String folderId;
	private String tenantId;
	private String parentId;
	private String parentName;
	private String creatorId;
	private String groupId;
	private String groupName;
	private String name;
	private Boolean hidden;

	public String getFolderId() {
		return folderId;
	}

	public void setFolderId(String folderId) {
		this.folderId = folderId;
	}

	public String getTenantId() {
		return StringUtils.emptyToNull(this.tenantId);
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getParentId() {
		return StringUtils.emptyToNull(this.parentId);
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(String creatorId) {
		this.creatorId = creatorId;
	}

	public String getGroupId() {
		return StringUtils.emptyToNull(this.groupId);
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	/**
	 * @return the groupName
	 */
	public String getGroupName() {
		return groupName;
	}

	/**
	 * @param groupName the groupName to set
	 */
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getHidden() {
		return hidden == null ? false : this.hidden;
	}

	public void setHidden(Boolean hidden) {
		this.hidden = hidden;
	}

}
