<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">Panel 标签</k:section>

<k:section name="head">
	<k:resource location="res" name="js/juasp-uploader.js"></k:resource>
</k:section>

<k:section name="body">		
	<k:panel title="ValidateBoxTag 示例" width="100%" padding="10px 30px 10px 30px" collapsible="true">
		<table cellpadding="3">
			<tr>
				<td style="width:75px">姓名：</td>
				<td style="width:150px"><k:validatebox id="name" classStyle="textbox" required="true" validType="length[1,30]" /></td>
				<td>&lt;k:validatebox id="name" classStyle="textbox" required="true" validType="length[1,30]" /&gt;</td>
			</tr>
			<tr>
				<td>电子邮件：</td>
				<td><k:validatebox id="email" classStyle="textbox" required="true" validType="email" /></td>
				<td>&lt;k:validatebox id="email" classStyle="textbox" required="true" validType="email" /&gt;</td>
			</tr>
			<tr>
				<td>网站地址：</td>
				<td><k:validatebox id="url" classStyle="textbox" required="true" validType="url" /></td>
				<td>&lt;k:validatebox id="url" classStyle="textbox" required="true" validType="url" /&gt;</td>
			</tr>
			<tr>
				<td>新密码：</td>
				<td><k:validatebox id="pwd" type="password" classStyle="textbox" required="true" validType="length[6,12]" /></td>
				<td>&lt;k:validatebox id="pwd" type="password" classStyle="textbox" required="true" validType="length[6,12]" /&gt;</td>
			</tr>
			<tr>
				<td>确认密码：</td>
				<td><k:validatebox id="rpwd" type="password" classStyle="textbox" required="true" validType="length[6,12]" /></td>
				<td>&lt;k:validatebox id="rpwd" type="password" classStyle="textbox" required="true" validType="length[6,12]" /&gt;</td>
			</tr>
		</table>
	</k:panel>
	<div style="height: 5px"></div>
	<k:panel title="Combo 示例" padding="10px 30px 10px 30px" collapsible="true">
		<table cellpadding="3">
			<tr>
				<td style="width:75px">ComboTree：</td>
				<td style="width:150px">
					<k:combotree id="tree1" url="${ROOT}/example/tags/treedata.json" onlyLeafCheck="true" multiple="true" 
						required="true" cascadeCheck="true" panelWidth="250" panelHeight="350"></k:combotree>
				</td>
				<td>
					&lt;k:combotree id="tree1" url="${ROOT}/example/tags/treedata.json" onlyLeafCheck="true" multiple="true" 
						required="true" cascadeCheck="true" panelWidth="250" panelHeight="350"&gt;&lt;/k:combotree&gt;
				</td>
			</tr>
			<tr>
				<td>ComboGrid：</td>
				<td>
					<k:combogrid id="grid1" url="${ROOT}/example/general/customer/find.json" idField="id" textField="name"
						panelWidth="480" panelHeight="auto" mode="remote" required="true"
						columns="[[{field:'name',title:'Company Name'},{field:'contactName',title:'Contact Name'}]]"></k:combogrid>
				</td>
				<td>
					&lt;k:combogrid id="grid1" url="${ROOT}/example/general/customer/find.json" idField="id" textField="name"
						panelWidth="480" panelHeight="auto" mode="remote" required="true" editable="false"
						columns="[[{field:'name',title:'Company Name'},{field:'contactName',title:'Contact Name'}]]"&gt;&lt;/k:combogrid&gt;
				</td>
			</tr>
		</table>
	</k:panel>
	<style scoped>
		.textbox{ height:20px; margin:0px; padding:0 2px; box-sizing:content-box; }
	</style>
</k:section>

<%@ include file="shared/_simple.jsp"%>