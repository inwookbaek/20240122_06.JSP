package com.lec.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hxxx")
public class HelloWorld extends HttpServlet {

	public HelloWorld() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// System.out.println("HelloWorld by GET");
		res.setCharacterEncoding("utf-8");
		PrintWriter out = res.getWriter();
		
		out.println("<h3>");
		out.println("HelloWorld by GET");
		out.println("</h3>");
		out.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// System.out.println("HelloWorld by POST");
		res.setCharacterEncoding("utf-8");
		PrintWriter out = res.getWriter();
		out.println("<h3>");
		out.println("HelloWorld by POST");
		out.println("</h3>");
		out.close();
	}
}
