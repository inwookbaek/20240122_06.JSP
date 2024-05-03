<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
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
	<h3>회원정보목록</h3>
	
	<%
		Class.forName(DRV);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(URL, USR, PWD);
			stmt = conn.createStatement();
			String sql = "select * from member";
			rs = stmt.executeQuery(sql);
	%>
			<table border="1">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>삭제</th>
				</tr>
	<%
			while(rs.next()) {
	%>				
				<tr>
					<td><a href="./jsp0101_viewMember.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("id") %></a></td>
					<td><%= rs.getString("name") %></td>
					<td><%= rs.getString("mobile") %></td>
					<td><%= rs.getString("email") %></td>
					<td><a href="./jsp0104_deleteMember.jsp?id=<%= rs.getString("id") %>">삭제</a></td>
				</tr>
	<%
			}
	%>
			<tr>
				<td colspan="5" align="center">
				   <a href="./jsp0103_insertForm.jsp">회원정보등록</a>
				</td>
			</tr>
		</table>						
	<%
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