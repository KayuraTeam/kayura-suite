<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">文件管理</k:section>

<k:section name="head">
	<k:resource location="res/js" name="webuploader.css" />
	<k:resource location="res/js" name="webuploader.min.js" />
	<k:resource location="res/js" name="juasp-uploader.js" />

	<script type="text/javascript">
	
		$(function() {
			$('#tv').tree({
				url : "${ROOT}/file/folders.json",
				animate: true,
				onClick : function(node) {
					var root = $(this).tree("getRootNode", node);
					jctx.clicknode(root, node);
				},
				onContextMenu: function(e, node){
					e.preventDefault();
					$(this).tree('select', node.target);
					var root = $(this).tree("getRootNode", node);
					jctx.clicknode(root, node);
					$('#mm').menu('show', { left: e.pageX, top: e.pageY });
				}
			});
		});
		
		jctx = (function(win, $) {

			var uploader = null;
			var isfirst = true;
			var selectRoot = null, selectNode = null;
	
			// 页面的动作状态.
			var actions = {
				addfolder : false,
				removefolder : false,
				sharefolder : false,
				upload : false,
				downfile : false,
				sharefile : false,
				movefile : false,
				copyfile : false,
				removefile : false
			};
			
			function _findFiles(nodeId) {
				
				if(isfirst) {
					
					$('#tg').datagrid({
						url : "${ROOT}/file/find.json",
						queryParams : { "folderId" : nodeId },
						rowStyler: function(index, row){
							if (row.isBiz){
								return 'color:gray;';
							} else if (row.isUploader && selectRoot.id == "MYGROUP") {
								return 'color:blue;';
							}
						},
						onSelect : function(index, rows) {
							_clickRow(this);
						},
						onUnselect : function(index, rows) {
							_clickRow(this);
						},
						onSelectAll : function(rows) {
							_clickRow(this);
						},
						onUnselectAll : function(rows) {
							_clickRow(this);
						}
					});
				} else {
	
					$('#tg').datagrid('load', { "folderId" : nodeId });
					$('#tg').datagrid('unselectAll');
				}
				
				isfirst = false;
			}
			
			function _formatterFileName(index, row){
				
				var icon = juasp.getIconName(row.postfix);
				return '<img class="webuploader-fileitem-icon" src="${ROOT}/res/images/types/' + icon + '.png">' + row.fileName;
			}

			function selectFileIds(){

				var rows = $('#tg').datagrid("getSelections");
				var names = [];
				$.each(rows, function(index, item){
					names.push(item.frId);
				});
				return names.join(",");
			}
			
			function _initActions() {
				
				 actions.addfolder = false;
				 actions.removefolder =false;
				 actions.sharefolder = false;
				 actions.upload = false;
				 actions.downfile = false;
				 actions.sharefile = false;
				 actions.movefile = false;
				 actions.copyfile = false;
				 actions.removefile = false;
			}
			
			function _applyActions(_actions) {
				
				// 菜单.
				$('#mm').menu((_actions.addfolder?'enableItem':'disableItem'), $("#addfolder"));
				$('#mm').menu((_actions.removefolder?'enableItem':'disableItem'), $("#removefolder"));
				<c:if test="${hasRoot == false}">
				$('#mm').menu((_actions.sharefolder?'showItem':'hideItem'), $("#sharefolder"));
				</c:if>
				
				// 按钮.
				$("#upload").linkbutton(_actions.upload?'enable':'disable');
				$("#downfile").linkbutton(_actions.downfile?'enable':'disable');
				$("#movefile").linkbutton(_actions.movefile?'enable':'disable');
				$("#copyfile").linkbutton(_actions.copyfile?'enable':'disable');
				$("#removefile").linkbutton(_actions.removefile?'enable':'disable');
				<c:if test="${hasRoot == false}">
				$("#sharefile").linkbutton(_actions.sharefile?'enable':'disable');
				</c:if>
			}
			
			function _initUploader() {
				
				if(uploader == null) {
					
					$("#upload").uploader({
						formData : {
							folderId: selectNode.id
						},
						onFinished : function (){
							_findFiles(selectNode.id);
						}
					});
					
					uploader = 1;
			        
				} else {
					
					$("#upload").uploader('setFormData', {
						folderId : selectNode.id
					});
				}
			}

			function _clickNode(root, node) {

				if(selectNode != null && selectNode.id == node.id) return;
				
				selectRoot = root;
				selectNode = node;

				_initActions();

				<c:choose>
				<c:when test="${hasRoot}">
				actions.addfolder = node.id != "NOTCLASSIFIED";
				actions.removefolder = node.children.length == 0
						&& node.id.length == 32;
				actions.upload = node.id.length == 32;
				</c:when>
				<c:otherwise>
				<c:choose>
				<c:when test="${hasAdmin}">
				actions.removefolder = (root.id == "MYFOLDER" || root.id == "MYGROUP")
						&& node.children.length == 0 && node.id.length == 32;
				</c:when>
				<c:otherwise>
				actions.removefolder = (root.id == "MYFOLDER")
						&& node.children.length == 0 && node.id.length == 32;
				</c:otherwise>
				</c:choose>
				actions.addfolder = (root.id == "MYFOLDER" && node.id != "NOTCLASSIFIED")
						|| (root.id == "MYGROUP" && node.id != "MYGROUP");
				actions.upload = (root.id == "MYFOLDER" || root.id == "MYGROUP")
						&& node.id.length == 32;
				</c:otherwise>
				</c:choose>

				_findFiles(node.id);
				_applyActions(actions);
				_initUploader();
			}

			function _clickRow(t) {

				var ids = selectFileIds();
				var i = ids.length;
				actions.downfile = i > 0;
				actions.copyfile = i > 0;
				<c:if test="${hasRoot}">
				actions.sharefile = false;
				actions.movefile = i > 0;
				actions.copyfile = i > 0;
				actions.removefile = i > 0;
				</c:if>
				<c:if test="${hasRoot==false}">
				var myarea = (selectRoot.id == "MYFOLDER" || selectRoot.id == "MYGROUP");
				actions.sharefile = (selectRoot.id == "MYFOLDER") && (i > 0);
				actions.movefile = myarea && (i > 0);
				actions.removefile = myarea && (i > 0);
				</c:if>

				_applyActions(actions);
			}

			function _createFolder() {
				var openUrl = juasp.APPROOT + "/file/folder/new?pid=" + selectNode.id
						+ "&pname=" + selectNode.text;
				juasp.openWin({
					url : openUrl,
					width : "450px",
					height : "200px",
					title : "创建文件夹",
					onClose : function(r) {
						if (r.result == 1) {
							$('#tv').tree('append', {
								parent : selectNode.target,
								data : [ {
									id : r.id,
									iconCls : 'icon-folder',
									text : r.text,
									children : []
								} ]
							});
						}
					}
				});
			}

			function _removeFolder() {

				juasp.confirm("是否删除【 " + selectNode.text + " 】文件夹。",
						function(r) {
							if (r == true) {
								juasp.ajaxPost({
									url: juasp.APPROOT + '/file/folder/remove.json', 
									data: { id : selectNode.id },
									success : function(r) {
										$("#tv").tree("remove", selectNode.target);
										_initActions();
										_applyActions(actions);
									}
								});
							}
						});
			}

			function _shareFolder() {

			}
			
			function _downfile() {

				var ids = selectFileIds();
				var url = "${ROOT}/file/get?id=" + ids;
				win.open(url);
			}

			function _removeFile() {

				var rows = $('#tg').datagrid("getSelections");
				var ids = [], names = [];
				$.each(rows, function(index, item) {
					ids.push(item.frId);
					names.push(item.fileName);
				});

				juasp.confirm("<b>是否确认删除</b> 【" + names.join(", ") + "】<b> "
						+ ids.length + " 个文件。</b>", function(r) {
					if (r == true) {
						juasp.ajaxPost({
							url: juasp.APPROOT + '/file/remove.json', 
							data: { id : ids.join(",") }, 
							success : function(r) {
								_findFiles(selectNode.id);
							}
						});
					}
				});
			}

			function _selectFolder(action) {

				var openUrl = "${ROOT}/file/folder/select?sid=" + selectNode.id;
				juasp.openWin({
					url : openUrl,
					width : "350px",
					height : "400px",
					title : "移动至文件夹",
					onClose : function(r) {
						if (r.result == 1) {
							if (typeof action == 'function') {
								action(r);
							}
						}
					}
				});
			}

			function _moveFile() {

				var ids = selectFileIds();
				_selectFolder(function(r) {
					juasp.ajaxPost({
						url: juasp.APPROOT + '/file/folder/move.json', 
						data: { id : ids, folderId : r.data },
						success : function(r) {
							_findFiles(selectNode.id);
						}
					});
				});
			}

			function _copyFile() {

				var ids = selectFileIds();
				_selectFolder(function(r) {
					juasp.ajaxPost({
						url: juasp.APPROOT + '/file/folder/copy.json', 
						data: { id : ids, folderId : r.data },
						success : function(r) {
							_findFiles(selectNode.id);
						}
					});
				});
			}

			function _shareFile() {

			}

			return {
				clicknode : _clickNode,
				createfolder : _createFolder,
				removefolder : _removeFolder,
				sharefolder : _shareFolder,

				downfile : _downfile,
				removefile : _removeFile,
				movefile : _moveFile,
				copyfile : _copyFile,
				sharefile : _shareFile,
				
				formatterFileName : _formatterFileName 
			}

		}(window, jQuery));

		function expand() {

			var node = $('#tv').tree('getSelected');
			$('#tv').tree('expand', (node ? node.target : null))
		}

		function collapse() {

			var node = $('#tv').tree('getSelected');
			$('#tv').tree('collapse', (node ? node.target : null))
		}
	</script>
