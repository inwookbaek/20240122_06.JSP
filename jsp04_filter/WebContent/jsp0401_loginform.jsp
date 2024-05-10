<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= request.getContextPath()%><br>
	<form action="<%= request.getContextPath()%>/jsp0401_login.jsp">
		아이디   : <input type="text" name="id" value="" placeholder="아이디를 입력하세요!"/><br>
 		비밀번호 : <input type="password" value="" placeholder="비밀번호를 입력하세요..."/><br>
		<input type="submit" value="로그인"/>
	</form>
</body>
</html>