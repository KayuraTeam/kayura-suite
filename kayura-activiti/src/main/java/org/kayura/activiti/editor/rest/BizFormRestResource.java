package org.kayura.activiti.editor.rest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.ActivitiException;
import org.kayura.activiti.model.BizForm;
import org.kayura.activiti.service.BizFormService;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.type.TreeNode;
import org.kayura.utils.StringUtils;
import org.kayura.web.ui.UISupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author liangxia@live.com
 *
 */
@RestController
public class BizFormRestResource {

	protected static final Logger logger = LoggerFactory.getLogger(BizFormRestResource.class);

	@Autowired
	protected UISupport ui;

	@Autowired
	protected BizFormService bizFormService;

	@Autowired
	protected ObjectMapper objectMapper;

	@RequestMapping(value = "/bizform/find", method = RequestMethod.GET, produces = "application/json")
	public Map<String, Object> findBizForm(HttpServletRequest req, String keyword, String tenantId) {

		try {
			PageParams pp = ui.getPageParams(req);
			Result<PageList<BizForm>> r = bizFormService.findBizForms(tenantId, keyword, pp);
			if (r.isSucceed()) {
				PageList<BizForm> pageList = r.getData();
				Map<String, Object> data = ui.putData(pageList);
				return data;
			}
		} catch (Exception e) {
			logger.error("Error Read bizform", e);
			throw new ActivitiException("Error Read bizform", e);
		}

		return new HashMap<String, Object>();
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/bizform/tree", method = RequestMethod.GET, produces = "application/json")
	public List bizNavTree(String tenantId) {

		TreeNode root = new TreeNode("ROOT", "所有表单定义");
		root.addAttr("key", "");

		Result<List<BizForm>> r = bizFormService.loadBizForms(tenantId);
		if (r.isSucceed()) {

			List<BizForm> list = r.getData();
			for (BizForm b : list) {

				TreeNode bizNode = new TreeNode(b.getId(), b.getDisplayName());
				bizNode.addAttr("key", b.getProcessKey());

				// 设计 type=0
				TreeNode designNode = new TreeNode("DESIGN#" + b.getId(), "设计");
				designNode.addAttr("key", b.getProcessKey());
				designNode.addAttr("code", b.getCode());
				designNode.addAttr("type", 0);
				bizNode.addNode(designNode);

				// 发布 type=1
				TreeNode releaseNode = new TreeNode("RELEASE#" + b.getId(), "发布");
				releaseNode.addAttr("key", b.getProcessKey());
				releaseNode.addAttr("code", b.getCode());
				releaseNode.addAttr("type", 1);
				bizNode.addNode(releaseNode);

				// 挂起 type=2
				TreeNode suspendNode = new TreeNode("SUSPEND#" + b.getId(), "挂起");
				suspendNode.addAttr("key", b.getProcessKey());
				suspendNode.addAttr("code", b.getCode());
				suspendNode.addAttr("type", 2);
				bizNode.addNode(suspendNode);

				root.addNode(bizNode);
			}
		}

		List<TreeNode> nodes = new ArrayList<TreeNode>();
		nodes.add(root);
		return ui.convertNodes(nodes);
	}

	@RequestMapping(value = "/bizform/save", method = RequestMethod.POST)
	public void saveBizForm(HttpServletRequest req, BizForm model) {

		try {

			if (StringUtils.isEmpty(model.getId())) {

				model.setStatus(BizForm.STATUS_DESIGN);
				bizFormService.insertBizForm(model);
			} else {

				bizFormService.updateBizForm(model);
			}
		} catch (Exception e) {
			logger.error("Error Save bizform", e);
			throw new ActivitiException("Error Save bizform", e);
		}
	}

	@RequestMapping(value = "/bizform/{id}/remove", method = RequestMethod.DELETE)
	public void removeBizForm(@PathVariable String id) {

		try {
			bizFormService.deleteBizForm(id);
		} catch (Exception e) {
			logger.error("Error Remove bizform", e);
			throw new ActivitiException("Error Remove bizform", e);
		}
	}
}
