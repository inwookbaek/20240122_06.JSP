<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>formatDate tag</h4>
	<c:set var="now" value="<%= new java.util.Date() %>"/>
	<fmt:formatDate value="${ now }" type="date" dateStyle="full"/><br>
	<fmt:formatDate value="${ now }" type="date" dateStyle="short"/><br>
	<fmt:formatDate value="${ now }" type="time" /><br>
	<fmt:formatDate value="${ now }" type="both" dateStyle="full" timeStyle="full"/><br>
	<fmt:formatDate value="${ now }" pattern="z a hh:mm" /><br>
</body>
</html>