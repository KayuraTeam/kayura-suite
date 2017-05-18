<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">${model.title}</k:section>

<k:section name="head">
	<script type="text/javascript">
	
	var jctx = (function(){
		
	}());
	
	</script>
</k:section>

<!-- 编辑内容区域 body -->
<k:section name="body">
	<k:form id="ff">
		<k:hidden id="dataId" value="${model.dataId}"/>processKey
		<k:hidden id="modelId" value="${model.modelId}"/>
		<k:hidden id="processKey" value="${model.processKey}"/>
		<k:hidden id="creator" value="${model.creator}"/>
		<table cellpadding="5">
			<c:forEach var="m" items="${model.fields}">
				<c:choose>
					<c:when test="${m.fieldType == 'DateRange'}">
						<tr>
							<td>${m.startLabel}</td>
							<td>${m.startValue}</td>
						</tr>
						<tr>
							<td>${m.endLabel}</td>
							<td>${m.endValue}</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${m.label}</td>
							<td>${m.value}</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</table>
	</k:form>
</k:section>

<!-- 工具栏区域 tool -->
<k:section name="tool">
	<k:linkbutton style="width:80px" iconCls="icon-ok" onClick="jctx.submitForm()" text="提交" /><span />
	<k:linkbutton style="width:80px" iconCls="icon-cancel" onClick="jctx.closePage()" text="取消" />
</k:section>

<%@ include file="/views/shared/_dialog.jsp"%>