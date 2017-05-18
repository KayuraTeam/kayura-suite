<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">公司资料</k:section>

<k:section name="head">
	<script type="text/javascript">
	
	var jctx = (function(){
		
		var isSaved = 0;
		
		function _closePage(){
			juasp.closeWin(isSaved);
		}

		function _submitForm() {
			
			$('#ff').form('submit', {
				url : '${ROOT}/org/employee/save.json',
				onlySuccess : function(r){
					isSaved = 1;
					if($("#autoNew").is(':checked')){
						$("#ff").form("reset");
					} else {
						_closePage();
					}
				}
			});
		}
		
		return {
			submitForm : _submitForm,
			closePage: _closePage
		};
		
	}());
	
	</script>
</k:section>

<!-- 编辑内容区域 body -->
<k:section name="body">
	<k:form id="ff">
		<k:hidden id="employeeId" value="${model.employeeId}"/>
		<table cellpadding="5">
			<tr>
				<td>工号:</td>
				<td><k:textbox id="code" value="${model.code}" style="width:180px;" validType="length[1,32]" required="true" /></td>
			</tr>
			<tr>
				<td>姓名:</td>
				<td><k:textbox id="name" value="${model.name}" style="width:180px;" validType="length[1,32]" required="true" /></td>
			</tr>
			<tr>
				<td>性别:</td>
				<td>
					<k:combobox id="sex" value="${model.sex}"  panelHeight="50px">
						<k:option label="男" value="1" />
						<k:option label="女" value="0" />
					</k:combobox>
				</td>
			</tr>
			<tr>
				<td>出生日期:</td>
				<td><k:databox id="birthDay" value="${model.birthDay}" style="width:180px;" /></td>
			</tr>
			<tr>
				<td>分机:</td>
				<td><k:textbox id="phone" value="${model.phone}" style="width:180px;" validType="length[1,64]" /></td>
			</tr>
			<tr>
				<td>手机:</td>
				<td><k:textbox id="mobile" value="${model.mobile}" style="width:180px;" validType="length[11,64]" /></td>
			</tr>
			<tr>
				<td>电子邮箱:</td>
				<td><k:textbox id="email" value="${model.email}" style="width:180px;" validType="email" /></td>
			</tr>
			<tr>
				<td>是否启用:</td>
				<td>
					<k:combobox id="status" value="${model.status}"  panelHeight="50px">
						<k:option label="启用" value="1" />
						<k:option label="禁用" value="0" />
					</k:combobox>
				</td>
			</tr>
		</table>
	</k:form>
</k:section>

<!-- 工具栏区域 tool -->
<k:section name="tool">
	<c:if test="${empty model.employeeId}">
	<div style="float: left; margin-left: 10px;">
		<label for="autoNew"><input type="checkbox" id="autoNew">提交完成后新增下一条</label>
	</div>
	</c:if>
	<k:linkbutton style="width:80px" iconCls="icon-ok" onClick="jctx.submitForm()" text="提交" /><span />
	<k:linkbutton style="width:80px" iconCls="icon-cancel" onClick="jctx.closePage()" text="取消" />
</k:section>

<%@ include file="/views/shared/_dialog.jsp"%>