<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uploadPath = request.getRealPath("upload");
	uploadPath = "c:/Temp";

	int size = 1024*1024*10; // 10MB
	String name = "";
	String subject = "";
	String fileName1 = "";
	String fileName2 = "";
	String orgFileName1 = "";
	String orgFileName2 = "";
	
	try {
		MultipartRequest multi = new MultipartRequest(
				request,
				uploadPath,
				size,
				"utf-8",
				new DefaultFileRenamePolicy());
		
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");

		Enumeration files = multi.getFileNames();
		String file1 = (String) files.nextElement();
		fileName1 = multi.getFilesystemName(file1);
		orgFileName1 = multi.getOriginalFileName(file1);
		
				
		String file2 = (String) files.nextElement();
		fileName2 = multi.getFilesystemName(file2);
		orgFileName2 = multi.getOriginalFileName(file2);

	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="jsp060403_fileCheck.jsp" method="post" name="fileCheck">
		<input type="text" name="name" value="<%= name %>"/><br>
		<input type="text" name="subject" value="<%= subject %>"/><br>
		<input type="text" name="fileName1" value="<%= fileName1 %>"/> =
		<input type="text" name="orgFileName1" value="<%= orgFileName1 %>"/><br>
		<input type="text" name="fileName2" value="<%= fileName2 %>"/> = 
		<input type="text" name="orgFileName2" value="<%= orgFileName2 %>"/><br>
	</form>
	<a href="#" onclick="javascript:fileCheck.submit()">파일업로드확인 및 다운로드페이지로 이동하기</a>
</body>
</html>