<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%= request.getContextPath() %>/login" method="post">
		<input type="text" name="id" value="hong"/>
		<input type="password" name="pw" value="12345"/>
		<input type="text" name="name" value="홍길동"/>
		<input type="submit" value="LogIn"/>
	</form>
</body>
</html>