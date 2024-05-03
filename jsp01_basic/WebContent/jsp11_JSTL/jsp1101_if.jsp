<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>if tag</h3>
	<c:if test="true">
		무조건 true!!!
	</c:if>
	<br />
	<!-- localhost:8080/xxx.jsp?id=hong&pw=12345 -->
	<c:if test="${ param.id == 'hong'}">
		로그인한 회원의 ID는 ${ param.id } 입니다!
	</c:if>
	<br />
	<c:if test="${ param.pw == '12345'}">
		로그인한 회원의 비밀번호는 ${ param.pw } 입니다!
	</c:if>	
	
</body>
</html>