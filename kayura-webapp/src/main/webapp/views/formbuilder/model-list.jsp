<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">账号管理</k:section>

<k:section name="head">
	<k:resource location="res/js" name="jbpm-activiti.js" />
	<script type="text/javascript">
	
		$(function(){ 
			jctx.init(); 
		});
		
		var jctx = (function($, win){
			
			var selectedNode = null;
			
			function _init() {
				
				$('#tv').tree({
					url : JBPMN.BPMNROOT + "/bizform/tree?tenantId=${tenantId}",
					method : "GET",
					loadFilter : function(r) { 
						return r;
					},
					onClick : function(node) {
						_clickNode(node);
					}
				});
				
				$('#tg').datagrid({
					url: juasp.RESTROOT + "/form/model/find",
					method : "GET",
					queryParams: {
						keyword: $('#search').val()
					}
				});
				
			}
			
			function _clickNode(node){
				
				selectedNode = node;
				_search();
			}
			
			function _search(){
				
				var formKey = "", status="";
				if(selectedNode != null){
					formKey = selectedNode.attributes['code'];
					status = selectedNode.attributes['type'];
				}
				
				$('#tg').datagrid('unselectAll');
				$('#tg').datagrid('load', {
					"tenantId" : "${tenantId}",
					"formKey" : formKey,
					"status" : status,
					"keyword" : $('#search').val()
				});
			}
			
			function _create(){
				
				var formKey = "";
				if(selectedNode != null){
					formKey = selectedNode.attributes['code'];
				}
				
				juasp.openWin({
					url: "${ROOT}/formbuilder/" + formKey + "/create",
					width: "450px",
					height: "300px",
					title: "创建新表单",
					onClose : function(r){
						if(r.result == 1){
							_search();
						}
					}
				});
			}
			
			function _preview(){

				var row = $('#tg').datagrid("getSelected");
				if(row != null){
					// /form/build/{formKey}/{code}/{view}
					juasp.openWin({
						url: "${ROOT}/form/preview/" + row.modelId + "/dd",
						width: "550px",
						height: "750px",
						title: "创建新表单",
						onClose : function(r){
							if(r.result == 1){
								_search();
							}
						}
					});
				}
			}
			
			function _play(){
				
				var row = $('#tg').datagrid("getSelected");
				if(row != null){
					juasp.openWin({
						url: "${ROOT}/form/start/" + row.modelId + "/dd",
						width: "550px",
						height: "750px",
						title: "创建新表单",
						onClose : function(r){
							if(r.result == 1){
								_search();
							}
						}
					});
				}
			}
			
			function _design(){
				
				var row = $('#tg').datagrid("getSelected");
				if(row != null){
					if(row.type == 1){
						win.open("${ROOT}/formbuilder/mobile?modelId=" + row.modelId);
					} else {
						alert("跳转至PC表单设计器(尚未开发)");
					}
				}
			}
			
			function _deploy(){
				
				var row = $('#tg').datagrid("getSelected");
				if(row != null){
					juasp.confirm("<b>是否确认将该流程</b> 【" + row.title + " 】个布署为运行状态。</b>", 
						function(r) {
							if (r == true) {
								juasp.ajaxPost({
									url: juasp.RESTROOT + "/form/model/" + row.modelId + "/deploy", 
									ajaxComplete : function(xhr) {
										juasp.infoTips("流程布署成功。");
										_search(); 
									}
								});
							}
						}
					);
				};
			}
			
			function _remove(){
				
				var row = $('#tg').datagrid("getSelected");
				if(row != null){
					
					juasp.confirm("是否确认表单模型【" + row.title + "】记录。", 
						function(r) {
							if (r == true) {
								juasp.ajaxDelete({
									url: juasp.RESTROOT + "/form/model/" + row.modelId + "/remove",
									ajaxComplete : function(xhr) {
										juasp.infoTips("表单模型删除成功。");
										_search();
									}
								});
							}
						}
					);
				}
			}
			
			function _start(){
				
				var row = $('#tg').datagrid("getSelected");
				if(row != null){
					
					var key = "", type="";
					if(selectedNode != null){
						key = selectedNode.attributes['key'];
						type = selectedNode.attributes['type'];
					}
					
					if(type != 1) {
						juasp.errorTips("只能启动[发布]状态的流程。");
						return;
					}
					
					juasp.openWin({
						url: "${ROOT}/bpm/proc/form/start?id=" + row.id,
						width: "550px",
						height: "600px",
						title: "启动流程",
						onClose : function(result){
							if(result == 1){
		
							}
						}
					});
				}
			}

			return {
				
				init: _init,
				create: _create,
				design: _design,
				remove: _remove,
				search: _search,
				deploy: _deploy,
				start: _start,
				preview: _preview,
				play: _play
			};
			
		}(jQuery, window));
		
	</script>
</k:section>

<k:section name="body">
	<k:dock region="center" border="false" style="padding: 2px;">
	<k:layout id="ctx" fit="true">
		<k:dock region="west" split="true" border="true" style="padding: 10px; width: 200px;">
			<k:tree id="tv" />
		</k:dock>
		<k:dock region="center" border="false">
			<k:datagrid id="tg" fit="true" rownumbers="true"
				pagination="true" pageSize="10" singleSelect="true" striped="true"
				toolbar="#tb" idField="modelId">
				<k:column field="ck" checkbox="true" />
				<k:column field="formKey" title="表单键" />
				<k:column field="code" title="编码" />
				<k:column field="title" title="标题" />
				<k:column field="typeName" title="平台类型" />
				<k:column field="description" title="描述" />
				<k:column field="version" title="版本号" />
			</k:datagrid>
			<div id="tb">
				<k:linkbutton id="create" iconCls="icon-add" plain="true" text="创建模型" onClick="jctx.create()" />
				<k:linkbutton id="edit" iconCls="icon-design" plain="true" text="设计模型" onClick="jctx.design()" />
				<k:linkbutton id="remove" iconCls="icon-remove" plain="true" text="删除模型" onClick="jctx.remove()" />
				<k:linkbutton id="deploy" iconCls="icon-flag" plain="true" text="布署模型" onClick="jctx.deploy()" />
				<k:linkbutton id="deploy" iconCls="icon-preview" plain="true" text="生成预览" onClick="jctx.preview()" />
				<k:linkbutton id="play" iconCls="icon-play" plain="true" text="运行表单" onClick="jctx.play()" />
				<div style="float: right;">
					<k:searchbox id="search" prompt="搜索：流程名称" width="220" height="25" searcher="jctx.search" />
				</div>
			</div>
		</k:dock>
	</k:layout>
	</k:dock>
</k:section>

<%@ include file="/views/shared/_simple.jsp"%>