<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  
	<JSP처리과정>
	
	WAS는 JSP페이지에 대한 요청이 들어오면
	
	1. JSP에 해당하는 서블릿이 없을 경우
	
	   1) JSP페이지로부터 자바코드를 생성
	   2) 자바코드를 컴파일해서 서블릿클래스를 생성
	   3) 서블릿에 클라이언트요청을 전달
	   4) 서블릿이 처리한 결과를 응답
	   5) 응답을 웹브라우저에 전달	
	
	2. JSP에 해당하는 서블릿이 있을 경우
	   
	   1) 서블릿에 클라이언트 요청을 전달
	   2) 서블릿이 요청을 처리한 결과를 생성
	   3) 응답을 웨브라우저에 전송
	   
	JSP를 실행한다는 말은 곧 JSP페이지를 컴파일한 결과안 서블릿클래스를 실행한다는 의미가
	된다. 정확하게 표현한다면 "JSP페이지를 컴파일한 서블릿을 실행"한다는 의미이다.
	
	<출력버퍼와 응답>
	
	JSP페이지는 응답결과를 곧바로 웹브라우저에 전송하지 않고 대신에 출력버퍼(buffer)에
	임시로 저장했다가 한번에 웹브라우저에 전송한다. 이에 따른 장점은
	
	1. 데이터전송성능향상
	2. JSP실행도중에도 버퍼를 비우고 새로운 내용을 전송
	3. 버퍼가 다 차기전까지 헤더정보 변경가능 
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>