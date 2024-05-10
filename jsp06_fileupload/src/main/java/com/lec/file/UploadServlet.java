package com.lec.file;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

//@WebServlet("/upload")
public class UploadServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		
		PrintWriter writer = res.getWriter();
		
		writer.println("<html><body>");
		
		String contentType = req.getContentType();
		if(contentType !=null && contentType.toLowerCase().startsWith("multipart/")) {
			printPartInfo(req, writer);
		} else {
			writer.println("컨텐츠타입이 multipart가 아닙니다!!");
		}
		
		writer.println("</body></html>");

	}

	private void printPartInfo(HttpServletRequest req, PrintWriter writer) 
		throws IOException, ServletException {
		// writer.println("컨텐츠타입이 multipart Form 입니다!!!");
		String fileName = "";
		int lastIndex = 0;
		
		Collection<Part> parts = req.getParts();
		
		// 첨부파일이 문장열이 아니라 바이너리데이터이기 때문체 처리하는
	    // 방법이 다르다. Servlet3.0이후에 제공되는 Part interface의
		// getPart, getParts, getName...등의 메서드를 이용해서 요청으로
		// 전송된 inpurt데이터를 처리할 수 있다.
		for(Part part:parts) {
			writer.println("<br> name = " + part.getName()); // 파일명추출
			writer.println("<br> contentType = " + part.getContentType()); // 파일명추출
			if(part.getHeader("Content-Disposition").contains("filename=")) {
				writer.println("<br> size = " + part.getSize()); // 파일크기	
				
				// MSIE는 폴더와 파일명이 구분되지 않는 오류가 있다.
				// fileName = part.getSubmittedFileName();
				
				fileName = getFileName(part);
				// System.out.println(fileName);
				lastIndex = fileName.lastIndexOf("\\");
				fileName = fileName.substring(lastIndex+1);
				// System.out.println(fileName);
				
				writer.println("<br> filename = " + fileName); // 폴더를 제외한 순수 파일명 추출
				
				if(part.getSize() > 0) {
					part.write(fileName);
					part.delete();
				}
				
			} else {
				String value = req.getParameter(part.getName());
				writer.println("<br> value = " + value); 			
			}
			writer.println("<hr>"); 						
		}
	}

	// C:tomcat-9RUNNING.txt -> C:tomcat-9\RUNNING.txt
	private String getFileName(Part part) {
		// filename="파일이름1"; filename="c:\fold1\"파일이름2";
		for(String cd:part.getHeader("Content-Disposition").split(";")) {
			if(cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') +1).trim().replace("\"", "");
			}
		}
		return null;
	}
}




















