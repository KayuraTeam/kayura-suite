<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">表单定义</k:section>

<k:section name="head">
	<k:resource location="res/js" name="jbpm-activiti.js"/>
	<script type="text/javascript">
	
		$(function(){ 
			jctx.init(); 
		});
		
		var jctx = (function($, win){
			
			function _init() {
				
				$('#tg').datagrid({
					url: juasp.RESTROOT + "/mockorder/find",
					queryParams: {
						tenantId : "${tenantId}",
						keyword : $('#search').val()
					}
				});
			}
			
			function _search(){
				
				$('#tg').datagrid('load', {
					tenantId : "${tenantId}",
					keyword : $('#search').val()
				});
			}
			
			function _create(){
				
				juasp.openWin({
					url: juasp.APPROOT + "/mock/order/new",
					width: "450px",
					height: "500px",
					title: "创建表单项",
					onClose : function(result){
						if(result == 1){
							_search();
						}
					}
				});
			}
			
			function _edit(){
				
				var row = $('#tg').datagrid("getSelected");
				if(row != null){
					
					juasp.openWin({
						url: juasp.APPROOT + "/mock/order/edit?id=" + row.id,
						width: "450px",
						height: "500px",
						title: "编辑表单",
						maximized: true,
						onClose : function(result){
							if(result == 1){
								_search();
							}
						}
					});
				}
			}
			
			function _remove(){
				
				var row = $('#tg').datagrid("getSelected");
				if(row != null){
					
					juasp.confirm("是否确认删除表单定义【" + row.title + "】的记录。", 
						function(r) {
							if (r == true) {
								juasp.ajaxDelete({
									url: juasp.RESTROOT + "/mockorder/" + row.id + "/remove", 
									data: { },
									ajaxComplete : function(xhr){
										juasp.infoTips(row.displayName + " 删除完成。");
										_search();
									}
								});
							}
					});
				}
			}
						
			return {
				init: _init,
				create: _create,
				edit: _edit,
				remove: _remove,
				search: _search,
			};
			
		}(jQuery, window));
		
	</script>
</k:section>

<k:section name="body">
	<k:datagrid id="tg" fit="true" rownumbers="true" method="GET"
		pagination="true" pageSize="10" singleSelect="true" striped="true"
		toolbar="#tb" idField="id">
		<k:column field="ck" checkbox="true" />
		<k:column field="code" title="编码" />
		<k:column field="title" title="标题" />
		<k:column field="creatorName" title="创建人" />
		<k:column field="createTime" title="创建时间" />
		<k:column field="actions" title="状态" />
	</k:datagrid>
	<div id="tb">
		<k:linkbutton id="newBiz" iconCls="icon-add" plain="true" text="创建表单" onClick="jctx.create()" />
		<k:linkbutton id="editBiz" iconCls="icon-edit" plain="true" text="编辑表单" onClick="jctx.edit()" />
		<k:linkbutton id="removeBiz" iconCls="icon-remove" plain="true" text="删除表单" onClick="jctx.remove()" />
		<div style="float: right;">
			<k:searchbox id="search" prompt="搜索：编号、显示名、描述" width="220" height="25" searcher="jctx.search" />
		</div>
	</div>
</k:section>

<%@ include file="/shared/_list.jsp"%>