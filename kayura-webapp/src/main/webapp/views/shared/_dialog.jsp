<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><k:renderSection name="title"/></title>
	<k:resource  id="themeLink" location="res" name="easyui/themes/${theme}/easyui.css"/>
	<k:resources location="res">
		easyui/themes/icon.css
		js/juasp.css
		js/jquery.min.js
		js/json2.js
		easyui/jquery.easyui.min.js
		easyui/easyui-lang-zh_CN.js
		js/juasp-core.js
		js/juasp-easyui.js
	</k:resources>
	<k:renderSection name="head"/>
</head>
<k:body full="true" padding="5px">
	<k:layout fit="true">
		<k:dock region="center" style="padding: 10px 30px 10px 30px;">
			<!-- 编辑内容区域 body -->
			<k:renderSection name="body"/>
		</k:dock>
		<k:dock region="south" border="false" style="text-align:right;padding:5px 0 0;">
			<!-- 工具栏区域 tool -->
			<k:renderSection name="tool" />
		</k:dock>
	</k:layout>
</k:body>
</html>