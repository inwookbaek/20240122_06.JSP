package com.lec.board.action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardWriteService;
import com.lec.board.vo.ActionFoward;
import com.lec.board.vo.BoardBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) {
		// System.out.println("1. 글등록하기!!!");
		ActionFoward forward = null;
		
		BoardBean board = null;
		String realFolder = "";
		String saveFolder = "d:/lec/00.share/98.temp/upload";
		int fileSize = 1024*1024*5; // 5MB
		
		ServletContext context = req.getServletContext();
		realFolder = context.getRealPath("boardUpload");
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(req, saveFolder, fileSize, "utf-8"
					, new DefaultFileRenamePolicy());
			board = new BoardBean();
			board.setWriter(multi.getParameter("writer"));
			board.setPass(multi.getParameter("pass"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));

//			첨부파일이 여러건일 경우
//			Enumeration<String> files = multi.getFileNames();
//			String element = "";
//			if(files.hasMoreElements()) {
//				element = (String) files.nextElement();
//				System.out.println(multi.getOriginalFileName(element));
//			}
			
			// insert로직
			BoardWriteService boardWriteService = new BoardWriteService();
			boolean isWriteSuccess = boardWriteService.registerBoard(board);
			
			if(isWriteSuccess) {
				forward = new ActionFoward();
				forward.setRedirect(true);
				forward.setPath("boardList.do");
			} else {
				res.setContentType("text/html; charset=utf-8");
				PrintWriter out = res.getWriter();
				out.println("<script>");
				out.println("  alert('게시글등록이 실패했습니다!')");
				out.println("  history.back()");				
				out.println("</script>");
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return forward;
	}

}
