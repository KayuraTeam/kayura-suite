package org.kayura.activiti.model;

import java.io.Serializable;

public class BizForm implements Serializable {

	private static final long serialVersionUID = -2720605598421226871L;

	public static final Integer TYPE_BIZFORM = 0;
	public static final Integer TYPE_CUSTOMFORM = 1;
	public static final Integer TYPE_AUTOFORM = 2;

	public static final Integer STATUS_DESIGN = 0;
	public static final Integer STATUS_RUN = 1;
	public static final Integer STATUS_INVALID = 2;

	private String id;
	private String tenantId;
	private String code;
	private String displayName;
	private String processKey;
	private String iconUrl;
	private Integer serial = 0;
	private String description;
	private Integer type = 0;
	private Integer status = 1;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getProcessKey() {
		return processKey;
	}

	public void setProcessKey(String processKey) {
		this.processKey = processKey;
	}

	public Integer getSerial() {
		return serial;
	}

	public void setSerial(Integer serial) {
		this.serial = serial;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getType() {
		return type;
	}

	public String getTypeName() {

		return (type == 0 ? "业务表单" : (type == 1 ? "定制表单" : (type == 2 ? "自动表单" : "未知")));
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getStatus() {
		return status;
	}

	public String getStatusName() {

		return (status == 0 ? "设计" : (status == 1 ? "运行" : (type == 2 ? "作废" : "未知")));
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getIconUrl() {
		return iconUrl;
	}

	public void setIconUrl(String iconUrl) {
		this.iconUrl = iconUrl;
	}

}
