<%@page import="com.lec.service.MessageListView"%>
<%@page import="com.lec.service.GetMessageListService"%>
<%@page import="com.lec.model.Message"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if(pageNumberStr != null) pageNumber = Integer.parseInt(pageNumberStr);

	GetMessageListService messageListService = GetMessageListService.getInstance();
	MessageListView viewMessage = messageListService.getMessageList(pageNumber);

%>

<c:set var="viewMessage" value="<%= viewMessage %>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="writeMessage.jsp" method="post">
		<table border="1">
			<tr>
				<td>이    름</td>
				<td><input type="text" name="guestName" value="홍길동"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" value="12345"/></td>
			</tr>
			<tr>
				<td>방 명 록</td>
				<td><textarea name="message" id="" cols="30" rows="10" placeholder="방명록을 작성하세요!!!">
					안녕하삼....
					반가워....
					처음 쓰는 방명록.....
				</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="방명록등록"/></td>
			</tr>
		</table>
	</form>
	<hr />
	
	<c:if test="${ viewMessage.isEmpty() }">
		<h4>등록된 메시지가 없습니다!!</h4>
	</c:if>
	
	<c:if test="${ !viewMessage.isEmpty() }">
		<table border="1">
			<c:forEach var="message" items="${ viewMessage.messageList  }">
				<tr>
					<td>
						메시지번호: ${ message.id } <br>
						작성자이름: ${ message.guestName } <br>
						메  시  지: ${ message.message } <br>	
						<a href="confirmDeletion.jsp?messageId=${ message.id }">[삭제]</a>						
						<a href="confirmUpdate.jsp?messageId=${ message.id }">[수정]</a>						
					</td>
				</tr>
			</c:forEach>
		
		</table>
		<%-- 총페이지수 = ${ viewMessage.pageTotalCount } --%>
		<hr />
		<c:forEach var="page" begin="1" end="${ viewMessage.pageTotalCount }">
			<a href="listMessage.jsp?page=${ page }">[${ page }]</a>
		</c:forEach>
	</c:if>	
</body>
</html>