</k:section>

<k:section name="body">
	<k:dock region="center" border="false" style="padding: 2px;">
	<k:layout id="ctx" fit="true">
		<k:dock region="west" split="true" border="true" style="padding: 10px; width: 200px;">
			<ul id="tv" class="easyui-tree"></ul>
		</k:dock>
		<k:dock region="center" border="false">
			<k:datagrid id="tg" fit="true" rownumbers="true" toolbar="#tb" pagination="true" 
				pageSize="10" idField="frId" >
				<k:column field="ck" checkbox="true" />
				<k:column field="fileName" formatter="jctx.formatterFileName" title="文件名" width="450" />
				<k:column field="uploaderName" title="上传人" align="center" width="90" />
				<k:column field="fileSize" title="大小" align="center" width="80" />
				<k:column field="downloads" title="下载次数" align="center" width="70" />
				<k:column field="allowChange" title="允许更改" hidden="true" width="80" />
				<k:column field="isEncrypted" title="数据加密" hidden="true" width="80" />
				<k:column field="uploadTime" title="上传时间" align="center" width="150" />
			</k:datagrid>
			<div id="tb">
				<k:linkbutton id="upload" disabled="true" iconCls="icon-upload" plain="true" text="上传文件" />
				<k:linkbutton id="downfile" onClick="jctx.downfile()" disabled="true" iconCls="icon-download" plain="true" text="下载" />
				<k:linkbutton id="movefile" onClick="jctx.movefile()" disabled="true" iconCls="icon-cut" plain="true" text="移动" />
				<k:linkbutton id="copyfile" onClick="jctx.copyfile()" disabled="true" iconCls="icon-copy" plain="true" text="复制" />
				<k:linkbutton id="removefile" onClick="jctx.removefile()" disabled="true" iconCls="icon-remove" plain="true" text="删除" />
				<c:if test="${hasRoot == false}">
				<k:linkbutton id="sharefile" onClick="jctx.sharefile()" disabled="true" iconCls="icon-share" plain="true" text="分享" />
				</c:if>
			</div>
			<k:menu id="mm" style="width:120px">
				<k:menuitem id="addfolder" onClick="jctx.createfolder()" iconCls="icon-addfolder">添加</k:menuitem>
				<k:menuitem id="removefolder" onClick="jctx.removefolder()" iconCls="icon-remove">移除</k:menuitem>
				<c:if test="${hasRoot == false}">
				<k:menuitem id="sharefolder" onClick="jctx.sharefolder()" iconCls="icon-share">分享</k:menuitem>
				</c:if>
				<k:menuitem isSeparator="true" />
				<k:menuitem onClick="expand()">展开</k:menuitem>
				<k:menuitem onClick="collapse()">收缩</k:menuitem>
			</k:menu>
		</k:dock>
	</k:layout>
	</k:dock>
</k:section>

<%@ include file="/views/shared/_simple.jsp"%>