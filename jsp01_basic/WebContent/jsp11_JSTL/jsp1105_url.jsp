<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>URL tag</h3>
	<c:url var="searchURL" value="https://search.daum.net/search">
		<c:param name="w" value="tot"></c:param>
		<c:param name="q" value="공원"/>
	</c:url>

	<ul>
		<li><a href="${ searchURL }">다음검색엔진</a></li>
		<li><c:url value="jsp1101_if.jsp"/></li>
		<li><c:url value="./jsp1101_if.jsp"/></li>
	</ul>
</body>
</html>