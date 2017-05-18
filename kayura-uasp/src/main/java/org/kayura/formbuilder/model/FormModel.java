package org.kayura.formbuilder.model;

public class FormModel {

	public static final Integer STATUS_DESIGN = 0;
	public static final Integer STATUS_RUN = 1;
	public static final Integer STATUS_INVALID = 2;

	public static final Integer TYPE_PC = 0;
	public static final Integer TYPE_MOBILE = 1;

	private String modelId;
	private String tenantId;
	private String formKey;
	private String code;
	private String title;
	private String description;
	private String icon;
	private String creator;
	private String raw;
	private FormFieldList items;
	private Integer version;
	private Integer type;
	private Integer status;

	public FormModel() {
		this.items = new FormFieldList();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public FormFieldList getItems() {
		return items;
	}

	public void setItems(FormFieldList items) {
		this.items = items;
	}

	public void addField(FormField formField) {
		this.items.add(formField);
	}

	public String getRaw() {
		return raw;
	}

	public void setRaw(String raw) {
		this.raw = raw;
	}

	public String getFormKey() {
		return formKey;
	}

	public void setFormKey(String formKey) {
		this.formKey = formKey;
	}

	public String getModelId() {
		return modelId;
	}

	public void setModelId(String modelId) {
		this.modelId = modelId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTypeName() {
		return type == 1 ? "Phone" : "PC";
	}
}
