<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page session="true"%>
<html lang="zh">
<head>
<meta charset="utf-8">
<title>JSP和JSTL获取服务器参数</title>
</head>
<body>
	<h3>JSP方式:</h3>
	<%
		Map<String, Object> map = new HashMap<String, Object>();

		String ServerName = request.getServerName();
		map.put("ServerName:", ServerName);

		String ServerInfo = getServletContext().getServerInfo();
		map.put("ServerInfo:", ServerInfo);

		String Protocol = request.getProtocol();
		map.put("Protocol:", Protocol);

		Integer ServerPort = request.getServerPort();
		map.put("ServerPort:", ServerPort);
		
		String ctxPath = request.getContextPath();
		map.put("ContextPath:", ctxPath);

		String Method = request.getMethod();
		map.put("Method:", Method);

		String pathInfo = request.getPathInfo();
		map.put("pathInfo:", pathInfo);

		String PathTranslated = request.getPathTranslated();
		map.put("PathTranslated:", PathTranslated);

		String ServletPath = request.getServletPath();
		map.put("ServletPath:", ServletPath);

		String CharacterEncoding = request.getCharacterEncoding();
		map.put("CharacterEncoding:", CharacterEncoding);

		String QueryString = request.getQueryString();
		map.put("QueryString:", QueryString);

		String RemoteHost = request.getRemoteHost();
		map.put("RemoteHost:", RemoteHost);

		String RemoteAddr = request.getRemoteAddr();
		map.put("RemoteAddr:", RemoteAddr);

		String AuthType = request.getAuthType();
		map.put("AuthType:", AuthType);

		String RemoteUser = request.getRemoteUser();
		map.put("RemoteUser:", RemoteUser);

		String ContentType = request.getContentType();
		map.put("ContentType:", ContentType);

		Integer ContentLength = request.getContentLength();
		map.put("ContentLength:", ContentLength);

		String Accept = request.getHeader("Accept");
		map.put("Accept:", Accept);

		String UserAgent = request.getHeader("User-Agent");
		map.put("UserAgent:", UserAgent);

		String Referer = request.getHeader("Referer");
		map.put("Referer:", Referer);

		Iterator<String> it = map.keySet().iterator();
	%>

	<%
		while (it.hasNext()) {
			Object o = it.next();
	%>
	<%=o%>
	<%=map.get(o)%>

	<%
		out.println("<br>");
		}
	%>
	<h3>JSTL方式：</h3>
	|request对象：${pageContext.request}
	<br> |session对象：${pageContext.session}
	<br> |queryString：${pageContext.request.queryString}
	<br> |requestUR：${pageContext.request.requestURL}
	<br> |contextPath：${pageContext.request.contextPath}
	<br> |method(GET、POST)：${pageContext.request.method}
	<br> |protocol(HTTP/1.1、HTTP/1.0)：${pageContext.request.protocol}
	<br> |session的ID：${pageContext.session.id}
	<br> |User-Agent：${header["User-Agent"]}
	<br> |Host：${header["Host"]}
	<br> |serverName：${pageContext.request.serverName}
	<br> |serverPort：${pageContext.request.serverPort}
	<br> |remoteUser：${pageContext.request.remoteUser}
	<br> |remoteAddr：${pageContext.request.remoteAddr }
	<br> |remoteHost：${pageContext.request.remoteHost}
	<br> |serverInfo：${pageContext.servletContext.serverInfo}
	<br> |localAddr：${pageContext.request.localAddr}
	<br> |localName：${pageContext.request.localName}
	<br> |localPort：${pageContext.request.localPort}

</body>

</html>
