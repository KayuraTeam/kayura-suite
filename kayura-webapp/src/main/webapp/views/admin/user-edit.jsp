<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<k:section name="title">用户管理</k:section>
<k:section name="head"></k:section>

<!-- 编辑内容区域 body -->
<k:section name="body">
<k:form id="ff" url="${ROOT}/admin/user/save.json" success="(d){ juasp.closeWin(1); }">
	<k:hidden id="userId" value="${model.userId}"/>
	<table cellpadding="5">
		<tr>
			<td>登录名</td>
			<td><k:textbox id="userName" width="180px" value="${model.userName}" required="true" /></td>
			<td></td>
		</tr>
		<tr>
			<td>显示名:</td>
			<td><k:textbox id="displayName" width="180px" value="${model.displayName}" required="true" /></td>
			<td></td>
		</tr>
		<c:if test="${empty model.userId}">
		<tr>
			<td>初始密码:</td>
			<td><k:textbox id="password" width="180px" required="true" /></td>
			<td></td>
		</tr>
		</c:if>
		<tr>
			<td>电子邮件:</td>
			<td><k:textbox id="email" width="180px" value="${model.email}" required="true" validType="email" /></td>
			<td></td>
		</tr>
		<tr>
			<td>手机号:</td>
			<td><k:textbox id="mobileNo" width="180px" value="${model.mobileNo}" required="true" validType="length[11,11]" /></td>
			<td></td>
		</tr>
		<tr>
			<td>关键字:</td>
			<td><k:textbox id="keyword" width="180px" value="${model.keyword}" /></td>
			<td></td>
		</tr>
		<tr>
			<td>过期时间:</td>
			<td><k:databox id="expireTime" width="180px" value="${model.expireTime}" /></td>
			<td></td>
		</tr>
		<tr>
			<td>所属角色:</td>
			<td><k:combobox id="roles" width="180px" height="auto" value="${model.roles}" multiple="true" required="true">
					<k:option>ROOT</k:option>
					<k:option>ADMIN</k:option>
					<k:option>USER</k:option>
				</k:combobox>
			</td>
			<td>可选：ROOT,ADMIN,USER。默认为USER</td>
		</tr>
		<tr>
			<td>是否启用:</td>
			<td><k:switchbutton id="isEnabled" checked="${model.isEnabled}" /></td>
			<td></td>
		</tr>
		<tr>
			<td>是否锁定:</td>
			<td><k:switchbutton id="isLocked" checked="${model.isLocked}" /></td>
			<td></td>
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