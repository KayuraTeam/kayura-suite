<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>未经授权的页面</title>
</head>
<body>
	<h1>您缺少访问该页面的权限。</h1>
	<c:if test="${message != null}">
		<h3>${message}</h3>
	</c:if>
</body>
</html>