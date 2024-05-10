package com.lec.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardDeleteService;
import com.lec.board.vo.ActionFoward;

public class BoardDeleteAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) {
		
		ActionFoward forward = new ActionFoward();
		boolean isWriter = false;
		boolean isDeleteSuccess = false;
		
		int bno = Integer.parseInt(req.getParameter("bno"));
		BoardDeleteService boardDeleteService = new BoardDeleteService();
		isWriter = boardDeleteService.isBoardWriter(bno, req.getParameter("pass"));
		
		if(isWriter) {
			isDeleteSuccess = boardDeleteService.deleteBoard(bno);
			
			if(isDeleteSuccess) {
				forward = new ActionFoward();
				forward.setRedirect(true);
				forward.setPath("boardList.do");				
			} else {
				try {
					res.setContentType("text/html; charset=utf-8");
					PrintWriter out = res.getWriter();
					out.println("<script>");
					out.println("  alert('게시글을 삭제하는데 실패했습니다!!')");
					out.println("  history.back()");
					out.println("</script>");					
				} catch (Exception e) {
					e.printStackTrace();
				}				
			}
		} else {
			try {
				res.setContentType("text/html; charset=utf-8");
				PrintWriter out = res.getWriter();
				out.println("<script>");
				out.println("  alert('게시글을 삭제할 권한이 없습니다!!')");
				out.println("  history.back()");
				out.println("</script>");					
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return forward;
	}
}
