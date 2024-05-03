<%@page import="com.lec.service.InvalidPasswordException"%>
<%@page import="com.lec.service.UpdateMessageService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	boolean invalidPassword = false;
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String msg = request.getParameter("message");
	String password = request.getParameter("password");
	
	try {
		UpdateMessageService updateService = UpdateMessageService.getInstance();
		updateService.updateMessage(messageId, password, msg);		
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
			<h4>메시지수정성공!!!</h4>
	<%
		} else {
	%>
			<h4>메시지수정실패!!!</h4>
			비밀번호가 일치하지 않습니다! 비밀번호를 다시 입력하세요!!
	<%
		}
	%>
	<br />
	<a href="listMessage.jsp">[목록보기]</a>
</body>
</html>