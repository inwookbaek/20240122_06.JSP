<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Session 정보</h3>
	<%
		session.setAttribute("id", "hong");
		session.setAttribute("name", "홍길동");
		session.setAttribute("pass", "12345");
	%>
	
	1. 아이디 : <%= session.getAttribute("id") %><br>
	2. 이  름 : <%= session.getAttribute("name") %><br>
	3. 비  번 : <%= session.getAttribute("pass") %><br>
</body>
</html>