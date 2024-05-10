package com.lec.board.action;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardDetailService;
import com.lec.board.vo.ActionFoward;
import com.lec.board.vo.BoardBean;

public class BoardModifyFormAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) {
		
		ActionFoward forward = new ActionFoward();
		int bno = Integer.parseInt(req.getParameter("bno"));
		
		BoardDetailService boardDetailService = new BoardDetailService();
		BoardBean board = boardDetailService.getBoard(bno);
		
		req.setAttribute("board", board);
		forward.setPath("/board/board_modify.jsp");
		return forward;
	}

}
