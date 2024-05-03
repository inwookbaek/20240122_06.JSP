<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./jsp0103_insertMember.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" size="10" name="id" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="20"/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="mobile" size="20"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" size="50"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="회원정보등록"/></td>
			</tr>
		</table>
	</form>
</body>
</html>