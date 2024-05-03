<%@page import="com.lec.service.WriteMessageService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="message" class="com.lec.model.Message">
	<jsp:setProperty name="message" property="*" />
</jsp:useBean>
<%
	WriteMessageService writeService = WriteMessageService.getInstance();
	writeService.write(message);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>방명록등록성공!!</h3>
	방명록에 메시지가 성공적으로 등록되었습니다!!<br>
	<a href="listMessage.jsp">[방명록목록보기]</a>
</body>
</html>