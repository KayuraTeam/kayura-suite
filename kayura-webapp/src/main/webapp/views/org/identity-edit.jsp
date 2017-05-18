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
				url : '${ROOT}/org/identity/save.json',
				onlySuccess : function(r){
			<c:choose>
				<c:when test="${empty model.identityId}">
					if($("#autoNew").is(':checked')){
						$("#ff").form("reset");
					} else {
						juasp.closeWin(data);
					}
					isSaved = 1;
				</c:when>
				<c:otherwise>
					juasp.closeWin(1);
				</c:otherwise>
			</c:choose>
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
		<k:hidden id="identityId" value="${model.identityId}"/>
		<k:hidden id="employeeId" value="${emp.employeeId}"/>
		<k:hidden id="departmentId" value="${model.departmentId}"/>
		<k:hidden id="positionId" value="${model.positionId}"/>
		<table cellpadding="5">
			<c:if test="${model.departmentName != null}">
			<tr>
				<td>所属部门:</td>
				<td>${model.departmentName}</td>
			</tr>
			</c:if>
			<c:if test="${model.positionName != null}">
			<tr>
				<td>所属岗位:</td>
				<td>${model.positionName}</td>
			</tr>
			</c:if>
			<tr>
				<td>工号:</td>
				<td><k:textbox id="code" value="${emp.code}" style="width:180px;" validType="length[1,32]" required="true" /></td>
			</tr>
			<tr>
				<td>姓名:</td>
				<td><k:textbox id="name" value="${emp.name}" style="width:180px;" validType="length[1,32]" required="true" /></td>
			</tr>
			<tr>
				<td>性别:</td>
				<td><k:textbox id="sex" value="${emp.sex}" style="width:180px;" validType="length[1,32]" /></td>
			</tr>
			<tr>
				<td>出生日期:</td>
				<td><k:databox id="birthDay" value="${emp.birthDay}" style="width:180px;" /></td>
			</tr>
			<tr>
				<td>分机:</td>
				<td><k:textbox id="phone" value="${emp.phone}" style="width:180px;" validType="length[1,64]" /></td>
			</tr>
			<tr>
				<td>手机:</td>
				<td><k:textbox id="mobile" value="${emp.mobile}" style="width:180px;" validType="length[11,64]" /></td>
			</tr>
			<tr>
				<td>电子邮箱:</td>
				<td><k:textbox id="email" value="${emp.email}" style="width:180px;" validType="email" /></td>
			</tr>
			<tr>
				<td>是否启用:</td>
				<td>
					<k:combobox id="status" value="${emp.status}"  panelHeight="50px">
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
	<c:if test="${empty model.identityId}">
	<div style="float: left; margin-left: 10px;">
		<label for="autoNew"><input type="checkbox" id="autoNew">提交完成后新增下一条</label>
	</div>
	</c:if>
	<k:linkbutton style="width:80px" iconCls="icon-ok" onClick="jctx.submitForm()" text="提交" /><span />
	<k:linkbutton style="width:80px" iconCls="icon-cancel" onClick="jctx.closePage()" text="取消" />
</k:section>

<%@ include file="/views/shared/_dialog.jsp"%>