/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.web.easyui;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.kayura.tags.easyui.types.EuTreeNode;
import org.kayura.type.OrderBy.Direction;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.TreeNode;
import org.kayura.utils.StringUtils;
import org.kayura.web.ui.UISupport;

/**
 * @author liangxia@live.com
 */
public class EasyUISupport implements UISupport {

	@Override
	public PageParams getPageParams(HttpServletRequest req) {

		// page=1&rows=10&sort=itemid&order=desc

		int pageIndex = StringUtils.toInteger(req.getParameter("page"), 0);
		int pageSize = StringUtils.toInteger(req.getParameter("rows"), 0);

		String sortField = req.getParameter("sort");
		String sortOrder = req.getParameter("order");

		PageParams pageParams = new PageParams();
		pageParams.setPage(pageIndex);
		pageParams.setLimit(pageSize);
		pageParams.setContainsTotalCount(true);

		if (sortField != null && sortField != "" && sortOrder != null && sortOrder != "") {
			Direction direction = sortOrder.equals("asc") ? Direction.ASC : Direction.DESC;
			pageParams.setOrderBy(sortField, direction);
		}

		return pageParams;
	}

	@Override
	public Map<String, Object> putData(Map<String, Object> map, PageList<?> pageList) {

		// {"total":"28","rows":[{}] }

		map.put("total", pageList.getTotalCount());
		map.put("rows", pageList);

		return map;
	}

	@Override
	public Map<String, Object> putData(PageList<?> pageList) {

		Map<String, Object> map = new HashMap<String, Object>();
		putData(map, pageList);
		return map;
	}

	private EuTreeNode convertNode(TreeNode treeNode) {

		EuTreeNode euNode = new EuTreeNode(treeNode.getId(), treeNode.getText());

		if (StringUtils.isNotEmpty(treeNode.getCls())) {
			euNode.setIconCls(treeNode.getCls());
		}

		if (treeNode.getIsOpen() != null) {
			euNode.setState(treeNode.getIsOpen() ? EuTreeNode.STATE_OPEN : EuTreeNode.STATE_CLOSED);
		}

		List<TreeNode> children = treeNode.getChildren();
		for (TreeNode cn : children) {
			euNode.addNode(convertNode(cn));
		}

		Map<String, Object> attributes = treeNode.getAttributes();
		for (String key : attributes.keySet()) {
			euNode.addAttr(key, attributes.get(key));
		}

		return euNode;
	}

	@Override
	public Map<String, Object> putNodes(List<TreeNode> treeNodes) {

		Map<String, Object> map = new HashMap<String, Object>();
		putNodes(map, treeNodes);
		return map;
	}

	@SuppressWarnings("rawtypes")
	public List convertNodes(List<TreeNode> treeNodes) {
		
		List<EuTreeNode> nodes = new ArrayList<EuTreeNode>();
		for (TreeNode treeNode : treeNodes) {
			nodes.add(convertNode(treeNode));
		}
		return nodes;
	}

	@Override
	public Map<String, Object> putNodes(Map<String, Object> map, List<TreeNode> treeNodes) {

		List<EuTreeNode> nodes = new ArrayList<EuTreeNode>();
		for (TreeNode treeNode : treeNodes) {
			nodes.add(convertNode(treeNode));
		}
		map.put("nodes", nodes);
		return map;
	}

}
