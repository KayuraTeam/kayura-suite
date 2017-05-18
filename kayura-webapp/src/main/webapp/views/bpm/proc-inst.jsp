<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">账号管理</k:section>

<k:section name="head">
	<script type="text/javascript">
	
		$(function(){ 
			jctx.init(); 
		});
		
		var jctx = (function($, win){
			
			function _init() {
				
				$('#tg').datagrid({
					url: "${ROOT}/bpm/proc/find.json",
					queryParams: {
						keyword : $('#search').val()
					},
					rowStyler: function(index, row){
						
					},
					onDblClickRow : function(idx, row){
						
					}
				});
			}
			
			function _search(){
				
				$('#tg').datagrid('load', {
					keyword : $('#search').val()
				});
			}
			
			return {
				
				init: _init,
				search: _search
			};
			
		}(jQuery, window));
		
		function formaterDiagram(value, row, index){

			return "<a href='${ROOT}/bpm/proc/res?t=2&id=" + row.id + "' target='_blank'>"+row.diagramResourceName + "</a>";
		}
		
	</script>
</k:section>

<k:section name="body">
	<k:datagrid id="tg" fit="true" rownumbers="true"
		pagination="true" pageSize="10" singleSelect="true" striped="true"
		toolbar="#tb" idField="id">
		<k:column field="ck" checkbox="true" />
		<k:column field="name" width="240" title="流程名称" />
		<k:column field="category" width="180" title="流程分类" />
		<k:column field="version" width="180" title="版本号" />
		<k:column field="resourceName" width="180" title="流程名" formatter="formaterProcess" />
		<k:column field="suspended" width="80" title="暂停" />
	</k:datagrid>
	<div id="tb">
		<k:linkbutton id="deploy" iconCls="icon-add" plain="true" text="上传流程" onClick="jctx.deploy()" />
		<k:linkbutton id="edit" iconCls="icon-edit" plain="true" text="编辑流程" onClick="jctx.edit()" />
		<div style="float: right;">
			<k:searchbox id="search" prompt="搜索：流程名称" width="220" height="25" searcher="jctx.search" />
		</div>
	</div>
</k:section>

<%@ include file="/shared/_list.jsp"%>