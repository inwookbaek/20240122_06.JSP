<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키값 변경하기</h3>
	<%
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0) {
			for(int i=0;i<cookies.length; i++) {
				if(cookies[i].getName().equals("name")) {
					Cookie cookie = new Cookie("name", URLEncoder.encode("손흥민", "utf-8"));
					response.addCookie(cookie);
					out.println("<b>name쿠키의 값이 홍길동에서 손흥민으로 변경되었습니다!!</b><br>");
					out.println(cookie.getName() + "=" + URLDecoder.decode(cookie.getValue(), "utf-8"));
							
				}
			}
		}
	%>	
</body>
</html>