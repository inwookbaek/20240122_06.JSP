<%@page import="com.lec.model.Message"%>
<%@page import="com.lec.service.InvalidPasswordException"%>
<%@page import="com.lec.service.UpdateMessageService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	boolean invalidPassword = false;
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	
	UpdateMessageService updateService = UpdateMessageService.getInstance();
	Message message = updateService.getMessage(messageId);		
	
%>
<c:set var="message" value="<%= message %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>방명록수정확인</h3>
	<form action="updateMessage.jsp" method="post">
		<input type="hidden" name="messageId" value="${ param.messageId }" />
		메시지를 삭제하려면 비밀번호를 입력하세요!!<br>
		비밀번호 : <input type="password" name="password"/>
		<hr />
		<table border="1">
			<tr>
				<td>이    름</td>
				<td><input type="text" name="guestName" value="${ message.getGuestName() }" disabled/></td>
			</tr>
			<tr>
				<td>방 명 록</td>
				<td><textarea name="message" id="" cols="30" rows="10" placeholder="방명록을 작성하세요!!!">
					${ message.getMessage() }
				</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="방명록수정"/></td>
			</tr>
		</table>		
	</form>
</body>
</html>