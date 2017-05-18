<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>统一应用支撑平台</title>
	<div id="resContent">
	<k:resource  id="themeLink" location="res" name="easyui/themes/${theme}/easyui.css"/>
	<k:resources location="res">
		easyui/themes/icon.css
		js/juasp.css
		js/jquery.min.js
		easyui/jquery.easyui.min.js
		easyui/easyui-lang-zh_CN.js
		js/juasp-core.js
		js/juasp-easyui.js
	</k:resources>
	</div>
	<style type="text/css">
		.panel-body { overflow: hidden; }
	</style>
	<script type="text/javascript">
		$(function(){
			
			var idMenus = $('#idMenus').menubutton({ menu: '#mm1' });
			$(idMenus.menubutton('options').menu).menu({
	            onClick: function (item) {
	            	var oldId = $("#aliveIdentityId").val();
 	            	if(oldId != item.name) {
	 	    			juasp.ajaxPost({
	 	    				url: juasp.APPROOT + "/identity/set.json", 
	 	    				data: { "i": item.name },
		    				success: function(r){
		    					window.location.href = '${ROOT}';
		    				}
		    			});
	            	}
	            }
			});
			
			jeasyui.genThemeList("themeList", "${ROOT}");
			juasp.openTab('首页', '${ROOT}/portal', 'icon-home', false);
		});
		
	</script>
</head>
<k:body layout="true">
	<k:dock region="north" style="height:50px;">
		<div style="padding-left:10px; float: left;">
			<h3>统一应用支撑平台</h3>
		</div>
		<div style="margin-left:15px; float: left;">
			<a href="#" class="easyui-menubutton" style="height: 48px;" data-options="menu:'#mm3'">主菜单</a>
		</div>
		<div style="float: right;">
			<k:hidden id="aliveIdentityId" value="${identityId}"/>
			<a id="idMenus" href="#" style="height: 48px;" data-options="menu:'#mm1'">${loginName}（${identityName}）</a>
			<k:linkbutton href="${ROOT}/logout" style="height: 48px;width:60px" plain="true">注销</k:linkbutton>
		</div>
		<div style="visibility: hidden;">
			<div id="mm3" class="menu-content" style="background:#f0f0f0;padding:10px;text-align:left">
				<img src="" style="width:150px;height:50px">
				<p style="font-size:14px;color:#444;">Try jQuery EasyUI to build your modern, interactive, javascript applications.</p>
			</div>
			<div id="mm1">
				<c:if test="${identities != null}">
					<c:forEach var="idt" items="${identities}">
						<div data-options="name:'${idt.key}'">${idt.value.displayName}</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</k:dock>
	<k:dock region="south" style="height: 35px">
		共 ${numUsers} 人在线.
		<div id="themeList" style="float:right; padding-top: 5px;">
		</div>
	</k:dock>
	<k:dock region="west" split="true" title="导航栏" style="width: 160px;">
		<k:accordion fit="true" border="false">
			<k:sheet collapsed="false" collapsible="false" title="我的工作">
				<ul>
					<li><a href="###" onclick="juasp.openTab('首页', '${ROOT}/portal')" >我的主页</a></li>
					<li><a href="###" onclick="juasp.openTab('账号管理', '${ROOT}/admin/user/list')" >账号管理</a></li>
					<li><a href="###" onclick="juasp.openTab('数据词典', '${ROOT}/admin/dict/list')" >数据词典</a></li>
					<li><a href="###" onclick="juasp.openTab('组织机构', '${ROOT}/org/manager')" >组织机构</a></li>
					<li><a href="###" onclick="juasp.openTab('员工管理', '${ROOT}/org/employee/list')" >员工管理</a></li>
					<li><a href="###" onclick="juasp.openTab('角色配置', '${ROOT}/auth/role/list')" >角色配置</a></li>
					<li><a href="###" onclick="juasp.openTab('文件管理', '${ROOT}/file/manager')" >文件管理</a></li>
					<li><a href="###" onclick="juasp.openTab('文件上传', '${ROOT}/mock/fileup')" >文件上传</a></li>
				</ul>
			</k:sheet>
			<k:sheet collapsed="false" collapsible="false" title="工作流" tools="[{iconCls:'icon-menu',handler:function(){alert('设置');}}]">
				<ul>
					<li><a href="###" onclick="juasp.openTab('任务中心', '${ROOT}/bpm/task/center')" >任务中心</a></li>
					<li><a href="###" onclick="juasp.openTab('表单定义', '${ROOT}/bpm/biz/list')" >表单定义</a></li>
					<li><a href="###" onclick="juasp.openTab('表单设计', '${ROOT}/bpm/form/list')" >表单设计</a></li>
					<li><a href="###" onclick="juasp.openTab('流程设计', '${ROOT}/bpm/proc/list')" >流程设计</a></li>
					<li><a href="###" onclick="juasp.openTab('模拟表单', '${ROOT}/mock/order/list')" >模拟表单</a></li>
					<li><a href="###" onclick="juasp.openTab('实例监控', '${ROOT}/bpm/proc/inst')" >实例监控</a></li>
					<li><a href="${ROOT}/formbuilder/mobile" target="_blank">手机表单</a></li>
				</ul>
			</k:sheet>
			<k:sheet collapsed="false" collapsible="false" title="收藏功能" tools="[{iconCls:'icon-menu',handler:function(){alert('设置');}}]">
				<ul>
					<li><a href="###" onclick="juasp.openTab('账号管理', '${ROOT}/admin/user/list')" >账号管理</a></li>
					<li><a href="###" onclick="juasp.openTab('数据词典', '${ROOT}/admin/dict/list')" >数据词典</a></li>
				</ul>
			</k:sheet>
		</k:accordion>
	</k:dock>
	<k:dock region="center">
		<k:tabs id="mainTabs" fit="true" border="false">
		</k:tabs>
	</k:dock>
</k:body>
</html>