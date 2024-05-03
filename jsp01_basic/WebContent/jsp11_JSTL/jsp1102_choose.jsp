<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>choose tag</h3>
	<ul>
		<c:choose>
			<c:when test="${ param.id == 'hong' }">
				<li>당신의 아이디는 ${ param.id } 입니다!</li>
			</c:when>
			<c:when test="${ param.age > 18 }">
				<li>${ param.age }세 이상은 성인입니다!</li>
			</c:when>
			<c:otherwise>
				<li>당신의 아이디는 hong이 아니고 성인도 아닙니다!!</li>
			</c:otherwise>
		</c:choose>
	</ul>
</body>
</html>