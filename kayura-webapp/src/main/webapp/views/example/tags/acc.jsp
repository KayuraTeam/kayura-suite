<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">Accordion 标签</k:section>

<k:section name="head">

</k:section>

<k:section name="body">
	<k:layout fit="true">
		<k:dock region="west" split="true" maxWidth="200" minWidth="120">
			<k:accordion fit="true" border="false" multiple="true">
				<k:sheet title="面板一" collapsed="false" collapsible="false" tools="[{iconCls:'icon-menu',handler:function(){alert('设置');}}]">
					<ul>
						<li><a href="###" onclick="juasp.openTab('EasyUI-DataGrid', '${ROOT}/example/easyui/datagrid')">DataGrid</a></li>
						<li><a href="###" onclick="juasp.openTab('EasyUI-Accordion', '${ROOT}/example/easyui/accordion')">Accordion</a></li>
					</ul>
				</k:sheet>
				<k:sheet title="面板二" collapsed="false" collapsible="false" tools="[{iconCls:'icon-menu',handler:function(){alert('设置');}}]">
					<ul>
						<li><a href="###" onclick="juasp.openTab('Base Tag', '${ROOT}/example/tags/base')">BaseTag</a></li>
						<li><a href="###" onclick="juasp.openTab('Accordion Tag', '${ROOT}/example/tags/acc')">AccordionTag</a></li>
						<li><a href="###" onclick="juasp.openTab('Tree Tag', '${ROOT}/example/tags/tree')">TreeTag</a></li>
						<li><a href="###" onclick="juasp.openTab('Panel Tag', '${ROOT}/example/tags/panel')">PanelTag</a></li>
						<li><a href="###" onclick="juasp.openTab('Tabs Tag', '${ROOT}/example/tags/tabs')">TabsTag</a></li>
					</ul>
				</k:sheet>
				<k:sheet title="面板三" collapsed="false" collapsible="false" tools="[{iconCls:'icon-menu',handler:function(){alert('设置');}}]">
					<ul>
						<li><a href="###" onclick="juasp.openTab('List-Basic', '${ROOT}/example/general/basiclist')">基本列表</a></li>
					</ul>
				</k:sheet>
			</k:accordion>
		</k:dock>
		<k:dock region="center">
		</k:dock>
	</k:layout>
</k:section>

<%@ include file="shared/_simple.jsp"%>
