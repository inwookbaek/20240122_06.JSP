<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>파일업로드</h4>
	<form action="<%= request.getContextPath()%>/upload"
		method="post" enctype="multipart/form-data">
		text1 : <input type="text" name="text1"/><br>
		file1 : <input type="file" name="file1"/><br>
		file2 : <input type="file" name="file2"/><br>
		<input type="submit" value="파일업로드"/>
	</form>
</body>
</html>