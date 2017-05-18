/**
 * jeasyui 的功能扩展单元.
 * 
 * @author liangxia@live.com
 */

(function(win, $, doc) {

	// 扩展 easyui tree 组件的方法.

	$.extend($.fn.tree.methods, {

		/**
		 * 扩展 tree 方法，用于获取指定节点所属的根节点对象.
		 * 
		 * @param {oject} jq 当前 tree 的 DOM jQuery对象.
		 * @param {object} node 用于查找的原始节点对象.
		 */
		getRootNode : function(jq, node) {
			var root = node;
			while (true) {
				var parent = $(jq).tree("getParent", root.target);
				if (parent == null) {
					break;
				}
				root = parent;
			}
			return root;
		}

	});

	// 重写 jeasyui.tree 默认属性.
	
	$.extend($.fn.tree.defaults, {
		method : "post",
		loadFilter : function(r) {
			return _loadFilter(r);
		}
	});

	// 重写 jeasyui.combotree 默认属性.
	
	$.extend($.fn.combotree.defaults, {
		method : "post",
		loadFilter : function(r) {
			return _loadFilter(r);
		}
	});

	// 重写 jeasyui.form 默认属性.
	
	$.extend($.fn.form.defaults, {
		success : function(d) {
			var r = d;
			if (juasp.isString(d)) {
				r = eval('(' + d + ')');
			}
			if (r.type == juasp.SUCCESS) {
				if(!juasp.isEmpty(r.message)) {
					juasp.infoTips(r.message);
				}
				this.onlySuccess(r);
			} else if (r.type == juasp.FAILED){
				juasp.errorTips(r.message);
			} else {
				juasp.errorTips("提交表单时，发生内部异常。");
			}
		},
		onlySuccess: function(data){}
	});

	// 重写 jeasyui.combotree 默认属性.
	
	$.extend($.fn.switchbutton.defaults, {
		onText : "是",
		offText : "否",
		value : "1"
	});
	
	// 重写 jeasyui.validatebox 默认属性.
	
	$.extend($.fn.validatebox.defaults.rules, {
	    equals: {
	        validator: function(value,param){
	            return value == $(param[0]).val();    
	        },
	        message: 'Field do not match.'   
	    }
	});
	
	// 重写 jeasyui.menu 默认属性.
	
	function _getParentMenu(rootMenu, menu){
		return findParent(rootMenu);

		function findParent(pmenu){
			var p = undefined;
			$(pmenu).find('.menu-item').each(function(){
				if (!p && this.submenu){
					if ($(this.submenu)[0] == $(menu)[0]){
						p = pmenu;
					} else {
						p = findParent(this.submenu);
					}
				}
			});
			return p;
		}
	}

	$.extend($.fn.menu.methods, {
		enableNav: function(jq, rootMenu){
			var firstItemSelector = '.menu-item:not(.menu-item-disabled):first';
			var lastItemSelector = '.menu-item:not(.menu-item-disabled):last';
			return jq.each(function(){
				var menu = $(this);
				rootMenu = $(rootMenu).length ? $(rootMenu) : menu;
				menu.attr('tabindex','0').css('outline','none').unbind('.menu').bind('keydown.menu', function(e){
					var item = $(this).find('.menu-active');
					switch(e.keyCode){
						case 13:  // enter
							item.trigger('click');
							break;
						case 27:  // esc
							rootMenu.find('.menu-active').trigger('mouseleave');
							break;
						case 38:  // up
							var prev = item.length ? item.prevAll(firstItemSelector) : menu.find(lastItemSelector);
							prev.trigger('mouseenter');
							return false;
						case 40:  // down
							var next = item.length ? item.nextAll(firstItemSelector) : menu.find(firstItemSelector);
							next.trigger('mouseenter');
							return false;
						case 37:  // left
							var pmenu = _getParentMenu(rootMenu, menu);
							if (pmenu){
								item.trigger('mouseleave');
								pmenu.focus();
							}
							return false;
						case 39:  // right
							if (item.length && item[0].submenu){
								$(item[0].submenu).menu('enableNav', rootMenu).find(firstItemSelector).trigger('mouseenter');
								$(item[0].submenu).focus();
							}
							return false;
					}
				});
			});
		}
	});
	
	// 重写 jeasyui.combobox 默认属性.

	$.extend($.fn.combobox.defaults, {
		valueField : "value",
		textField : "label",
		groupField : "group",
		method : "POST",
		filter : function(q, row) {
			var opts = $(this).combobox('options');
			return row[opts.textField].indexOf(q) == 0;
		}
	});
	
	// 重写 jeasyui.combogrid 默认属性.

	$.extend($.fn.combogrid.defaults, {
		nowrap : true,
		striped : true,
		method : "POST",
		rownumbers : true,
		pagination : true,
		loadFilter : function(r) {
			return _loadFilter(r);
		},
		onHeaderContextMenu: function(e, field){
			e.preventDefault();
			if (!this.ctxmenu){
				this.ctxmenu = _createColumnMenu(this);
			}
			this.ctxmenu.menu('show', { left:e.pageX, top:e.pageY });
		}
	});
	
	// 重写 jeasyui.messager 默认属性.
	
	$.extend($.messager.defaults, {
		width: 450
	});

	// 扩展 jeasyui.textbox 方法.
	
	$.extend($.fn.textbox.methods, {
		addClearBtn: function(jq){
			return jq.each(function(){
				var t = $(this);
				var opts = t.textbox('options');
				opts.icons = opts.icons || [];
				opts.icons.unshift({
					iconCls: "icon-clear",
					handler: function(e){
						$(e.data.target).textbox('clear').textbox('textbox').focus();
						$(this).css('visibility','hidden');
					}
				});
				t.textbox();
				if (!t.textbox('getText')){
					t.textbox('getIcon',0).css('visibility','hidden');
				}
				t.textbox('textbox').bind('keyup', function(){
					var icon = t.textbox('getIcon',0);
					if ($(this).val()){
						icon.css('visibility','visible');
					} else {
						icon.css('visibility','hidden');
					}
				});
			});
		}
	});
	
	// 扩展 easyui.datagrid 方法.

	$.extend($.fn.datagrid.methods, {
		editCell : function(jq, param) {
			return jq.each(function() {
				var opts = $(this).datagrid('options');
				var fields = $(this).datagrid('getColumnFields', true)
						.concat($(this).datagrid('getColumnFields'));
				for (var i = 0; i < fields.length; i++) {
					var col = $(this)
							.datagrid('getColumnOption', fields[i]);
					col.editor1 = col.editor;
					if (fields[i] != param.field) {
						col.editor = null;
					}
				}
				$(this).datagrid('beginEdit', param.index);
				var ed = $(this).datagrid('getEditor', param);
				if (ed) {
					if ($(ed.target).hasClass('textbox-f')) {
						$(ed.target).textbox('textbox').focus();
					} else {
						$(ed.target).focus();
					}
				}
				for (var i = 0; i < fields.length; i++) {
					var col = $(this)
							.datagrid('getColumnOption', fields[i]);
					col.editor = col.editor1;
				}
			});
		},
		enableCellEditing : function(jq) {
			return jq.each(function() {
				var dg = $(this);
				var opts = dg.datagrid('options');
				opts.oldOnClickCell = opts.onClickCell;
				opts.onClickCell = function(index, field) {
					if (opts.editIndex != undefined) {
						if (dg.datagrid('validateRow', opts.editIndex)) {
							dg.datagrid('endEdit', opts.editIndex);
							opts.editIndex = undefined;
						} else {
							return;
						}
					}
					dg.datagrid('selectRow', index).datagrid('editCell', {
						index : index,
						field : field
					});
					opts.editIndex = index;
					opts.oldOnClickCell.call(this, index, field);
				}
			});
		}
	});

	$.extend($.fn.datagrid.defaults, {
		nowrap : true,
		striped : true,
		method : "POST",
		rownumbers : true,
		pagination : true,
		pageSize : 20,
		loadFilter : function(r) {
			return _loadFilter(r);
		},
		onHeaderContextMenu: function(e, field){
			e.preventDefault();
			if (!this.ctxmenu){
				this.ctxmenu = _createColumnMenu(this);
			}
			this.ctxmenu.menu('show', { left:e.pageX, top:e.pageY });
		}
	});
	
	// jeasyui 扩展静态方法.
	function _changeTheme(theme) {
		
		var link = $("#themeLink");
		if (link != null) {
			link.attr('href', juasp.ROOT + '/res/easyui/themes/' + theme + '/easyui.css');

			var ifs = $("iframe");
			for (var f = 0; f < ifs.length; f++) {
				try {
					var w = ifs[f].contentWindow;
					w.changeTheme(theme);
				} catch (e) {
				}
			}
		}
	}
	
	win.changeTheme = _changeTheme;

	var jeasyui = {

		genThemeList: function(eid, root) {
			
			var themes = [{title:'default',borderColor:'#95B8E7', backgroundColor:'#E0ECFF'},
			              {title:'bootstrap',borderColor:'#D4D4D4', backgroundColor:'#F2F2F2'},
			              {title:'cupertino',borderColor:'#AED0EA', backgroundColor:'#d7ebf9'},
			              {title:'gray',borderColor:'#D3D3D3', backgroundColor:'#f3f3f3'},
			              {title:'metro',borderColor:'#ddd', backgroundColor:'#ffffff'},
			              {title:'metro-blue',borderColor:'#c3d9e0', backgroundColor:'#daeef5'},
			              {title:'metro-gray',borderColor:'#abafb8', backgroundColor:'#c7ccd1'},
			              {title:'sunny',borderColor:'#494437', backgroundColor:'#feeebd'}];
			
			var $div = $("#" + eid);
			
			for ( var i in themes) {
				var t = themes[i];
				var d = $("<div/>");
				d.addClass("juasp-theme");
				d.attr("title", t.title);
				d.css({ "border-color": t.borderColor, "background-color": t.backgroundColor });
				d.bind("click", function(){
					var nt = $(this).attr("title");
					var ot = juasp.getCookie("theme");
					if(ot != nt) {
						juasp.setCookie("theme", nt, 365);
						_changeTheme(nt);
					}
				});
				$div.append(d);
			}
		}
	};

	/**
	 * 创建 DataGrid 表格的列控制菜单.
	 * 
	 * @param {String} tag datagrid表格标签,如: #dg .
	 */
	function _createColumnMenu(tag) {
		var cmenu = $('<div/>').appendTo('body');
		cmenu.menu({
			onClick : function(item) {
				if (item.iconCls == 'icon-ok') {
					$(tag).datagrid('hideColumn', item.name);
					cmenu.menu('setIcon', {
						target : item.target,
						iconCls : 'icon-empty'
					});
				} else {
					$(tag).datagrid('showColumn', item.name);
					cmenu.menu('setIcon', {
						target : item.target,
						iconCls : 'icon-ok'
					});
				}
			}
		});
		var fields = $(tag).datagrid('getColumnFields');
		for (var i = 1; i < fields.length; i++) {
			var field = fields[i];
			var col = $(tag).datagrid('getColumnOption', field);
			cmenu.menu('appendItem', {
				text : col.title,
				name : field,
				iconCls : col.hidden ? 'icon-empty' : 'icon-ok' 
			});
		}
		return cmenu;
	}

	/**
	 * 默认的 jeasyui 数据过滤方法.
	 */
	function _loadFilter(r) {
		
		if(r.success != undefined) {
			if (r.success && r.data != undefined) {
				return r.data;
			} else {
				juasp.alert('消息', r.message, 'error');
			}
		} else {
			return r;
		}
	}

	win.jeasyui = jeasyui;

}(window, jQuery, document));