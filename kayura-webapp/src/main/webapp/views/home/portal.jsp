<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>统一门户</title>
	<k:resource  id="themeLink" location="res" name="easyui/themes/${theme}/easyui.css"/>
	<k:resources location="res">
		easyui/themes/icon.css
		js/juasp.css
		js/jquery.src.js
		easyui/jquery.easyui.min.js
		easyui/easyui-lang-zh_CN.js
		js/juasp-core.js
		js/juasp-easyui.js
		js/jbpm-activiti.js
		easyui/jquery.portal.js
	</k:resources>
	<style type="text/css">
		.panel-body { border-top-width: 0; overflow: hidden; padding: 0; }
	</style>
	<script type="text/javascript">
		$(function(){
			//$("#tasklist").attr('src', "${ROOT}/bpm/task/list");
		});
	</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
		<div id="pp" style="position: relative">
			<div style="width: 65%;">
			</div>
			<div style="width: 35%;">
				<div title="消息提醒" style="text-align: center; height: 150px; padding: 5px;">
				</div>
				<div title="我的订阅" collapsible="true" closable="true" style="height: 200px; padding: 5px;">
					<div class="t-list">
						<a href="http://www.jeasyui.com/tutorial/datagrid/datagrid1.php">
							Build border layout for Web Pages
						</a>
					</div>
					<div class="t-list">
						<a href="http://www.jeasyui.com/tutorial/layout/panel.php">
							Complex layout on Panel
						</a>
					</div>
					<div class="t-list">
						<a href="http://www.jeasyui.com/tutorial/layout/accordion.php">Create
							Accordion</a>
					</div>
					<div class="t-list">
						<a href="http://www.jeasyui.com/tutorial/layout/tabs.php">Create
							Tabs</a>
					</div>
					<div class="t-list">
						<a href="http://www.jeasyui.com/tutorial/layout/tabs2.php">Dynamically
							add tabs</a>
					</div>
					<div class="t-list">
						<a href="http://www.jeasyui.com/tutorial/layout/panel2.php">Create
							XP style left panel</a>
					</div>
				</div>
				<div title="搜索中心" iconCls="icon-search" closable="true" style="height: 80px; padding: 10px;">
					<input class="easyui-searchbox" style="width: 80%">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#pp').portal({
				border : false,
				fit : true
			});

			var taskPanel = $('<div/>').appendTo('body');
			taskPanel.panel({
				title : '工作任务',
				href:'${ROOT}/bpm/task/list',
				height : "300px",
				closable : true,
				collapsible : true
			});
			$('#pp').portal('add', {
				panel : taskPanel,
				columnIndex : 0
			});

			add();
			
			$('#pp').portal('resize');
		});
		
		function add() {
			
			for (var i = 0; i < 2; i++) {
				var p = $('<div/>').appendTo('body');
				p.panel({
					title : 'Title' + i,
					content : '<div style="padding:5px;">Content' + (i + 1) + '</div>',
					height : 100,
					closable : true,
					collapsible : true
				});
				$('#pp').portal('add', {
					panel : p,
					columnIndex : i % 2
				});
			}
			
		}
		function remove() {
			$('#pp').portal('remove', $('#pgrid'));
			$('#pp').portal('resize');
		}
	</script>
</body>
</html>