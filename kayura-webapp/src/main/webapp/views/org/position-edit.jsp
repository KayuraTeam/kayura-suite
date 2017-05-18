<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">公司资料</k:section>

<k:section name="head">
	<script type="text/javascript">
	var jctx = (function(){
		
		var events = juasp.getEvents({
			onSaved: function(){ }
		});
		
		function _submitForm() {
			$('#ff').form('submit', {
				url : '${ROOT}/org/position/save.json',
				onlySuccess : function(r){
					var t = $("#name").textbox("getValue");
					var data = { result: 1, 'id': r.data.id, text: t};
					if(events.onSaved){
						events.onSaved(data);
					}
			<c:choose>
				<c:when test="${empty model.positionId}">
					if($("#autoNew").is(':checked')){
						$("#ff").form("reset");
					} else {
						juasp.closeWin(data);
					}
				</c:when>
				<c:otherwise>
					juasp.closeWin(data);
				</c:otherwise>
			</c:choose>
				}
			});
		}
		
		return {
			submitForm : _submitForm
		};
		
	}());
	
	</script>
</k:section>

<!-- 编辑内容区域 body -->
<k:section name="body">
	<k:form id="ff">
		<k:hidden id="positionId" value="${model.positionId}"/>
		<k:hidden id="departmentId" value="${model.departmentId}"/>
		<table cellpadding="5">
			<tr>
				<td>所属部门:</td>
				<td>${model.departmentName}</td>
			</tr>
			<tr>
				<td>岗位代码:</td>
				<td><k:textbox id="code" value="${model.code}" style="width:180px;" validType="length[1,32]" required="true" /></td>
			</tr>
			<tr>
				<td>岗位名称:</td>
				<td><k:textbox id="name" value="${model.name}" style="width:180px;" validType="length[1,32]" required="true" /></td>
			</tr>
			<tr>
				<td>岗位级别:</td>
				<td><k:combobox id="level" value="${model.level}">
						<k:option label="1级" value="1"></k:option>
						<k:option label="2级" value="2"></k:option>
						<k:option label="3级" value="3"></k:option>
						<k:option label="4级" value="4"></k:option>
						<k:option label="5级" value="5"></k:option>
						<k:option label="6级" value="6"></k:option>
						<k:option label="7级" value="7"></k:option>
						<k:option label="8级" value="8"></k:option>
						<k:option label="9级" value="9"></k:option>
					</k:combobox>
				</td>
			</tr>
			<tr>
				<td>岗位描述:</td>
				<td><k:textbox id="description" value="${model.description}" multiline="true" style="height:50px;width:250px;" validType="length[1,512]" /></td>
			</tr>
			<tr>
				<td>排序值:</td>
				<td><k:numberbox id="serial" min="0" precision="0" value="${model.serial}"></k:numberbox></td>
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
	<c:if test="${empty model.positionId}">
	<div style="float: left; margin-left: 10px;">
		<label for="autoNew"><input type="checkbox" id="autoNew">提交完成后新增下一条</label>
	</div>
	</c:if>
	<k:linkbutton style="width:80px" iconCls="icon-ok" onClick="jctx.submitForm()" text="提交" /><span />
	<k:linkbutton style="width:80px" iconCls="icon-cancel" onClick="juasp.closeWin(0)" text="取消" />
</k:section>

<%@ include file="/views/shared/_dialog.jsp"%>