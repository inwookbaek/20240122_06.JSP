package com.lec.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.dao.BoardDAO;
import com.lec.board.service.BoardListService;
import com.lec.board.vo.ActionFoward;
import com.lec.board.vo.BoardBean;
import com.lec.board.vo.PageInfo;

public class BoardListAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) {
		
		List<BoardBean> boardList = new ArrayList<>();
		
		int page = 1;
		int limit = 10;
		
		int p = page;
		String f = "";
		String q = "";
		
		// localhost:8080/boardList.do?p=1&f=writer&q=홍
		if(req.getParameter("p") != null) p = Integer.parseInt(req.getParameter("p"));
		if(req.getParameter("f") != null) f = req.getParameter("f"); else f = "subject";
		if(req.getParameter("q") != null) q = req.getParameter("q");
		
		BoardListService boardListService = new BoardListService();
		int listCount = boardListService.getListCount(f, q);
		boardList =  boardListService.getBoardList(p, limit, f, q);
		
		// 총페이지수
		int totalPage = (int)((double)listCount / limit + 0.95);
		
		// 현재페이지의 시작페이지수(1~10, 11~20 ... 91~100, 101)
		int startPage = (p-1) / 10 * 10 + 1;
		
		// 마지막페이지
		int endPage = startPage + 9;
		endPage = endPage > totalPage ? (totalPage > 0 ? totalPage : 1) : endPage;
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setListCount(listCount);
		pageInfo.setPage(page);
		pageInfo.setTotalPage(totalPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
			
		req.setAttribute("boardList", boardList);
		req.setAttribute("pageInfo", pageInfo);
		
		ActionFoward foward = new ActionFoward();
		foward.setPath("/board/board_list.jsp?p=" + p + "&f=" + f + "&q=" + q);		
		return foward;
	}

}
