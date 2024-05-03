<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id != null && pw.equals("12345")) {
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
%>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>로그인성공!!!!</h3>
</body>
</html>		
<%		
	} else {
%>
<script>
	alert("비밀번호가 틀립니다! 로그인실패!!!");
	history.go(-1);
</script>
<%
	}
%>
