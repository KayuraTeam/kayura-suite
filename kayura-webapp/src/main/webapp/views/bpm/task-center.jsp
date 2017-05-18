<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">任务中心</k:section>

<k:section name="head">
	<k:resource location="res/js" name="jbpm-activiti.js"/>
</k:section>

<k:section name="body">
	<c:import url="task-list.jsp"></c:import>
	<script type="text/javascript">
/* 		$(function(){
			setTimeout(function() {
				var el = $(".panel .datagrid").children(".panel-body-noheader");
				console.log(el.length);
				$(el).removeClass("panel-body-noheader");
			}, 1000);
		}); */
	</script>
</k:section>

<%@ include file="/shared/_list.jsp"%>