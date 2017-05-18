<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">创建新流程</k:section>
<k:section name="head">
	<k:resource location="res/js" name="jbpm-activiti.js"/>
	<script type="text/javascript">
		$(function(){
			$('#ff').form('submit', {
				url : JBPMN.BPMNROOT + "/model/create",
				success : function(r){
					juasp.closeWin({result: 1});
				}
			});
		});
	</script>
</k:section>

<k:section name="body">
	<k:form id="ff">
		<k:hidden id="key" value="${key}"/>
		<k:hidden id="tenantId" value="${tenantId}"/>
		<table cellpadding="5" style="width: 100%">
			<tr>
				<td>流程名称:</td>
				<td><k:textbox name="name" width="85%" required="true" validType='length[1,32]' /></td>
			</tr>
			<tr>
				<td>流程描述:</td>
				<td><k:textbox name="desc" width="85%" multiline="true" height="45px" validType='length[1,1024]' /></td>
			</tr>
		</table>
	</k:form>
</k:section>

<k:section name="tool">
	<k:linkbutton style="width:80px" iconCls="icon-ok" onClick="$('#ff').form('submit')" text="提交" /><span />
	<k:linkbutton style="width:80px" iconCls="icon-cancel" onClick="juasp.closeWin({result: 0})" text="取消" />
</k:section>

<%@ include file="/views/shared/_dialog.jsp"%>