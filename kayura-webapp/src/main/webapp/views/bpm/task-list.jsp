<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:datagrid disabledTag="true" id="tg" fit="true" rownumbers="true" border="false" 
	pagination="true" pageSize="10" singleSelect="true" striped="true"
	toolbar="#tb" idField="id" method="GET" >
	<k:column field="title" title="任务标题" formatter="jtasklist.formaterTitle" />
	<k:column field="name" title="环节名称" />
	<k:column field="createTime" title="创建时间" />
	<k:column field="id" title="操作项" align="center" formatter="jtasklist.formaterActions"/>
</k:datagrid>
<div id="tb">
	<k:searchbox menu="#mm" height="25" width="300px" prompt="搜索：任务名称" searcher="jtasklist.search" />
	<k:menu id="mm" style="width:150px">
		<k:menuitem name="item1" iconCls="icon-ok">已签收任务</k:menuitem>
		<k:menuitem name="item2" iconCls="icon-save">未签收任务</k:menuitem>
		<k:menuitem name="item3" iconCls="icon-cancel">紧急任务</k:menuitem>
	</k:menu>
</div>
<script type="text/javascript">

	var jtasklist = (function($, win){

		function _init(){ 
			$('#tg').datagrid({
				url : JBPMN.BPMNROOT + "/task/${userId}/find"
			});
		}
		
		function _search() {
			$('#tg').datagrid('load', {
				keyword : $('#search').val()
			});
		}
		
		function _taskclaim(id) {
			
			juasp.ajaxPost({
				url: JBPMN.BPMNROOT + "/task/" + id + "/${userId}/claim",
				ajaxComplete: function(r) {
					juasp.infoTips("任务签收完成.");
					_search();
				}
			});
		}
		
		function _taskunclaim(id){
			
			juasp.ajaxPost({
				url: JBPMN.BPMNROOT + "/task/" + id + "/unclaim",
				ajaxComplete: function(r) {
					juasp.infoTips("任务反签收完成.");
					_search();
				}
			});
		}
		
		function _taskread(id) {
			
			juasp.openWin({
				url: "${ROOT}/bpm/task/read?id=" + id,
				width: "550px",
				height: "600px",
				title: "处理任务",
				onClose : function(result){
					if(result == 1){
						_search();
					}
				}
			});
		}
		
		function _formaterActions(value, row, index){
			
 			if(juasp.isEmpty(row.assignee)){
				return "<a href='###' onclick=\"jtasklist.taskclaim('"+ row.id + "')\" >签收</a>";
			} else {
				return "<a href='###' onclick=\"jtasklist.taskunclaim('"+ row.id + "')\" >反签收</a>" + 
					 "&nbsp;<a href='###' onclick=\"jtasklist.taskread('"+ row.id + "')\" >处理</a>";
			}
		}
		
		function _formaterTitle(value, row, index) {
			var title = row.variables['title'];
			if (typeof title != undefined) {
				return row.name + "(" + row.variables['title'] + ")";
			}
			return row.name;
		}

		return {
			init : _init,
			search : _search,
			taskclaim : _taskclaim,
			taskunclaim : _taskunclaim,
			taskread : _taskread,
			formaterActions : _formaterActions,
			formaterTitle : _formaterTitle
		};

	}(jQuery, window));

	$(function() {
		jtasklist.init();
	});
</script>