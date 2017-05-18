<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<k:section name="title">Tree 标签</k:section>

<k:section name="head">
	<k:resource location="res" name="js/juasp-uploader.js"></k:resource>
</k:section>

<k:section name="body">
	<k:tree id="tree1" url="${ROOT}/example/tags/treedata.json" queryParams="${query}"></k:tree>
	<k:tree id="tree2" data="${data}"></k:tree>
</k:section>

<%@ include file="shared/_simple.jsp"%>