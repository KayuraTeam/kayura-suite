<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">文件夹</k:section>

<k:section name="head">
	<script type="text/javascript">
	
		function submitForm() {
			
			$('#ff').form('submit', {
				url : '${ROOT}/file/folder/save.json',
				onlySuccess : function(r) {
					var t =  $("#name").textbox("getValue");
					juasp.closeWin({result: 1, 'id': r.data.id, text: t});
				}
			});
		}
		
		function clearForm() {
			juasp.closeWin(0);
		}
	</script>
</k:section>

<k:section name="body">
	<form id="ff" class="easyui-form" method="post">
		<input type="hidden" name="folderId" value="${model.folderId}" />
		<input type="hidden" name="parentId" value="${model.parentId}" />
		<input type="hidden" name="groupId" value="${model.groupId}" />
		<table cellpadding="5">
			<tr>
				<td>上级文件夹:</td>
				<td>${model.parentName}</td>
			</tr>
			<tr>
				<td>文件夹名称:</td>
				<td><input class="easyui-textbox" id="name" name="name" style="width:180px" value="${model.name}" data-options="required:true,validType:'length[1,32]'"></input></td>
			</tr>
			<tr>
				<td>隐藏的目录:</td>
				<td>
				<c:if test="${model.hidden==true}">
				<input type="checkbox" name="hidden" checked></input>
				</c:if>
				<c:if test="${model.hidden==false}">
				<input type="checkbox" name="hidden"></input>
				</c:if>
				</td>
			</tr>
		</table>
	</form>
</k:section>

<k:section name="tool">
	<k:linkbutton style="width:75px" iconCls="icon-ok" onClick="submitForm()" text="提交" />
	<k:linkbutton style="width:75px" iconCls="icon-cancel" onClick="juasp.closeWin(0)" text="取消" />
</k:section>

<%@ include file="/views/shared/_dialog.jsp"%>