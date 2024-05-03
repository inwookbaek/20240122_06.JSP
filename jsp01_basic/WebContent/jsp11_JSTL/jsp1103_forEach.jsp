<%@page import="java.util.HashMap"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	HashMap<String, Object> map = new HashMap<>();
	map.put("name", "홍길동");
	map.put("today", new java.util.Date());
%>
<c:set var="intArray" value="<%= new int[] {1,2,3,4,5,6,7,8,9,10} %>"></c:set>
<c:set var="data" value="<%= map %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>forEach tag</h3>
	
	<h4>1~100까지 홀수의 합</h4>
	<c:set var="sum" value="0"/>
	<c:forEach var="i" begin="1" end="100" step="2">
		<c:set var="sum" value="${ sum + i }"/>
	</c:forEach>	
	1~100까지 홀수의 합 = ${ sum } 입니다.
	<hr />
	
	<h4>구구단</h4>
	<ul>
		<c:forEach var="i" begin="2" end="8">
			<li>9 * ${ i } = ${ 9*i }</li>
		</c:forEach>
	</ul>
	<hr />
	
	<h4>Array</h4>
	<c:forEach var="i" items="${ intArray }" begin="2" end="4" varStatus="status">
		${ status.index } : ${ status.count } : [${i}] <br>
	</c:forEach>
		<hr />
	
	<h4>Map</h4>
	<c:forEach var="i" items="${ data }">
		${ i.key } = ${ i.value }<br>
	</c:forEach>
</body>
</html>




















