<%@page import="org.kayura.utils.JsonUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">选择文件夹</k:section>

<k:section name="head">
	<script type="text/javascript">
		$(function() {

			$('#tg').datagrid({
				url : "${ROOT}/file/sharer/find.json",
				queryParams : {
					keyword : $('#keyword').val()
				}
			});
		});

		jctx = (function(win, $) {

			function _confirm() {

			}

			return {
				confirm : _confirm
			};

		}(window, jQuery));
	</script>
</k:section>

<k:section name="body">
	<k:dock region="center" border="false" style="padding: 5px">
		<k:datagrid id="tg" fit="true" rownumbers="true" pagination="true"
			pageSize="20" singleSelect="true" striped="true" toolbar="#tq" idField="userId">
			<k:columns>
				<k:column field="ck" checkbox="true" />
				<k:column field="displayName" width="120" title="显示名" />
			</k:columns>
		</k:datagrid>
		<div id="tq" style="padding-left: 8px">
			关键字：
			<k:textbox id="keyword" style="width:150px" />
			<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="doSearch()">查询</a>
		</div>
	</k:dock>
	<k:dock region="south" border="false" style="height: 35px; padding: 5px;">
		<div style="text-align: right;">
			<k:linkbutton id='ok' onclick="jctx.confirm();" iconCls="icon-ok" style="width:75px" text="确认" />
			<k:linkbutton id='cancel' onclick="juasp.closeWin({result:0});" iconCls="icon-cancel" style="width:75px; margin-left: 5px" text="取消" />
		</div>
	</k:dock>
</k:section>

<%@ include file="/shared/_simple.jsp"%>