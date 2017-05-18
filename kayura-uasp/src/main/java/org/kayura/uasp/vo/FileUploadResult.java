/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.vo;

/**
 * @author liangxia@live.com
 */
public class FileUploadResult {

	private String frId;
	private String fileId;
	private Boolean newFile;

	public String getFrId() {
		return frId;
	}

	public void setFrId(String frId) {
		this.frId = frId;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public Boolean getNewFile() {
		return newFile;
	}

	public void setNewFile(Boolean newFile) {
		this.newFile = newFile;
	}

}
