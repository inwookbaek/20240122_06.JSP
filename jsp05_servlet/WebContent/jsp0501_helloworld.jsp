<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%= request.getContextPath() %>/hello" method="get">
		<input type="submit" value="로그인 by GET(web.xml)"/>
	</form>
	<form action="<%= request.getContextPath() %>/hello" method="post">
		<input type="submit" value="로그인 by POST(web.xml)""/>
	</form>
	<hr />
	<form action="<%= request.getContextPath() %>/hxxx" method="get">
		<input type="submit" value="로그인 by GET(@WebServlet)""/>
	</form>
	<form action="<%= request.getContextPath() %>/hxxx" method="post">
		<input type="submit" value="로그인 by POST(@WebServlet)"/>
	</form>
</body>
</html>