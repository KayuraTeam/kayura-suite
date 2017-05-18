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
	<k:form id="ff" url="${RESTROOT}/form/model/saveinfo" method="POST" success="(d){ juasp.closeWin(1); }">
		<k:hidden id="id" value="${model.modelId}" />
		<k:hidden id="tenantId" value="${model.tenantId}" />
		<k:hidden id="creator" value="${model.creator}"/>
		<k:hidden id="formKey" value="${model.formKey}"/>
		<k:hidden id="status" value="${model.status}"/>
		<div id="bpmnRoot"></div>
		<table cellpadding="5">
			<tr>
				<td>表单KEY:</td>
				<td>${model.formKey}</td>
			</tr>
			<tr>
				<td>表单编码:</td>
				<td><k:textbox name="code" width="180px" value="${model.code}" required="true" validType='length[1,32]' /></td>
			</tr>
			<tr>
				<td>标题:</td>
				<td><k:textbox name="title" width="180px" value="${model.title}" required="true" validType='length[1,128]' /></td>
			</tr>
			<tr>
				<td>描述:</td>
				<td><k:textbox multiline="true" name="description" height="50px" width="180px" value="${model.description}" /></td>
			</tr>
			<tr>
				<td>表单类型:</td>
				<td><k:combobox id="type" width="180px" panelHeight="auto" editable="false" value="${model.type}" required="true">
						<k:option value="0" label="PC表单" />
						<k:option value="1" label="Phone表单" />
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