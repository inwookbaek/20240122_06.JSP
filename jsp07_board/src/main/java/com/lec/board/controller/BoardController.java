package com.lec.board.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.action.Action;
import com.lec.board.action.BoardDeleteAction;
import com.lec.board.action.BoardDeleteFormAction;
import com.lec.board.action.BoardDetailAction;
import com.lec.board.action.BoardListAction;
import com.lec.board.action.BoardModifyAction;
import com.lec.board.action.BoardModifyFormAction;
import com.lec.board.action.BoardReplyAction;
import com.lec.board.action.BoardReplyFormAction;
import com.lec.board.action.BoardWriteAction;
import com.lec.board.vo.ActionFoward;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
	
	Action action = null;
	ActionFoward forward = null;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		process(req, res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		process(req, res);
	}

	private void process(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// System.out.println("1. BoardController ................");
		// http://localhost:8080/jsp07_board/boardList.do?p=100&f=writer&q=홍길동&fn=첨부파일명
		
		req.setCharacterEncoding("utf-8");
		String p = req.getParameter("p");
		String f = req.getParameter("f");
		String q = req.getParameter("q");
		String fn = req.getParameter("fn");
		
		// http://localhost:8080/jsp07_board/boardWrite.do
		String requestURI = req.getRequestURI();   // /jsp07_board/boardWrite.do
		String contextPath = req.getContextPath(); // /jsp07_board 
		String command = requestURI.substring(contextPath.length()); // /boardWrite.do
		
//		System.out.println(requestURI);
//		System.out.println(contextPath);
//		System.out.println(command);
		
		if(command.equalsIgnoreCase("/boardWriteForm.do")) {
			forward = new ActionFoward();
			forward.setPath("/board/board_write.jsp");
		} else if(command.equalsIgnoreCase("/boardWrite.do")) {
			action = new BoardWriteAction();
			forward = action.execute(req, res);			
		} else if(command.equalsIgnoreCase("/boardList.do")) {
			action = new BoardListAction();
			forward = action.execute(req, res);			
		} else if(command.equalsIgnoreCase("/boardDetail.do")) {
			action = new BoardDetailAction();
			forward = action.execute(req, res);			
		} else if(command.equalsIgnoreCase("/boardModifyForm.do")) {
			action = new BoardModifyFormAction();
			forward = action.execute(req, res);			
		} else if(command.equalsIgnoreCase("/boardModify.do")) {
			action = new BoardModifyAction();
			forward = action.execute(req, res);			
		} else if(command.equalsIgnoreCase("/boardDeleteForm.do")) {
			action = new BoardDeleteFormAction();
			forward = action.execute(req, res);			
		} else if(command.equalsIgnoreCase("/boardDelete.do")) {
			action = new BoardDeleteAction();
			forward = action.execute(req, res);			
		} else if(command.equalsIgnoreCase("/boardReplyForm.do")) {
			action = new BoardReplyFormAction();
			forward = action.execute(req, res);			
		} else if(command.equalsIgnoreCase("/boardReply.do")) {
			action = new BoardReplyAction();
			forward = action.execute(req, res);			
		} else if(command.equalsIgnoreCase("/download.do")) {
			forward = new ActionFoward();
			forward.setPath("/board/board_download.jsp?p=" + p + "&f=" + f + "&q" + q + "&fn=" + fn);			
		} else if(command.equalsIgnoreCase("/error.do")) {
			forward = new ActionFoward();
			forward.setPath("/board/error.jsp");			
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				res.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, res);
			}
		}
	}
}





















