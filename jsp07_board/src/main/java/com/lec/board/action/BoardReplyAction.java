package com.lec.board.action;

import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardReplyService;
import com.lec.board.vo.ActionFoward;
import com.lec.board.vo.BoardBean;

public class BoardReplyAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) {
		
		ActionFoward forward = new ActionFoward();
		BoardBean board = new BoardBean();
		
		board.setBno(Integer.parseInt(req.getParameter("bno")));
		board.setWriter(req.getParameter("writer"));
		board.setPass(req.getParameter("pass"));
		board.setSubject(req.getParameter("subject"));
		board.setContent(req.getParameter("content"));
		board.setRe_ref(Integer.parseInt(req.getParameter("re_ref")));
		board.setRe_lev(Integer.parseInt(req.getParameter("re_lev")));
		board.setRe_seq(Integer.parseInt(req.getParameter("re_seq")));
		
		// 댓글로직
		BoardReplyService boardReplyService = new BoardReplyService();
		boolean isReplySuccess = boardReplyService.replyBoard(board);
		
		if(isReplySuccess) {
			forward = new ActionFoward();
			forward.setRedirect(true);
			forward.setPath("boardList.do");
		} else {
			res.setContentType("text/html; charset=utf-8");
			try {
				PrintWriter out = res.getWriter();
				out.println("<script>");
				out.println("  alert('댓글 등록이 실패했습니다!')");
				out.println("  history.back()");				
				out.println("</script>");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		return forward;
	}

}














