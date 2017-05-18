package org.kayura.type;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TreeNode {

	private String id;
	private String text;
	private String cls;
	private Boolean checked = false;
	private Boolean isOpen = true;
	private List<TreeNode> children;
	private Map<String, Object> attributes;

	public TreeNode() {
		children = new ArrayList<TreeNode>();
		attributes = new HashMap<String, Object>();
	}

	public TreeNode(String id, String text) {
		this();
		this.id = id;
		this.text = text;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getCls() {
		return cls;
	}

	public void setCls(String cls) {
		this.cls = cls;
	}

	public Boolean getChecked() {
		return checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

	public Boolean getIsOpen() {
		return isOpen;
	}

	public void setIsOpen(Boolean isOpen) {
		this.isOpen = isOpen;
	}

	public List<TreeNode> getChildren() {
		return children;
	}

	public void setChildren(List<TreeNode> children) {
		this.children = children;
	}

	public Map<String, Object> getAttributes() {
		return attributes;
	}

	public void setAttributes(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	public void addAttr(String key, Object value) {
		this.attributes.put(key, value);
	}

	public void addNode(TreeNode node) {
		this.children.add(node);
	}

}
