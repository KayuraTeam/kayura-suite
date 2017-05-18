<%@page import="org.kayura.utils.JsonUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">选择文件夹</k:section>

<k:section name="head">
	<script type="text/javascript">

		jctx = (function(win, $) {

			var currentFolderId = '${sid}';
			var selectedNodeId = null;

			function _confirm() {

				if ((selectedNodeId.length == 32 || selectedNodeId == "NOTCLASSIFIED")
						&& selectedNodeId != currentFolderId) {
					juasp.closeWin({
						result : 1,
						data : selectedNodeId
					});
				}
			}

			function _buttonState(nodeId) {

				selectedNodeId = nodeId;

				var isOk = false;
				if ((nodeId.length == 32 || nodeId == "NOTCLASSIFIED")
						&& nodeId != currentFolderId) {
					isOk = true;
				}

				$("#ok").linkbutton(isOk ? 'enable' : 'disable');
			}

			return {
				confirm : _confirm,
				buttonState : _buttonState
			};

		}(window, jQuery));
	</script>
</k:section>

<k:section name="body">
	<k:tree id="tv" url="${ROOT}/file/folders.json?t=select" animate="true" onClick="(n)jctx.buttonState(n.id);" />
</k:section>

<k:section name="tool">
	<k:linkbutton id='ok' onClick="jctx.confirm();" iconCls="icon-ok" style="width:75px" text="确认" />
	<k:linkbutton id='cancel' onClick="juasp.closeWin({result:0});" iconCls="icon-cancel" style="width:75px;" text="取消" />
</k:section>

<%@ include file="/views/shared/_dialog.jsp"%>