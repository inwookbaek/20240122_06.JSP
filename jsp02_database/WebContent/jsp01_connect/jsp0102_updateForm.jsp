<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String mobile = request.getParameter("mobile");
	String email = request.getParameter("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr />
	<h4>회원정보수정</h4>
	<form action="./jsp0102_updateMember.jsp" method="post">
		<input type="hidden" size="10" name="id" value="<%= id %>"/>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" size="10" value="<%= id %>" disabled/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"  value="<%= name %>" size="20"/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="mobile"  value="<%= mobile %>" size="20"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email"  value="<%= email %>" size="50"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="회원정보수정"/></td>
			</tr>
		</table>
		<a href="./jsp0101_viewMember.jsp?id=<%= id %>">회원정보보기</a>
	</form>
</body>
</html>