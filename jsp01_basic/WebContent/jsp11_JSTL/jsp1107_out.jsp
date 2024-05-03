<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  
	out태그 파라미터
	
	1. value : JspWriter에 출력할 값을 나타낸다 일반적으로 value 속성값은 String
	2. escapeXml : 이 속성값이 true이면 아래와 같이 문자를 변경한다.
	   1) < = &lt;
	   2) > = &gt;
	   3) & = &amp;
	   4) ' = &#039;
	   5) " = &#034;
	   
	3. default : value속성에서 지정한 값이 없을 경우 사용될 값을 지정
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>out tag</h4>
	<a href="http://localhost:8080/jsp01_basic/jsp11_JSTL/jsp1107_out.jsp?path=/jsp11_JSTL/jsp1101_if.jsp">path</a>
	<%
		FileReader reader = null;
		try {
			String path = request.getParameter("path");
			reader = new FileReader(getServletContext().getRealPath(path));
	%>
			
			<pre>
				소스코드 = ${ path }<br>
				<c:out value="<%= reader %>" escapeXml="true"/> <!--escapeXml:특수문자변환여부  -->
			</pre>
	<%		
		} catch(Exception e) {
	%>
			에러 : ${ e.getMessage() }
	<% 		
		} finally {
			if(reader !=null) try { reader.close(); } catch(IOException e1) {}
		}
	%>
</body>
</html>