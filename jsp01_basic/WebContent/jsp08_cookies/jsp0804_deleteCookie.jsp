<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키 삭제하기</h3>
	<%
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0) {
			for(int i=0;i<cookies.length; i++) {
				if(cookies[i].getName().equals("name")) {
					Cookie cookie = new Cookie("name", "");
					cookie.setMaxAge(0); // 초단위
					response.addCookie(cookie);
				}
			}
		}
	%>
</body>
</html>