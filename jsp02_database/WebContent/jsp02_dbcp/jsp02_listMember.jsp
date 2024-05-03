<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원목록</h3>
	<table border="1">
		<tr align="center">
			<td>아이디</td>
			<td>이름</td>
			<td>연락처</td>
			<td>이메일</td>
			<td>삭제</td>
		</tr>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;	
			
			try {
				String DRV = "jdbc:apache:commons:dbcp:jdbcStudyPoolName";
				conn = DriverManager.getConnection(DRV);
				String sql = "select * from member";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
		%>
				<tr>
					<td><a href="../jsp01_connect/jsp0101_viewMember.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("id") %></a></td>
					<td><%= rs.getString("name") %></td>
					<td><%= rs.getString("mobile") %></td>
					<td><%= rs.getString("email") %></td>
					<td><a href="../jsp01_connect/jsp0104_deleteMember.jsp?id=<%= rs.getString("id") %>">삭제</a></td>
				</tr>				
		<%			
				}
				
			} catch(Exception e) {
				e.getMessage();
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
		<tr>
			<td colspan="5" align="center">
			   <a href="../jsp01_connect/jsp0103_insertForm.jsp">회원정보등록</a>
			</td>
		</tr>
	</table>
</body>
</html>

















