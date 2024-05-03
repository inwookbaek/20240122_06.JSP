<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String mobile = request.getParameter("mobile");
	String email = request.getParameter("email");

	String DRV = "com.mysql.cj.jdbc.Driver";
	String URL = "jdbc:mysql://localhost:3306/testdb";
	String USR = "root";
	String PWD = "12345";
	int updateCount = 0;
	
	Class.forName(DRV);
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		conn = DriverManager.getConnection(URL, USR, PWD);
		String sql = "update member set name=?, mobile=?, email=? "
				   + " where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, mobile);
		pstmt.setString(3, email);
		pstmt.setString(4, id);
		updateCount = pstmt.executeUpdate();
	} catch(Exception e) {
		e.getMessage();
	} finally {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			// dummy
		}		
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<h3>회원정보수정완료</h3>
	<%
		if(updateCount>0) {
	%>
			<%= id %>회원님의 정보가 성공적으로 수정되었습니다!!!<br>
			<%= name %><br>
			<%= mobile %><br>
			<%= email %><br>
	<%		
		} else {
	%>
			<%= id %>를 찾지 못했습니다!!!
	<%		
		}
	%>
	<hr />
	<a href="./jsp0101_viewMember.jsp?id=<%= id %>">회원정보보기</a>
	
</body>
</html>




















