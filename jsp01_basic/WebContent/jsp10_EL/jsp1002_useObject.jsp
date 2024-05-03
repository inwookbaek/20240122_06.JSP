<%@page import="com.lec.el.Themometer"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Themometer themometer = new Themometer();
	request.setAttribute("t", themometer);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>온도변환기(섭씨->화씨)</h3>
	<hr />
	<h4>${ t.getInfo() }</h4>
	${ t.setCelsius("서울", 31.5) }
	서울낮온도<br>
	<ul>
		<li>섭씨 : ${ t.getCelsius("서울") } 도</li>
		<li>화씨 : ${ t.getFahrenheit("서울") } 도</li>
	</ul> 
</body>
</html>