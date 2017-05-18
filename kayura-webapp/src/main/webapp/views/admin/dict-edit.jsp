<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">数据词典管理</k:section>
<k:section name="head">
</k:section>

<k:section name="body">
	<k:form id="ff" url="${ROOT}/admin/dict/save.json" success="function(data){ juasp.closeWin(1) }">
		<k:hidden id="id" value="${model.id}" />
		<k:hidden id="dictId" value="${model.dictId}" />
		<k:hidden id="parentId" value="${model.parentId}" />
		<table cellpadding="5">
			<tr>
				<td>所属词典:</td>
				<td>${model.dictName}</td>
			</tr>
			<c:if test="${treeType}">
			<tr>
				<td>上级词典:</td>
				<td>${model.parentName}</td>
			</tr>
			</c:if>
			<tr>
				<td>词典名称:</td>
				<td><k:textbox name="name" width="180px" value="${model.name}" required="true" validType='length[1,32]' /></td>
			</tr>
			<tr>
				<td>词典值:</td>
				<td><k:textbox name="value" width="180px" value="${model.value}" required="true" validType='length[1,1024]' /></td>
			</tr>
			<tr>
				<td>排序值:</td>
				<td><k:numberbox name="serial" style="width:180px" value="${model.serial}" required="true" min="0" precision="0" /></td>
			</tr>
		</table>
	</k:form>
</k:section>

<k:section name="tool">
	<k:linkbutton style="width:80px" iconCls="icon-ok" onClick="$('#ff').form('submit')" text="提交" /><span />
	<k:linkbutton style="width:80px" iconCls="icon-cancel" onClick="juasp.closeWin(0)" text="取消" />
</k:section>

<%@ include file="/views/shared/_dialog.jsp"%>