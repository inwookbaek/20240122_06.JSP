package com.lec.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardDetailService;
import com.lec.board.vo.ActionFoward;
import com.lec.board.vo.BoardBean;

public class BoardDetailAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) {
		// 글상세보기
		int bno = Integer.parseInt(req.getParameter("bno"));
		
		BoardDetailService boardDetailService = new BoardDetailService();
		BoardBean board =  boardDetailService.getBoard(bno);
		
		ActionFoward forward = new ActionFoward();
		req.setAttribute("board", board);
		forward.setPath("/board/board_detail.jsp");
		
		return forward;
	}

}
