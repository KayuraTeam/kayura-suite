<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">Panel 标签</k:section>

<k:section name="head">
	<k:resource location="res" name="js/juasp-uploader.js"></k:resource>
</k:section>

<k:section name="body">
	<k:layout fit="true">
		<k:dock region="west" split="true" maxWidth="250" minWidth="120">
			<k:tree id="tree1" url="${ROOT}/example/tags/treedata.json"></k:tree>
		</k:dock>
		<k:dock region="center">
			<k:panel title="我是标题" fit="true" border="false" iconCls="icon-save">
				<p>中华人民共和国</p>
			</k:panel>
		</k:dock>
	</k:layout>
</k:section>

<%@ include file="shared/_simple.jsp"%>