<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>로그인확인</h3>
	<%
		String id = (String) session.getAttribute("id");
		boolean login = id == null ? false : true;
	%>
	
	<%
		if(login) {
	%>
			아이디   : <%= id %><br>
			비밀번호 : <%= session.getAttribute("pw") %> 
	<%
		} else {
	%>
			로그인하지 않았습니다!. 로그인해 주세요!
	<%
		}
	%>
</body>
</html>