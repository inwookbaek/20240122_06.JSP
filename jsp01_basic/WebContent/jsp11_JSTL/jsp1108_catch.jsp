<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>catch tag</h4>
	<c:catch var="e">
		id = <%= request.getParameter("id") %>
		<%
			if(request.getParameter("id").equals("hong")) {
		%>
				아이디는 ${ param.id } 입니다.
		<%
			}
		%>
	</c:catch>
	<c:if test="${ e != null }">
		익셉션이 발생했습니다! 아이디가 없습니다!<br>
		${ e }
	</c:if>
</body>
</html>