<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">${model.title}</k:section>

<k:section name="head">
	<script type="text/javascript">
		var jctx = (function() {

			function _closePage() {
				juasp.closeWin(0);
			}

			function _submitForm() {

				$('#ff').form('submit', {
					url : '${RESTROOT}/form/start',
					onlySuccess : function(r) {
						_closePage(1);
					}
				});
			}

			return {
				submitForm : _submitForm,
				closePage : _closePage
			};

		}());
	</script>
</k:section>

<!-- 编辑内容区域 body -->
<k:section name="body">
	<k:form id="ff">
		<k:hidden id="dataId" value="${model.dataId}" />
		<k:hidden id="modelId" value="${model.modelId}" />
		<k:hidden id="tenantId" value="${tenantId}" />
		<k:hidden id="processKey" value="${model.processKey}" />
		<k:hidden id="creator" value="${model.creator}" />
		<k:hidden id="view" value="${model.view}" />
		<div style="text-align: center;">
			<h2>${model.formName}</h2>
		</div>
		<table cellpadding="5">
			<tr>
				<td>标题</td>
				<td><input class="easyui-textbox" name="title" required="true"
					style="width: 180px;"
					data-options='validType:"length[1,32]",value:"${model.title}"' />
				</td>
			</tr>
			<c:forEach var="m" items="${model.fields}">
				<c:if test="${m.fieldType == 'Text'}">
					<tr>
						<td>${m.label}</td>
						<td><input class="easyui-textbox" id="${m.id}"
							name="$F_${m.name}" required="${m.required}"
							style="width: 180px;"
							data-options='validType:"length[1,32]",value:"${m.value}"' /></td>
					</tr>
				</c:if>
				<c:if test="${m.fieldType == 'TextArea'}">
					<tr>
						<td>${m.label}</td>
						<td><input class="easyui-textbox" id="${m.id}"
							name="$F_${m.name}" required="${m.required}"
							style="width: 280px; height: 65px"
							data-options='multiline:true,validType:"length[1,32]",value:"${m.value}"' />
						</td>
					</tr>
				</c:if>
				<c:if test="${m.fieldType == 'Date'}">
					<tr>
						<td>${m.label}</td>
						<td><input class="easyui-datebox" id="${m.id}"
							name="$F_${m.name}" required="${m.required}" value="${m.value}">
						</td>
					</tr>
				</c:if>
				<c:if test="${m.fieldType == 'DateTime'}">
					<tr>
						<td>${m.label}</td>
						<td><input class="easyui-datetimebox" id="${m.id}"
							name="$F_${m.name}" required="${m.required}" value="${m.value}">
						</td>
					</tr>
				</c:if>
				<c:if test="${m.fieldType == 'Time'}">
					<tr>
						<td>${m.label}</td>
						<td><input class="easyui-timespinner" id="${m.id}"
							name="$F_${m.name}" required="${m.required}" value="${m.value}">
						</td>
					</tr>
				</c:if>
				<c:if test="${m.fieldType == 'DateRange'}">
					<tr>
						<td>${m.startLabel}</td>
						<td><input class="easyui-datebox" required="${m.required}"
							id="${m.id}_start" name="$F_${m.name}_start"
							value="${m.startValue}"></td>
					</tr>
					<tr>
						<td>${m.endLabel}</td>
						<td><input class="easyui-datebox" required="${m.required}"
							id="${m.id}_end" name="$F_${m.name}_end" value="${m.endValue}">
						</td>
					</tr>
				</c:if>
				<c:if test="${m.fieldType == 'Number'}">
					<tr>
						<td>${m.label}</td>
						<td><input type="text" class="easyui-numberbox" id="${m.id}"
							name="$F_${m.name}" required="${m.required}" value="${m.value}">${m.unit}
						</td>
					</tr>
				</c:if>
				<c:if test="${m.fieldType == 'Money'}">
					<tr>
						<td>${m.label}</td>
						<td><input type="number" id="${m.id}" name="${m.name}"
							value="$F_${m.value}" required="${m.required}">${m.unit}
						</td>
					</tr>
				</c:if>
				<c:if test="${m.fieldType == 'Select'}">
					<tr>
						<td>${m.label}</td>
						<td><select class="easyui-combobox" id="${m.id}"
							name="$F_${m.name}" required="${m.required}"
							data-options='panelHeight:"auto"'>
								<c:forEach var="o" items="${m.options}">
									<option value="${o.value}">${o.label}</option>
								</c:forEach>
						</select></td>
					</tr>
				</c:if>
				<c:if test="${m.fieldType == 'Photo'}">
					<tr>
						<td>${m.label}</td>
						<td><input type="file" name="photo"> <input
							type="hidden" name="$F_${m.name}"></td>
					</tr>
				</c:if>
				<c:if test="${m.fieldType == 'Attachment'}">
					<tr>
						<td>${m.label}</td>
						<td><input type="file" name="attachment"> <input
							type="hidden" name="$F_${m.name}"></td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<td>审批人</td>
				<td><input type="text" name="receivers">
				</td>
			</tr>
		</table>
	</k:form>
</k:section>

<!-- 工具栏区域 tool -->
<k:section name="tool">
	<c:if test="${preview == false}">
		<k:linkbutton style="width:80px" iconCls="icon-ok"
			onClick="jctx.submitForm()" text="提交" />
		<span />
		<k:linkbutton style="width:80px" iconCls="icon-cancel"
			onClick="jctx.closePage()" text="取消" />
	</c:if>
</k:section>

<%@ include file="/views/shared/_dialog.jsp"%>