<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">账号管理</k:section>

<k:section name="head">
	<script type="text/javascript">
	
		$(document).ready(function() {
			jctx.init();
		});
		
		var jctx = (function($,win){
			
			function _closePage(){
				juasp.closeWin({result: 0});
			}

			function _init(){
				$('#tg').datagrid({
					url: "${ROOT}/org/employee/find.json",
					queryParams: {
						keyword : $('#keyword').val(),
						status : $('#status').val()
					}
				});
			}
			
			function _search() {
				$('#tg').datagrid('load', {
					keyword : $('#keyword').val()
				});
			}
			
			function _submit(){
				
				var rows = $("#tg").datagrid('getSelected');
				if(rows != null){
					juasp.closeWin({ result: 1, data: rows });
				} else {
					juasp.warnTips("请选择一个员工项。");
				}
			}
			
			return {
				init: _init,
				search: _search,
				submit: _submit,
				closePage: _closePage
			};
			
		}(jQuery, window));
		
	</script>
</k:section>

<k:section name="body">
	<k:datagrid id="tg" fit="true" singleSelect="true" 
		rownumbers="true" pagination="true" pageSize="10" striped="true"
		toolbar="#tb" idField="employeeId">
		<k:column field="ck" checkbox="true" />
		<k:column field="code" title="工号" />
		<k:column field="name" title="姓名" />
		<k:column field="sexName" align="center" title="性别" />
		<k:column field="birthDay" align="center" title="生日" />
		<k:column field="phone" title="分机号" />
		<k:column field="mobile" title="手机号" />
		<k:column field="email" title="电子邮箱" />
	</k:datagrid>
	<div id="tb">
		<k:linkbutton style="width:85px" plain="true" iconCls="icon-ok" onClick="jctx.submit()" text="选中确认" />
		<k:linkbutton style="width:85px" plain="true" iconCls="icon-cancel" onClick="jctx.closePage()" text="取消" />
		<div style="float: right;">
			<k:searchbox id="search" prompt="搜索：工号、姓名、手机号、邮箱" width="220" height="25" searcher="jctx.search" />
		</div>
	</div>
</k:section>

<%@ include file="/shared/_list.jsp"%>