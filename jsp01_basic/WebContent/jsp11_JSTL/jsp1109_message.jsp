<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <fmt:setLocale value="ko"/> --%>
<fmt:setLocale value="ko"/>
<fmt:bundle basename="resource.message"> <!-- message.properties -->
	<fmt:message key="TITLE" var="title" />
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<h4>국제화태그</h4>
		<h3>${ title }</h3>
		<hr />
		<fmt:message key="GREETING"/><br>
		<c:if test="${ !empty param.id }">
			<fmt:message key="VISITOR">
				<fmt:param value="${ param.id }"/> <!-- {0} -->
			</fmt:message>
		</c:if>
	</body>
	</html>
</fmt:bundle>