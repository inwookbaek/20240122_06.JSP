<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키 with domain</h3>
	<%
		Cookie cookie1 = new Cookie("id", "hong");
		cookie1.setDomain("anonymous.com");
		response.addCookie(cookie1);
		
		Cookie cookie2 = new Cookie("only", "onlycookie");
		response.addCookie(cookie2);
		
		Cookie cookie3 = new Cookie("invalid", "invalid Cookie");
		cookie1.setDomain("www.daum.net");
		response.addCookie(cookie3);		
	%>
	
	<%= cookie1.getName() %> = <%= cookie1.getValue() %> [<%= cookie1.getDomain() %>] <br>
	<%= cookie2.getName() %> = <%= cookie2.getValue() %> [<%= cookie2.getDomain() %>] <br>
	<%= cookie3.getName() %> = <%= cookie3.getValue() %> [<%= cookie3.getDomain() %>] <br>
</body>
</html>