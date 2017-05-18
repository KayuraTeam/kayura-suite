/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.models;

import java.io.Serializable;

import org.kayura.utils.StringUtils;

/**
 * @author liangxia@live.com
 */
public class UploadItem implements Serializable {

	private static final long serialVersionUID = 5013405337626162388L;

	private String id;
	private String bizId;
	private String folderId;
	private String category;
	private Integer serial;
	private Boolean allowChange;
	private Boolean isEncrypt;
	private String tags;
	private String lastModifiedDate;

	public UploadItem() {
		this.allowChange = false;
		this.isEncrypt = false;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBizId() {
		return StringUtils.isEmpty(bizId) ? null : this.bizId;
	}

	public void setBizId(String bizId) {
		this.bizId = bizId;
	}

	public String getFolderId() {
		return StringUtils.isEmpty(folderId) ? null : this.folderId;
	}

	public void setFolderId(String folderId) {
		this.folderId = folderId;
	}

	public String getCategory() {
		return StringUtils.isEmpty(category) ? null : this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getSerial() {
		return serial == null ? 0 : this.serial;
	}

	public void setSerial(Integer serial) {
		this.serial = serial;
	}

	public Boolean getAllowChange() {
		return allowChange == null ? false : this.allowChange;
	}

	public void setAllowChange(Boolean allowChange) {
		this.allowChange = allowChange;
	}

	public Boolean getIsEncrypt() {
		return isEncrypt == null ? false : this.isEncrypt;
	}

	public void setIsEncrypt(Boolean isEncrypt) {
		this.isEncrypt = isEncrypt;
	}

	public String getTags() {
		return StringUtils.isEmpty(tags) ? null : this.tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getLastModifiedDate() {
		return StringUtils.isEmpty(lastModifiedDate) ? "" : this.lastModifiedDate;
	}

	public void setLastModifiedDate(String lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

}
