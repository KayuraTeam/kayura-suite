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
	<k:resource location="res/highlight/styles" name="default.css" />
	<k:resource location="res/highlight" name="highlight.pack.js" />
	<script>hljs.initHighlightingOnLoad();</script>
	<k:renderSection name="head" />
</head>
<k:body>
	<!-- Body -->
	<k:renderSection name="body" />
	
	<!-- Code -->
	<k:renderSection name="code" />
	
	<div style="margin-top: 10px;">
		Source : <%= request.getRequestURI() %>
	</div>
	
	<k:renderSection name="footer" />
</k:body>
</html>