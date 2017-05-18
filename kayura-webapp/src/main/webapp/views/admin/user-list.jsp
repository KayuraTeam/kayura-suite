<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">账号管理</k:section>

<k:section name="head">
	<script type="text/javascript">
	
		$(document).ready(function() {
			
			$('#tg').datagrid({
				url: "${ROOT}/admin/user/find.json",
				queryParams: {
					keyword : $('#keyword').val(),
					status : $('#status').val()
				},
				onDblClickRow : function(idx, row){
					editUser(row);
				}
			});
		});

		function doSearch() {
			$('#tg').datagrid('load', {
				keyword : $('#keyword').val(),
				status : $('#status').val()
			});
		}
		
		function editUser(row){
			
			if(row == null){
				row = $("#tg").datagrid("getSelected");
			}
			
			if(row != null) {
				juasp.openWin({
					url: "${ROOT}/admin/user/edit?id=" + row.userId,
					width: "600px",
					height: "500px",
					title: "修改用户资料",
					onClose : function(result){
						if(result == 1){
							//doSearch();
						}
					}
				});
			} else {
				juasp.warnTips("请在表格中点击要<b>编辑</b>的记录。");
			}
		}
		
		function newUser(){
			juasp.openWin({
				url: "${ROOT}/admin/user/new",
				width: "600px",
				height: "500px",
				title: "创建用户资料",
				onClose : function(result){
					if(result == 1){
						doSearch();
					}
				}
			});
		}
		
	</script>
</k:section>

<k:section name="body">
	<k:datagrid id="tg" fit="true" rownumbers="true" 
		pagination="true" pageSize="10" singleSelect="true" striped="true"
		toolbar="#tb,#tq" idField="userId">
		<k:column field="userName" width="100" title="用户名" />
		<k:column field="displayName" width="180" title="显示名" />
		<k:column field="email" width="280" title="电子邮件" />
		<k:column field="mobileNo" width="340" title="手机号" />
		<k:column field="status" width="60" align="center" title="状态" />
	</k:datagrid>
	<div id="tb">
		<k:linkbutton id="add" iconCls="icon-add" plain="true" text="新增账号" onClick="newUser()" />
		<k:linkbutton id="edit" iconCls="icon-edit" plain="true" text="编辑账号" onClick="editUser()" />
	</div>
	<div id="tq" style="padding-left: 8px">
		关键字：
		<k:textbox id="keyword" style="width:150px" />
		状态：
		<k:combobox id="status">
			<k:option label="所有" value="" />
			<k:option label="申请中" value="1" />
			<k:option label="使用中" value="2" />
			<k:option label="已停用" value="3" />
		</k:combobox>
		<k:linkbutton text="查询" plain="true" iconCls="icon-search" onClick="doSearch()" />
	</div>
</k:section>

<%@ include file="/shared/_list.jsp"%>