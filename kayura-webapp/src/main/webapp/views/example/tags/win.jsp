<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<k:section name="title">Tree 标签</k:section>

<k:section name="head">
</k:section>

<k:section name="body">
	<h2>Basic Window</h2>
	<p>Window can be dragged freely on screen.</p>
	<div style="margin: 20px 0;">
		<k:linkbutton onClick="$('#w').window('open')" text="Open" />
		<k:linkbutton onClick="$('#w').window('close')" text="Close" />
	</div>
	<k:window id="w" iconCls="icon-save" closed="true" width="500px" height="200px" padding="10px" title="Basic Window">
		The window content.
	</k:window>
</k:section>

<%@ include file="shared/_simple.jsp"%>