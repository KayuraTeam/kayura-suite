<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">启动表单（自动表单）</k:section>
<k:section name="head">
</k:section>

<k:section name="body">
	<h2>启动流程 — [${model.processDefinition.name}]，版本号：${model.processDefinition.version}</h2>
	<k:form id="ff" url="${ROOT}/bpm/proc/start.json" success="(data){ juasp.closeWin(1) }">
		<k:hidden id="processDefinitionId" value="${model.processDefinition.id}" />
		<k:autoform formAttributes="${props}"/>
	</k:form>
</k:section>

<k:section name="tool">
	<k:linkbutton style="width:80px" iconCls="icon-ok" onClick="$('#ff').form('submit')" text="启动流程" /><span />
	<k:linkbutton style="width:80px" iconCls="icon-cancel" onClick="juasp.closeWin(0)" text="取消" />
</k:section>

<%@ include file="/views/shared/_dialog.jsp"%>