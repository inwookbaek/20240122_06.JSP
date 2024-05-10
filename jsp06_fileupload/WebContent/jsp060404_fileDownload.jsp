<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String fileName = request.getParameter("filename");
	
	// 실제로 웹서버를 운영할 때의 코드
	// ServletContext context = getServletContext();
	// String downloadPath = context.getRealPath("upload");
	// System.out.println(downloadPath);
	
	String downloadFile = "c:/Temp/" + fileName;
	
	byte b[] = new byte[4096];
	File f = new File(downloadFile);
	FileInputStream fis = new FileInputStream(downloadFile);
	String mimeType = getServletContext().getMimeType(downloadFile);
	// System.out.println("MimeType = " + mimeType);
	
	// octect-stream은 8비트로된 일련된 데이터를 의미한다.
	// 지정되지 않은 파일형식을 의미한다.
	if(mimeType == null) mimeType = "application/octect-stream";
	
	// 한글 업로드(아래코드는 한글명이 깨지는 것을 방지)
	String sEncoding = new String(fileName.getBytes("utf-8"), "8859_1");
	String sEncoding1 = URLEncoder.encode(fileName, "utf-8");
	response.setContentType(mimeType);
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Content-Disposition", "attachment; filename= " + sEncoding1);
	
	ServletOutputStream sos = response.getOutputStream();
	int numRead;
	
	while((numRead = fis.read(b, 0, b.length)) != -1) {
		sos.write(b, 0, numRead);
	}
	sos.flush();
	sos.close();
	fis.close();
%>
















