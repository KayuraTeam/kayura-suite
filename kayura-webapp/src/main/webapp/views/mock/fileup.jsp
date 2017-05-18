<%@page import="org.kayura.utils.JsonUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">文件上传</k:section>

<k:section name="head">
	<k:resource location="res/js" name="webuploader.css" />
	<k:resource location="res/js" name="webuploader.min.js" />
	<k:resource location="res/js" name="juasp-uploader.js" />
	<script type="text/javascript">
		$(function(){
			$("#fileUpload1").uploader({
				showlist : true,
				showinfos : false,
				actions : {
					remove : true
				},
				formData : {
					category: '合同',
					bizId: $("#bizId").val()
				}
			});
			$("#fileUpload2").uploader({
				showlist : true,
				formData : {
					category: '归档',
					bizId: $("#bizId").val()
				}
			});
		});
	</script>
</k:section>

<k:section name="body">
	<k:dock region="center" border="false" style="padding: 5px">
		<h2>文件上传</h2>
		<p>此页模拟表单中多文件上传，大小限制，MD5校验，简单及表格显示列表。</p>
		<input type="hidden" id="bizId" name="bizId" value="8F6528BEEAB411E5AD4E10BF48BBBEC9" />
		<k:panel id="p1" title="列表上传(合同)" style="width: 600px; padding: 10px">
			<k:linkbutton id="fileUpload1" iconCls="icon-upload" text="上传文件" />
		</k:panel>
		<div style="margin: 5px;"></div>
		<k:panel id="p2" title="列表上传(归档)" style="width: 600px; padding: 10px;">
			<k:linkbutton id="fileUpload2" iconCls="icon-upload" text="上传文件" />
		</k:panel>
	</k:dock>
</k:section>

<%@ include file="/shared/_simple.jsp"%>