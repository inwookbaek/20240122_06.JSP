package com.lec.board.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardModifyService;
import com.lec.board.vo.ActionFoward;
import com.lec.board.vo.BoardBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardModifyAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) {
		
		ActionFoward forward = new ActionFoward();
		BoardBean board = null;
		
		String saveFolder = "d:/lec/00.share/98.temp/upload";
		int fileSize = 1024*1024*5; // 5MB
		
		ServletContext context = req.getServletContext();
		boolean isWriter = false;
		boolean isModifySuccess = false;
		
		try {
			MultipartRequest multi = new MultipartRequest(req, saveFolder, 
					fileSize, "utf-8", new DefaultFileRenamePolicy());
			
			int bno = Integer.parseInt(multi.getParameter("bno"));
			String pass = multi.getParameter("pass");
			board = new BoardBean();
			BoardModifyService boardModifyService = new BoardModifyService();
			isWriter = boardModifyService.isBoardWriter(bno, pass);
			
			if(isWriter) {
				
				board.setBno(bno);
				board.setSubject(multi.getParameter("subject"));
				board.setContent(multi.getParameter("content"));
				board.setFile(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
				isModifySuccess = boardModifyService.modifyBoard(board);
				
				if(isModifySuccess) {
					forward = new ActionFoward();
					forward.setRedirect(true);
					forward.setPath("boardDetail.do?bno=" + bno);
				} else {
					res.setContentType("text/html; charset=utf-8");
					PrintWriter out = res.getWriter();
					out.println("<script>");
					out.println("  alert('게시글을 삭제하는데 실패했습니다!!')");
					out.println("  history.back()");
					out.println("</script>");	
					forward = new ActionFoward();
					forward.setRedirect(true);
					forward.setPath("error.do");					
				}				
			} else {
				res.setContentType("text/html; charset=utf-8");
				PrintWriter out = res.getWriter();
				out.println("<script>");
				out.println("  alert('게시글을 수정할 권한이 없습니다!!')");
				out.println("  history.back()");
				out.println("</script>");	
				forward = new ActionFoward();
				forward.setRedirect(true);
				forward.setPath("error.do?msg=게시글을 수정할 권한이 없습니다!!");					
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return forward;
	}

}
