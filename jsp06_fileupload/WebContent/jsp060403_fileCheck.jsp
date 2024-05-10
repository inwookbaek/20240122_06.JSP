<%@page import="java.net.URLEncoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String fileName1 = request.getParameter("fileName1");
	String fileName2 = request.getParameter("fileName2");
	String orgFileName1 = request.getParameter("orgFileName1");
	String orgFileName2 = request.getParameter("orgFileName2");
	
	// 크롬에서는 한글 인코딩하지 않아도 자동으로 인코딩해서 전달하지만
	// IE에서는 인코딩을 해서 전달해야 한다. 크롬이라면 아래코드는 생략가능하다.
	// fileName1 = URLEncoder.encode(fileName1, "utf-8");
	// fileName2 = URLEncoder.encode(fileName2, "utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>파일업로드확인 및 파일다운로드하기</h3>
	올린사람 : <%= name %><br>
	제    목 : <%= subject %><br>
	파일명 1 : <a href="jsp060404_fileDownload.jsp?filename=<%= fileName1 %>"><%= orgFileName1 %></a><br>
	파일명 2 : <a href="jsp060404_fileDownload.jsp?filename=<%= fileName2 %>"><%= orgFileName2 %></a><br>
</body>
</html>