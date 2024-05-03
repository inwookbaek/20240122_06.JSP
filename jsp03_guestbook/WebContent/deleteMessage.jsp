<%@page import="com.lec.service.InvalidPasswordException"%>
<%@page import="com.lec.service.DeleteMessageService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	boolean invalidPassword = false;
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	
	try {
		DeleteMessageService deleteService = DeleteMessageService.getInstance();
		deleteService.deleteMessage(messageId, password);		
	} catch(InvalidPasswordException e) {
		invalidPassword = true;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(!invalidPassword) {
	%>
			<h4>메시지삭제성공!!!</h4>
	<%
		} else {
	%>
			<h4>메시지삭제실패!!!</h4>
			비밀번호가 일치하지 않습니다! 비밀번호를 다시 입력하세요!!
	<%
		}
	%>
	<br />
	<a href="listMessage.jsp">[목록보기]</a>
</body>
</html>