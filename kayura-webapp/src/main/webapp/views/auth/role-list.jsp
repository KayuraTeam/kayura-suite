<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">账号管理</k:section>

<k:section name="head">
	<script type="text/javascript">
	
	$(function() { jctx.init(); });
	
	var jctx = (function($, win){
		
		function _init(){
			
			$('#tg').datagrid({
				url: "${ROOT}/auth/role/find.json",
				queryParams: {
					keyword : $('#keyword').val()
				},
				rowStyler: function(index, row){
					if (!row.enabled){
						return 'color:gray;';
					}
				},
				onDblClickRow : function(idx, row){
					_editRole(row);
				}
			});
		}
		
		function _newRole(){
			
			juasp.openWin({
				url: "${ROOT}/auth/role/new",
				width: "400px",
				height: "300px",
				title: "创建新角色",
				onClose : function(result){
					if(result == 1){
						_search();
					}
				}
			});
		}
		
		function _editRole(row){
			
			if(row == null) {
				row = $("#tg").datagrid("getSelected");
			}
			if(row != null) {
				juasp.openWin({
					url: "${ROOT}/auth/role/edit?id=" + row.roleId,
					width: "400px",
					height: "300px",
					title: "修改角色",
					onClose : function(result){
						if(result == 1){
							_search();
						}
					}
				});
			} else {
				juasp.warnTips("请在表格中点击要<b>编辑</b>的记录。");
			}
		}
		
		function _removeRole(){
			
			var row = $("#tg").datagrid("getSelected");
			if(row != null) {
				juasp.confirm("是否删除名称为【 " + row.name + " 】的角色。", 
					function(r) {
						if(r == true) {
							juasp.ajaxPost({
								url: juasp.APPROOT + '/auth/role/remove.json', 
								data: { id : row.roleId },
								success: function(r){
									var idx = $("#tg").datagrid("getRowIndex", row);
									$("#tg").datagrid('deleteRow', idx);
								}
							});
						}
					});
			} else {
				juasp.warnTips("请在表格中点击要<b>删除</b>的记录。");
			}
		}
		
		function _search(){
			$('#tg').datagrid('load', {
				keyword : $('#search').searchbox('getValue')
			});
		}
		
		return {
			init : _init,
			newRole : _newRole,
			editRole : _editRole,
			removeRole : _removeRole,
			search : _search
		}
		
	}(jQuery,window));
	
	</script>
</k:section>

<k:section name="body">
	<k:datagrid id="tg" fit="true" rownumbers="true" 
		pagination="true" pageSize="10" singleSelect="true" striped="true"
		toolbar="#tb" idField="roleId">
		<k:column field="name" width="220" title="角色名" />
		<k:column field="enabledName" width="120" align="center" title="状态" />
		<k:column field="actions" width="120" align="center" title="操作" />
	</k:datagrid>
	<div id="tb">
		<k:linkbutton iconCls="icon-add" plain="true" text="新增角色" onClick="jctx.newRole()" />
		<k:linkbutton iconCls="icon-edit" plain="true" text="编辑角色" onClick="jctx.editRole()" />
		<k:linkbutton iconCls="icon-remove" plain="true" text="删除角色" onClick="jctx.removeRole()" />
		<div style="float:right;">
			<k:searchbox id="search" prompt="搜索：角色名称" width="220" height="25" searcher="jctx.search" />
		</div>
	</div>
</k:section>

<%@ include file="/shared/_list.jsp"%>