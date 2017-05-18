<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">角色编辑</k:section>
<k:section name="head"></k:section>

<!-- 编辑内容区域 body -->
<k:section name="body">
	<k:form id="ff" url="${ROOT}/auth/role/save.json" success="(d){ juasp.closeWin(1) }">
		<k:hidden id="roleId" value="${model.roleId}"/>
		<table cellpadding="5">
			<tr>
				<td>角色名</td>
				<td><k:textbox id="name" width="180px" value="${model.name}" required="true" /></td>
			</tr>
			<tr>
				<td>是否启用:</td>
				<td><k:switchbutton id="enabled" checked="${model.enabled}" /></td>
			</tr>
		</table>
	</k:form>
</k:section>

<!-- 工具栏区域 tool -->
<k:section name="tool">
	<k:linkbutton style="width:80px" iconCls="icon-ok" onClick="$('#ff').form('submit')" text="提交" /><span />
	<k:linkbutton style="width:80px" iconCls="icon-cancel" onClick="juasp.closeWin(0)" text="取消" />
</k:section>

<%@ include file="/views/shared/_dialog.jsp"%>