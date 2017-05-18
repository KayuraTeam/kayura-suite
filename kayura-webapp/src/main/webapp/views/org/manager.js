
jctx = (function(win, $) {
	
	var selectNode = null;
	var ROOTPATH = "";
	var isInit = true;
	var isfirst = true;
	var actions = {
			addcompany : false,
			adddepart : false,
			addposition : false,
			remove : false
		};
	
	function _init(){
		
		$('#tv').tree({
			url : juasp.APPROOT + "/org/tree.json",
			onClick : function(node) {
				_clickNode(node);
			},
			onLoadSuccess : function(node, data){
				if(isInit) {
					$(this).tree("collapseAll");
					var root = $(this).tree('find', "ROOT");
					$(this).tree("expand", root.target);
					isInit = false;
				}
			},
			onContextMenu: function(e, node){
				e.preventDefault();
				$(this).tree('select', node.target);
				_clickNode(node);
				$('#mm').menu('show', { left: e.pageX, top: e.pageY });
			}
		});
	}
	
	function _initActions(){
		
		actions.addcompany = false;
		actions.adddepart = false;
		actions.addposition = false;
		actions.addemployee = false;
		actions.remove = false;
	}
	
	function _applyActions(_actions){

		$('#mm').menu((_actions.addcompany?'showItem':'hideItem'), $("#mmaddcompany"));
		$('#mm').menu((_actions.adddepart?'showItem':'hideItem'), $("#mmadddepart"));
		$('#mm').menu((_actions.addposition?'showItem':'hideItem'), $("#mmaddposition"));
		$('#mm').menu((_actions.addemployee?'showItem':'hideItem'), $("#mmaddemployee"));
		$('#mm').menu((_actions.remove?'showItem':'hideItem'), $("#mmremove"));

		$("#tbaddcompany").linkbutton(_actions.addcompany?'enable':'disable');
		$("#tbadddepart").linkbutton(_actions.adddepart?'enable':'disable');
		$("#tbaddposition").linkbutton(_actions.addposition?'enable':'disable');
		$("#tbaddemployee").linkbutton(_actions.addemployee?'enable':'disable');
	}

	function _clickNode(node) {

		if(selectNode != node) {
			
			selectNode = node;
			_initActions();
	
			// 0 根, 1 公司, 2 部门, 3 岗位;
			var type = node.attributes['type'];
			if (type == 0) {
				actions.addcompany = true;
			} else if (type == 1) {
				actions.addcompany = true;
				actions.adddepart = true;
			} else if (type == 2) {
				actions.adddepart = true;
				actions.addposition = true;
				actions.addemployee = true;
			} else if (type == 3){
				actions.addemployee = true;
			}
	
			if (type != 0 && node.children.length == 0) {
				actions.remove = true;
			}
	
			_applyActions(actions);
			_findItems(node.id);
		}
	}

	function _search(){
		
		if(selectNode) {
			_findItems(selectNode.id);
		}
	}

	function _findItems(nodeId) {

		var id = nodeId;
		if (nodeId == "ROOT") {
			id = "";
		}

		if (isfirst) {

			$('#tg').datagrid({
				url : juasp.APPROOT + "/org/find.json",
				queryParams : {
					"id" : id
				},
				onDblClickRow : function(index, row){
					var id = row.orgId;
					var type = row.orgType;
					_editOrgItem(id, type);
				}
			});
		} else {

			$('#tg').datagrid('load', {
				"id" : id,
				"keyword" : $('#search').searchbox('getValue')
			});
			$('#tg').datagrid('unselectAll');
		}

		isfirst = false;
	}
	
	function _editCompany(id){
		
		var url = juasp.APPROOT + "/org/company";
		
		if(juasp.isEmpty(id)) {
			var pid = "";
			if(selectNode.id != "ROOT" && selectNode.id.length == 32) {
				pid = selectNode.id;
			}
			url = url + "/new?pid=" + pid + "&pname=" + selectNode.text;
		} else {
			url = url + "?id=" + id;
		}

		$('#tv').tree('expand', selectNode.target);
		juasp.openWin({
			url : url,
			width : "450px",
			height : "500px",
			title : "公司信息",
			events :{
				onSaved : function(r) {
					if (r.result == 1) {
						if(juasp.isEmpty(id)) {
							$('#tv').tree('append', {
								parent : selectNode.target,
								data : [ {
									id : r.id,
									iconCls : 'icon-company',
									text : r.text,
									attributes : { type : 1 },
									children : []
								} ]
							});
						} else {
							$('#tv').tree('update', {
								target : selectNode.target,
								text : r.text
							});
						}
					}
				}
			},
			onClose : function(r) {

			}
		});
		
	}

	function _addCompany(){
		_editCompany();
	}
	
	function _editDepart(id){
		
		var url = juasp.APPROOT + "/org/depart";
		
		if(juasp.isEmpty(id)) {
			var pid = selectNode.id;
			var type = selectNode.attributes.type;
			var pname = selectNode.text;
			url = url + "/new?pid=" + selectNode.id + "&t=" + type + "&pname=" + selectNode.text;
		} else {
			url = url + "?id=" + id;
		}

		$('#tv').tree('expand', selectNode.target);
		juasp.openWin({
			url : url,
			width : "450px",
			height : "500px",
			title : "部门信息",
			events :{
				onSaved : function(r) {
					if (r.result == 1) {
						if(juasp.isEmpty(id)) {
							$('#tv').tree('append', {
								parent : selectNode.target,
								data : [ {
									id : r.id,
									iconCls : 'icon-depart',
									text : r.text,
									attributes : { type : 2 },
									children : []
								} ]
							});
						} else {
							$('#tv').tree('update', {
								target : selectNode.target,
								text : r.text
							});
						}
					}
				}
			},
			onClose : function(r) {
			}
		});
	}

	function _addDepart(){
		
		_editDepart();
	}
	
	function _editPosition(id){
		
		var url = juasp.APPROOT + "/org/position";
		
		if(juasp.isEmpty(id)) {
			var pid = selectNode.id;
			var type = selectNode.attributes.type;
			var pname = selectNode.text;
			url = url + "/new?pid=" + selectNode.id + "&t=" + type + "&pname=" + selectNode.text;
		} else {
			url = url + "?id=" + id;
		}

		$('#tv').tree('expand', selectNode.target);
		juasp.openWin({
			url : url,
			width : "450px",
			height : "500px",
			title : "岗位信息",
			events :{
				onSaved : function(r) {
					if (r.result == 1) {
						if(juasp.isEmpty(id)) {
							$('#tv').tree('append', {
								parent : selectNode.target,
								data : [ {
									id : r.id,
									iconCls : 'icon-position',
									text : r.text,
									attributes : { type : 3 },
									children : []
								} ]
							});
						} else {
							$('#tv').tree('update', {
								target : selectNode.target,
								text : r.text
							});
						}
					}
				}
			},
			onClose : function(r) {
			}
		});
	}
	

	function _addPosition(){
		_editPosition();
	}
	
	function _editIdentity(id){

		var url = juasp.APPROOT + "/org/identity";
		
		if(juasp.isEmpty(id)) {
			var pid = selectNode.id;
			var type = selectNode.attributes.type;
			var pname = selectNode.text;
			url = url + "/new?pid=" + selectNode.id + "&t=" + type;
		} else {
			url = url + "?id=" + id;
		}

		$('#tv').tree('expand', selectNode.target);
		juasp.openWin({
			url : url,
			width : "450px",
			height : "500px",
			title : "员工身份信息",
			onClose : function(r) {
				if (r == 1) {
					_findItems(selectNode.id);
				}
			}
		});
		
	}
	
	function _addIdentity(){
		_editIdentity();
	}
	
	function _editNode(){
		
		if(selectNode != null){
			
			// 0 根节点; 1 公司; 2 部门; 3 岗位;
			var type = selectNode.attributes.type;
			var id = selectNode.id;
			
			_editOrgItem(id, type);
		}
	}
	
	function _editOrgItem(id, type){
		
		if(type == 1) {
			_editCompany(id);
		} else if(type == 2) {
			_editDepart(id);
		} else if (type == 3) {
			_editPosition(id);
		} else if (type == 4) {
			_editIdentity(id);
		}
	}
	
	function _removeOrg(){

		if(selectNode != null) {
			
			juasp.confirm("是否确认删除 " + selectNode.text + " 项。", function(r){
				if(r == true){
					// 0 根节点; 1 公司; 2 部门; 3 岗位;
					var type = selectNode.attributes.type;
					var id = selectNode.id;
					
					juasp.ajaxPost({
						url: juasp.APPROOT + "/org/remove.json", 
						data: { id: id, t: type }, 
						success: function(r) {
							var parentNode = $('#tv').tree('getParent', selectNode.target);
							$('#tv').tree('remove', selectNode.target);
							$('#tv').tree('select', parentNode.target);
							juasp.infoTips(selectNode.text + " 已经被删除。");
						}
					});
				}
			});
			
		}
	}
	
	function _importEmployee(){
		
		var pid = selectNode.id;
		var type = selectNode.attributes.type;
		
		juasp.selectEmployee({
			onClose : function(r){
				if(r.result == 1){
					juasp.ajaxPost({
						url: juasp.APPROOT + "/org/identity/import.json", 
						data: { "pid": pid, "t": type, "empid": r.data.employeeId }, 
						success: function(r){
							_findItems(selectNode.id);
						}
					});
					
				}
			}
		});
	}
	
	return {
		init : _init,
		search : _search,
		editNode : _editNode,
		removeOrg : _removeOrg,
		addCompany : _addCompany,
		addDepart : _addDepart,
		addPosition : _addPosition,
		addIdentity : _addIdentity,
		importEmployee: _importEmployee
	}

}(window, jQuery));