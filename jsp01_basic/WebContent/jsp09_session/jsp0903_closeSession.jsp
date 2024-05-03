<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Session Close</h3>
	<%
		session.invalidate();
		// session.setMaxInactiveInterval(60); // 초단위
	%>
	세션이 종료되었습니다!!
</body>
</html>