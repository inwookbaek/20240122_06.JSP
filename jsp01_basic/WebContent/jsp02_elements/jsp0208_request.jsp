<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  
	request기본객체 : javax.servlet.http.HttpServletRequest
	
	요청 : http://localhost:8080?name=홍길동&age=1000&addr=조선한양
	... request의 파라미터 name, age, addr 각각 요청된 정보가 저장
	... request.getParameter('name') -> '홍길동'이 리턴
	... request.getParameter('age')  -> 1000이 리턴
	... request.getParameter('addr') -> '조선한양'이 리턴
	
	request기본객체는 JSP페이지에서 가장 많이 사용되는 기본 객체로서 웹 브라우저의 요청과
	관련이 있다. 웹브라우저에 웹사이트의 주소를 입력하면, 웹브라우저는 해당 웹서버에 연결
	한 후 요청정보를 전송하는데 이 요청정보를 제공하는 것이 request기본객체이다.
	
	request기본객체가 제공하는 기능은
	
	1. 클라이언트(웹브라우저)와 관련된 정보
	2. 서버와 관련된 정보
	3. 클라이언트가 전송한 요청파라미터 정보
    4. 클라이언트가 전송한 요청헤더 정보
    5. 클라이언트가 전송한 쿠키 정보
    6. 속성처리
    
    request기본객체 메서드
    
    1. getRmoteAddr() : 웹서버에 연결한 클라이언트의 IP주소
    2. getContentLength() : 클라이언트가 요청한 정보의 길이
    3. getCharacterEncoding() : 클라이언트가 요청정보를 전송할 때 사용한 캐릭터셋정보
    4. getContentType() : 클라이언트가 요청정보를 전송할 때 사용한 컨텐츠(문서)타입정보
    5. getProtocol() : 클라이언트가 요청한 프로토콜 정보
    6. getMethod() : 웹브라우저가 정보를 전송할 때 사용한 전송방식
    7. getRequestURI() : 웹브라우저가 요청한 URL에서 경로를 구함
    8. getContextPath() : JSP페이지가 속한 웹어플리케이션의 컨텍스트정보
       ... http://localhost:8080/jsp01_basic : ContextPath 즉, root
       ... jsp02_elements/jsp0207_declare.jsp: 요청된 파일
    9. getServerName() : 연결할 때 사용한 서버이름
   10. getServerPort() : 서버가 실행중인 포트번호 정보
   
    request기본객체의 요청파라미터관련 메서드
    
    1. getParameter(String name) : 이름(name)인 파라미터의 값, 없을 경우 null
    2. getParameterValues(String name) : 이름(name)인 모든 파라미터의 값을 배열로 리턴
       ...http://localhost:8080?hobbies=음악,독서,운동
       ... request.getParameter('hobbies') -> 배열타입({음악,독서,운동})
    3. getParmeterNames() : 웹브라우저가 전송한 파라미터의 이름 목록정보를 리턴
    4. getParameterMap() : 웹브라우저가 전송한 파라미터의 맵을 리턴
       ... HashMap타입으로 {name=홍길동, age=1000, addr=조선한양}

    request기본객체의 요청헤더정보관련 메서드
    
    HTTP프로토콜은 헤더정보에 부가적인 정보를 담고 있다. 예를 들어서 웹브라우저종류등과
    같은 정보를 담고 있다.
    
    1. getHeader(String name) : 지정한 이름의 헤더의 값 리턴
    2. getHeaders(String name) : 지정한 이름의 헤더목록을 리턴
    3. getHeaderName() : 모든 헤더의 이름을 리턴
    4. getIntHeader(String name) : 지정한 헤더의 값을 정수값으로 리턴
    5. getDateHeader(String name) : 지정한 헤더의 값을 시간 값으로 리턴
     
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 및 서버 정보</title>
</head>
<body>
	클라이언트IP - <%= request.getRemoteAddr() %><br>
	요청정보의 길이 - <%= request.getContentLength() %><br>
	요청정보의 인코딩 - <%= request.getCharacterEncoding() %><br>
	요청정보의 컨텐츠타입 - <%= request.getContentType() %><br>
	요청정보의 프로토콜 - <%= request.getProtocol() %><br>
	요청정보의 전송방식 - <%= request.getMethod() %><br>
	요청정보의 URI - <%= request.getRequestURI() %><br>
	요청정보의 URL - <%= request.getRequestURL() %><br>
	컨텍스트의 경로 - <%= request.getContextPath() %><br>
	서버이름 - <%= request.getServerName() %><br>
	포트번호 - <%= request.getServerPort() %><br>
</body>
</html>















