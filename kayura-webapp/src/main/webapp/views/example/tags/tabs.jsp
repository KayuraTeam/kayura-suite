<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">Tabs 标签</k:section>

<k:section name="head">
	<k:resource location="res" name="js/juasp-uploader.js"></k:resource>
</k:section>

<k:section name="body">
	<k:tabs fit="true" tabPosition="right" plain="true"
		tools="[{iconCls:'icon-add',handler:function(){alert('添加');}}]">
		<k:tabpage title="首页" iconCls="icon-home" padding="5px">
			<k:tabs fit="true">
				<k:tabpage title="列表">
				</k:tabpage>
				<k:tabpage title="详细" closable="true">
				</k:tabpage>
			</k:tabs>
		</k:tabpage>
		<k:tabpage title="选项卡一" closable="true" padding="5px">
			<k:panel title="我是标题" fit="true" iconCls="icon-save">
				<p>中华人民共和国</p>
			</k:panel>
		</k:tabpage>
		<k:tabpage title="选项卡二" closable="true" padding="10px">
		</k:tabpage>
	</k:tabs>
</k:section>

<%@ include file="shared/_simple.jsp"%>