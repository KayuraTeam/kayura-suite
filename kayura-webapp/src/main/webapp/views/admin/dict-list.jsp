<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">数据词典管理</k:section>
<k:section name="head">

</k:section>

<k:section name="body">
 	<k:dock region="center" border="false" style="padding: 2px;">
	<k:layout id="ctx" fit="true"> 
		<k:dock region="west" split="true" border="true" style="padding: 10px; width: 160px;">
			<k:tree id="tv" />
		</k:dock>
		<k:dock region="center" border="false" >
			<k:datagrid id="tg" fit="true" rownumbers="true" toolbar="#tb" pagination="true" 
				pageSize="10" singleSelect="true" striped="true" idField="itemId" >
				<k:column field="name" title="词典名" width="200" />
				<k:column field="value" title="词典值" width="150" />
				<k:column field="serial" title="排序值" width="150" />
				<k:column field="isFixedName" title="保留数据" width="80" />
			</k:datagrid>
			<div id="tb">
				<k:linkbutton id="add" iconCls="icon-add" disabled="true" plain="true" text="新增" onClick="newDict()" />
				<k:linkbutton id="edit" iconCls="icon-edit" disabled="true" plain="true" text="编辑" onClick="editDict()" />
				<k:linkbutton id="delete" iconCls="icon-remove" disabled="true" plain="true" text="删除" onClick="delDict()" />
			</div>
		</k:dock>
 	</k:layout>
	</k:dock>
	<script type="text/javascript">
	
		var dictId = "", id = "";
		$(function() {
			
			$('#tv').tree({
				url : "${ROOT}/admin/dict/define.json",
				onClick: function(node){
					var id = node.id;
					findItems(node.id);
					if(id == 'ROOT' || id == 'CATEGORY') {
						$('#add').linkbutton('disable');
						$('#edit').linkbutton('disable');
						$('#delete').linkbutton('disable');
					} else {
						$('#add').linkbutton('enable');
						$('#edit').linkbutton('enable');
						$('#delete').linkbutton('enable');
					}
				}
			});
		});

		function findItems(id) {
			
			if(dictId == "") {
				
				$('#tg').datagrid({
					url: "${ROOT}/admin/dict/load.json",
					queryParams: {
						"dictId": id
					},
					onClickRow : function(idx, row){
						<c:if test="${ISROOT==false}">
						if(row.isFixed){
							$('#delete').linkbutton('disable');
							$('#edit').linkbutton('disable');
						}else {
							$('#delete').linkbutton('enable');
							$('#edit').linkbutton('enable');
						}
						</c:if>
					},
					onDblClickRow : function(idx, row){
						editDict(row);
					}
				});
			} else {

				$('#tg').datagrid('unselectAll');
				$('#tg').datagrid('load', { "dictId": id });
			}
			
			dictId = id;
		}
		
		function newDict(){
			juasp.openWin({
				url: "${ROOT}/admin/dict/new?id=" + dictId,
				width: "450px",
				height: "300px",
				title: "创建词典项",
				onClose : function(result){
					if(result == 1){
						findItems(dictId);
					}
				}
			});
		}
		
		function editDict(row){
			
			if(row == null){
				row = $("#tg").datagrid("getSelected");
			}
			
			if(row != null) {
				<c:if test="${ISROOT==false}">
				if(!row.isFixed){
				</c:if>
					juasp.openWin({
						url: "${ROOT}/admin/dict/edit?id=" + row.id,
						width: "500px",
						height: "300px",
						title: "修改词典项",
						onClose : function(result){
							if(result == 1){
								findItems(dictId);
							}
						}
					});
				<c:if test="${ISROOT==false}">
				}
				</c:if>
			} else {
				juasp.warnTips("请在表格中点击要<b>编辑</b>的记录。");
			}
		}
		
		function delDict() {

			var row = $("#tg").datagrid("getSelected");
			
			if(row != null) {
				<c:if test="${ISROOT==false}">
				if(!row.isFixed){
				</c:if>
					juasp.confirm("是否删除名称为【 " + row.name + " 】的词典项。", function(r) {
						if(r == true) {
							juasp.ajaxPost({
								url: juasp.APPROOT + '/admin/dict/del.json', 
								data: { id : row.id},
								success: function(r){
									var idx = $("#tg").datagrid("getRowIndex", row);
									$("#tg").datagrid('deleteRow', idx);
								}
							});
						}
					});
				<c:if test="${ISROOT==false}">
				}
				</c:if>
			} else {
				juasp.warnTips("请在表格中点击要<b>删除</b>的记录。");
			}
		}
	</script>
</k:section>

<%@ include file="/views/shared/_simple.jsp"%>