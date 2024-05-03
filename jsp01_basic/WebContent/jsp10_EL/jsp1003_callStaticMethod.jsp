<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.lec.el.NumberFormatUtil" %>
<%
	request.setAttribute("price", 12345L);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>정적메서드호출</h3>
	가격은 <b>${ NumberFormatUtil.numberFomat(price, '#,##0') }</b>원 입니다!!
</body>
</html>