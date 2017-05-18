<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">任务表单（自动表单）</k:section>
<k:section name="head">
</k:section>

<k:section name="body">
	<h2>处理任务 — [${model.task.name}]</h2>
	<k:form id="ff" url="${ROOT}/bpm/task/handler.json" success="(data){ juasp.closeWin(1) }">
		<k:hidden id="id" value="${model.task.id}"/>
		<k:autoform formAttributes="${props}"/>
	</k:form>
</k:section>

<k:section name="tool">
	<k:linkbutton style="width:80px" iconCls="icon-ok" onClick="$('#ff').form('submit')" text="提交" /><span />
	<k:linkbutton style="width:80px" iconCls="icon-cancel" onClick="juasp.closeWin(0)" text="取消" />
</k:section>

<%@ include file="/views/shared/_dialog.jsp"%>