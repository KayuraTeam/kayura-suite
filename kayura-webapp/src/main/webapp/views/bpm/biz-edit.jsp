<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">数据词典管理</k:section>
<k:section name="head">
	<k:resource location="res/js" name="jbpm-activiti.js"/>
	<script type="text/javascript">
		$(function(){

		});
	</script>
</k:section>

<k:section name="body">
	<k:form id="ff" url="${RESTROOT}/bizform/save" method="POST" success="(d){ juasp.closeWin(1); }">
		<k:hidden id="id" value="${model.id}" />
		<k:hidden id="tenantId" value="${model.tenantId}" />
		<div id="bpmnRoot"></div>
		<table cellpadding="5">
			<tr>
				<td>表单编码:</td>
				<td><k:textbox name="code" width="180px" value="${model.code}" required="true" validType='length[1,32]' /></td>
			</tr>
			<tr>
				<td>显示名称:</td>
				<td><k:textbox name="displayName" width="180px" value="${model.displayName}" required="true" validType='length[1,128]' /></td>
			</tr>
			<tr>
				<td>流程键:</td>
				<td><k:textbox name="processKey" width="180px" value="${model.processKey}" required="true" validType='length[1,32]' /></td>
			</tr>
			<tr>
				<td>排序值:</td>
				<td><k:numberspinner name="serial" width="180px" value="${model.serial}" required="true" min="0" max="9999" /></td>
			</tr>
			<tr>
				<td>描述:</td>
				<td><k:textbox name="description" width="180px" value="${model.description}" height="50px" multiline="true" validType='length[1,32]' /></td>
			</tr>
			<tr>
				<td>表单类型:</td>
				<td><k:combobox id="type" width="180px" panelHeight="auto" editable="false" value="${model.type}" required="true">
						<k:option value="0" label="业务表单" />
						<k:option value="1" label="自定表单" />
						<k:option value="2" label="自动表单" />
					</k:combobox>
				</td>
			</tr>
			<tr>
				<td>状态:</td>
				<td><k:combobox id="status" width="180px" panelHeight="auto" editable="false" value="${model.status}" required="true">
						<k:option value="0" label="设计" />
						<k:option value="1" label="运行" />
						<k:option value="2" label="作废" />
					</k:combobox>
				</td>
			</tr>
		</table>
	</k:form>
</k:section>

<k:section name="tool">
	<k:linkbutton style="width:80px" iconCls="icon-ok" onClick="$('#ff').form('submit')" text="提交" /><span />
	<k:linkbutton style="width:80px" iconCls="icon-cancel" onClick="juasp.closeWin(0)" text="取消" />
</k:section>

<%@ include file="/views/shared/_dialog.jsp"%>