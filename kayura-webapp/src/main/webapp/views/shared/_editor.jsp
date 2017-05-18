<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><k:renderSection name="title" /></title>
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
	<k:renderSection name="head" />
</head>
<k:body full="true" padding="5px" >
	<k:renderSection name="body" />
</k:body>
</html>