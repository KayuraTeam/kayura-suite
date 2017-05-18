/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.vo;

import java.util.Date;

import org.kayura.serializer.DateTimeJsonSerializer;
import org.kayura.serializer.FileSizeJsonSerializer;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * @author liangxia@live.com
 */
public class FileListItem {

	private String rawId;
	private String frId;
	private String fileName;
	private long fileSize;
	private String postfix;
	private String uploaderId;
	private String uploaderName;
	private Date uploadTime;
	private Boolean isBiz;
	private Boolean isUploader;
	private Integer downloads;
	private Boolean allowChange;
	private Boolean isEncrypted;

	public String getRawId() {
		return rawId;
	}

	public void setRawId(String rawId) {
		this.rawId = rawId;
	}

	public String getFrId() {
		return frId;
	}

	public void setFrId(String frId) {
		this.frId = frId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@JsonSerialize(using = FileSizeJsonSerializer.class)
	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getPostfix() {
		return postfix;
	}

	public void setPostfix(String postfix) {
		this.postfix = postfix;
	}

	public String getUploaderId() {
		return uploaderId;
	}

	public void setUploaderId(String uploaderId) {
		this.uploaderId = uploaderId;
	}

	public String getUploaderName() {
		return uploaderName;
	}

	public void setUploaderName(String uploaderName) {
		this.uploaderName = uploaderName;
	}

	@JsonSerialize(using = DateTimeJsonSerializer.class)
	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	/**
	 * @return the isBiz
	 */
	public Boolean getIsBiz() {
		return isBiz;
	}

	/**
	 * @param isBiz the isBiz to set
	 */
	public void setIsBiz(Boolean isBiz) {
		this.isBiz = isBiz;
	}

	/**
	 * @return the isUploader
	 */
	public Boolean getIsUploader() {
		return isUploader;
	}

	/**
	 * @param isUploader the isUploader to set
	 */
	public void setIsUploader(Boolean isUploader) {
		this.isUploader = isUploader;
	}

	public Integer getDownloads() {
		return downloads;
	}

	public void setDownloads(Integer downloads) {
		this.downloads = downloads;
	}

	public Boolean getAllowChange() {
		return allowChange;
	}

	public void setAllowChange(Boolean allowChange) {
		this.allowChange = allowChange;
	}

	public Boolean getIsEncrypted() {
		return isEncrypted;
	}

	public void setIsEncrypted(Boolean isEncrypted) {
		this.isEncrypted = isEncrypted;
	}

}
