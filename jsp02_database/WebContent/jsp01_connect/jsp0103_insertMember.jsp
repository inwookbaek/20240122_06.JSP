<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
	int insertCount = 0;
	
	Class.forName(DRV);
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		conn = DriverManager.getConnection(URL, USR, PWD);
		String sql = "insert into member values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, mobile);
		pstmt.setString(4, email);
		insertCount = pstmt.executeUpdate();
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
	<h3>회원정보등록</h3>
	<%
		if(insertCount>0) {
	%>
			<%= id %>회원님의 정보가 성공적으로 등록되었습니다!!!<br>
			<%= name %><br>
			<%= mobile %><br>
			<%= email %><br>
	<%		
		} else {
	%>
			<%= id %>회원정보등록 실패!!!
	<%		
		}
	%>
	<hr />
	<a href="./jsp0105_listMember.jsp">회원목록보기</a>

</body>
</html>