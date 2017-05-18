/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.tags.easyui.types;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 支持 EasyUI.Tree 的 TreeNode 数据结构.
 *
 * @author liangxia@live.com
 */
public class EuTreeNode {

	public static final String STATE_OPEN = "open";
	public static final String STATE_CLOSED = "closed";

	private String id;
	private String text;
	private String iconCls;
	private Boolean checked;
	private String state;
	private List<EuTreeNode> children;
	private Map<String, Object> attributes;

	public EuTreeNode() {
		this.children = new ArrayList<EuTreeNode>();
		this.attributes = new HashMap<String, Object>();
	}

	public EuTreeNode(String id, String text) {
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

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public Boolean isChecked() {
		return checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public List<EuTreeNode> getChildren() {
		return children;
	}

	public void addNodes(List<EuTreeNode> nodes) {

		if (nodes != null) {
			for (EuTreeNode n : nodes) {
				addNode(n);
			}
		}
	}

	public void addNode(EuTreeNode node) {
		if (this.children == null) {
			this.children = new ArrayList<EuTreeNode>();
		}
		this.children.add(node);
	}

	public Map<String, Object> getAttributes() {
		return attributes;
	}

	public void addAttr(String key, Object value) {
		if (this.attributes == null) {
			this.attributes = new HashMap<String, Object>();
		}
		this.attributes.put(key, value);
	}
}
