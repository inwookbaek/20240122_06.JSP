<%@page import="java.net.URLDecoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키목록</h3>
	<%
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0) {
			for(int i=0;i<cookies.length; i++) {
	%>
				<%= cookies[i].getName() %> 
				= <%= URLDecoder.decode(cookies[i].getValue(), "utf-8") %><br>
	<% 
			}
		} else {
	%>
			<b>쿠키가 존재하지 않습니다!!</b>
	<%
		}
	%>
</body>
</html>