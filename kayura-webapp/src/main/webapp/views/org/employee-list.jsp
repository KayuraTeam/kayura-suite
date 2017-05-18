<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">账号管理</k:section>

<k:section name="head">
	<script type="text/javascript">
	
		$(document).ready(function() {
			jctx.init();
		});
		
		var jctx = (function($,win){
			
			function _init(){

				$('#tg').datagrid({
					url: "${ROOT}/org/employee/find.json",
					queryParams: {
						keyword : $('#keyword').val(),
						status : $('#status').val()
					},
					onDblClickRow : function(idx, row){
						_editEmployee(row);
					}
				});
			}
			
			function _search() {
				$('#tg').datagrid('load', {
					keyword : $('#keyword').val()
				});
			}
			
			function _editEmployee(row){
				
				if(row == null){
					row = $("#tg").datagrid("getSelected");
				}
				
				if(row != null) {
					juasp.openWin({
						url: "${ROOT}/org/employee/edit?id=" + row.employeeId,
						width: "700px",
						height: "500px",
						title: "修改员工资料",
						onClose : function(result) {
							if(result == 1){
								_search();
							}
						}
					});
				} else {
					juasp.warnTips("请在表格中点击要<b>编辑</b>的记录。");
				}
			}
			
			function _newEmployee(){
				
				juasp.openWin({
					url: "${ROOT}/org/employee/new",
					width: "700px",
					height: "500px",
					title: "创建员工资料",
					onClose : function(result) {
						if(result == 1){
							_search();
						}
					}
				});
			}
			
			function _formaterUser(value, row, index){
				
				if (row.userId){
					return "已激活";
				} else {
					return "[绑定] [激活]";
				}
			}
			
			return {
				init: _init,
				newEmployee: _newEmployee,
				editEmployee: _editEmployee,
				search: _search,
				formaterUser: _formaterUser
			};
			
		}(jQuery, window));
		
	</script>
</k:section>

<k:section name="body">
	<k:datagrid id="tg" fit="true" rownumbers="true" 
		pagination="true" pageSize="10" striped="true"
		toolbar="#tb" idField="employeeId">
		<k:column field="ck" checkbox="true" />
		<k:column field="code" title="工号" />
		<k:column field="name" title="姓名" />
		<k:column field="sexName" align="center" title="性别" />
		<k:column field="birthDay" align="center" title="生日" />
		<k:column field="phone" title="分机号" />
		<k:column field="mobile" title="手机号" />
		<k:column field="email" title="电子邮箱" />
		<k:column field="userId" align="center" title="登录账号" formatter="jctx.formaterUser" />
		<k:column field="statusName" align="center" title="状态" />
	</k:datagrid>
	<div id="tb">
		<k:linkbutton id="add" iconCls="icon-add" plain="true" text="新增账号" onClick="jctx.newEmployee()" />
		<k:linkbutton id="edit" iconCls="icon-edit" plain="true" text="编辑账号" onClick="jctx.editEmployee()" />
		<div style="float:right;">
			<k:searchbox id="search" prompt="搜索：工号、姓名、手机号、邮箱" width="220" height="25" searcher="jctx.search" />
		</div>
	</div>
</k:section>

<%@ include file="/shared/_list.jsp"%>