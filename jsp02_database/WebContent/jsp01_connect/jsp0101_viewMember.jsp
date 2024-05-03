<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- http://localhost:8080/jsp02_database/jsp01_connect/jsp0101_viewMember.jsp?id=hong -->
<%
	String id = request.getParameter("id");

	String DRV = "com.mysql.cj.jdbc.Driver";
	String URL = "jdbc:mysql://localhost:3306/testdb";
	String USR = "root";
	String PWD = "12345";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>회원정보조회</h4>
	<%
		Class.forName(DRV);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(URL, USR, PWD);
			stmt = conn.createStatement();
			String sql = "select * from member where id = '" + id + "'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
	%>
				<table border="1">
					<tr>
						<td>아이디</td>
						<td><%= id %></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><%= rs.getString("name") %></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><%= rs.getString("mobile") %></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><%= rs.getString("email") %></td>
					</tr>
				</table>
				<form action="./jsp0102_updateForm.jsp" method="post">
					<input type="hidden" name="id" value="<%= id %>"/>
					<input type="hidden" name="name" value="<%= rs.getString("name") %>"/>
					<input type="hidden" name="mobile" value="<%= rs.getString("mobile") %>"/>
					<input type="hidden" name="email" value="<%= rs.getString("email") %>"/>
					<input type="submit" value="회원정보수정"/>
					<a href="./jsp0103_insertForm.jsp">회원정보등록</a>
					<a href="./jsp0104_deleteMember.jsp?id=<%= id %>">회원정보삭제</a>
				</form>				
	<%			
			} else {
	%>
				<%= id %>를 찾지 못했습니다!
	<%
			}
		} catch(Exception e) {
	%>
			에러 : <%= e.getMessage() %>
	<%
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				// dummy
			}
		}
	%>

</body>
</html>













