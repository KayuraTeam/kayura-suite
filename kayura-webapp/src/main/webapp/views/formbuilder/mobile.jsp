<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>手机表单设计器</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="">
<link rel="stylesheet"
	href="${ROOT}/res/formbuilder/vendor/css/vendor.css" />
<link rel="stylesheet" href="${ROOT}/res/formbuilder/formbuilder.css" />
<style>
* {
	box-sizing: border-box;
}

body {
	background-color: #444;
	font-family: sans-serif;
}

input[type=text] {
	height: 32px;
	margin-bottom: 3px;
}

select {
	margin-bottom: 5px;
	font-size: 32px;
}
</style>
</head>
<body>
	<div class='fb-main' style="margin-top: 50px"></div>
	<script type="text/javascript" src="${ROOT}/res/formbuilder/vendor/js/vendor.js"></script>
	<script type="text/javascript" src="${ROOT}/res/formbuilder/formbuilder.js"></script>
	<script>
		$(function() {
			$.ajax({
				type : "GET",
				url : "${ROOT}/rest/form/model/${modelId}/raw",
				success : function(data) {
					//$.parseJSON(data)
					//alert($.parseJSON(data));
					
					var fb = new Formbuilder({
						selector : '.fb-main',
						bootstrapData : $.parseJSON(data)
					});
					
					fb.on('save', function(payload) {
						
						console.log(payload);
						
						$.ajax({
							type : "POST",
							url : "${ROOT}/rest/form/model/${modelId}/raw",
							data : { "rawModel" : payload },
							success : function(data) {
								console.log("保存完毕。");
							}
						});
					});
				}
			});
		});
	</script>

</body>
</html>