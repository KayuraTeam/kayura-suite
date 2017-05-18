/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.kayura.core.PostAction;
import org.kayura.core.PostResult;
import org.kayura.example.po.Customer;
import org.kayura.example.service.ExampleService;
import org.kayura.example.vo.OrderVo;
import org.kayura.tags.easyui.types.MenuItem;
import org.kayura.tags.easyui.types.EuTreeNode;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.utils.KeyUtils;
import org.kayura.utils.StringUtils;
import org.kayura.web.controllers.UaspController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/example")
public class ExampleController extends UaspController {

	@Autowired
	private ExampleService exampleService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "views/example/index";
	}

	/* Jsp Tags */

	@RequestMapping(value = "tags/treedata", method = RequestMethod.POST)
	public void treeData(Map<String, Object> map) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult r) {

				List<EuTreeNode> data = makeTreeDate();

				r.setCode(Result.SUCCEED);
				r.setData(data);
			}
		});
	}

	private List<EuTreeNode> makeTreeDate() {

		List<EuTreeNode> nodes = new ArrayList<EuTreeNode>();

		for (int i = 0; i <= 5; i++) {

			EuTreeNode n = new EuTreeNode();
			n.setId(KeyUtils.newId());
			n.setText("节点" + i);
			nodes.add(n);

			for (int j = 0; j <= 5; j++) {

				EuTreeNode k = new EuTreeNode();
				k.setId(KeyUtils.newId());
				k.setText("节点" + j);

				n.addNode(k);
			}
		}

		return nodes;
	}

	@RequestMapping(value = "tags/tree", method = RequestMethod.GET)
	public ModelAndView treeTagTest() {

		ModelAndView mv = this.view("views/example/tags/tree");

		List<EuTreeNode> data = makeTreeDate();
		mv.addObject("data", data);

		Map<String, Object> query = new HashMap<String, Object>();
		query.put("pid", KeyUtils.newId());

		mv.addObject("query", query);

		return mv;
	}

	@RequestMapping(value = "tags/panel", method = RequestMethod.GET)
	public ModelAndView panelTagTest() {

		ModelAndView mv = this.view("views/example/tags/panel");

		Map<String, Object> query = new HashMap<String, Object>();
		query.put("pid", KeyUtils.newId());

		mv.addObject("query", query);

		return mv;
	}

	@RequestMapping(value = "tags/tabs", method = RequestMethod.GET)
	public ModelAndView tagsTagTest() {

		ModelAndView mv = this.view("views/example/tags/tabs");

		return mv;
	}

	@RequestMapping(value = "tags/acc", method = RequestMethod.GET)
	public ModelAndView accTagTest() {

		ModelAndView mv = this.view("views/example/tags/acc");

		return mv;
	}

	@RequestMapping(value = "tags/form", method = RequestMethod.GET)
	public ModelAndView formTagTest() {

		ModelAndView mv = this.view("views/example/tags/form");

		return mv;
	}

	@RequestMapping(value = "tags/grid", method = RequestMethod.GET)
	public ModelAndView gridTagTest() {

		ModelAndView mv = this.view("views/example/tags/grid");

		return mv;
	}

	@RequestMapping(value = "tags/win", method = RequestMethod.GET)
	public ModelAndView winTagTest() {

		ModelAndView mv = this.view("views/example/tags/win");

		return mv;
	}

	@RequestMapping(value = "tags/base", method = RequestMethod.GET)
	public ModelAndView baseitemsTagTest() {

		ModelAndView mv = this.view("views/example/tags/base");

		List<MenuItem> menus = new ArrayList<MenuItem>();

		menus.add(new MenuItem("item1", "Search Item1", "icon-add"));
		menus.add(MenuItem.SEPMENUITEM);

		MenuItem m2 = new MenuItem("Search Item2", "icon-add");
		m2.addMenu(new MenuItem("item21", "Search Item2-1", "icon-add"));

		MenuItem item22 = new MenuItem("item22", "点击我", "icon-ok");
		item22.setOnclick("alert('点我了')");
		m2.addMenu(item22);

		menus.add(m2);
		menus.add(MenuItem.SEPMENUITEM);

		MenuItem m3 = new MenuItem("item3", "Search Item3", "icon-home", true);
		m3.setDisabled(true);
		menus.add(m3);

		mv.addObject("menus", menus);

		return mv;
	}

	/* Tools */

	@RequestMapping(value = "/htmlconvert", method = RequestMethod.GET)
	public String htmlconvert() {
		return "views/example/htmlconvert";
	}

	/* General Example */

	@RequestMapping(value = "general/order/find.json")
	public void generalorders(HttpServletRequest req, Map<String, Object> model,
			@RequestParam(value = "q", required = false) String keyword) {

		PageParams pageParams = this.getPageParams(req);

		Map<String, Object> args = new HashMap<String, Object>();
		if (!StringUtils.isEmpty(keyword)) {
			args.put("keyword", "%" + keyword + "%");
		}

		PageList<OrderVo> orders = exampleService.findOrders(args, pageParams);

		this.ui.putData(model, orders);
	}

	@RequestMapping(value = "general/customer/find.json")
	public void findCustomers(HttpServletRequest req, Map<String, Object> map,
			@RequestParam(value = "q", required = false) String keyword) {

		postExecute(map, new PostAction() {

			@Override
			public void invoke(PostResult ps) {

				PageParams pageParams = getPageParams(req);

				Result<PageList<Customer>> r = exampleService.findCustomers(keyword, pageParams);
				ps.setResult(r.getCode(), r.getMessage(), ui.putData(r.getData()));
			}
		});
	}

	@RequestMapping(value = "general/basiclist", method = RequestMethod.GET)
	public String generalbasiclist() {
		return "views/example/general/basiclist";
	}

	@RequestMapping(value = "general/basicedit", method = RequestMethod.GET)
	public String generalbasicedit() {
		return "views/example/general/basicedit";
	}

	/* EasyUI Example */

	@RequestMapping(value = "easyui/datagrid", method = RequestMethod.GET)
	public String datagrid() {
		return "views/example/easyui/datagrid/index";
	}

	@RequestMapping(value = "easyui/datagridbasic", method = RequestMethod.GET)
	public String datagridbasic() {
		return "views/example/easyui/datagrid/basic";
	}

	@RequestMapping(value = "easyui/datagridcacheeditor", method = RequestMethod.GET)
	public String datagridcacheeditor() {
		return "views/example/easyui/datagrid/cacheeditor";
	}

	@RequestMapping(value = "easyui/datagridcellediting", method = RequestMethod.GET)
	public String datagridcellediting() {
		return "views/example/easyui/datagrid/cellediting";
	}

	@RequestMapping(value = "easyui/datagridcellstyle", method = RequestMethod.GET)
	public String datagridcellstyle() {
		return "views/example/easyui/datagrid/cellstyle";
	}

	@RequestMapping(value = "easyui/datagridcheckbox", method = RequestMethod.GET)
	public String datagridcheckbox() {
		return "views/example/easyui/datagrid/checkbox";
	}

	@RequestMapping(value = "easyui/datagridcolumngroup", method = RequestMethod.GET)
	public String datagridcolumngroup() {
		return "views/example/easyui/datagrid/columngroup";
	}

	@RequestMapping(value = "easyui/datagridcomplextoolbar", method = RequestMethod.GET)
	public String datagridcomplextoolbar() {
		return "views/example/easyui/datagrid/complextoolbar";
	}

}
