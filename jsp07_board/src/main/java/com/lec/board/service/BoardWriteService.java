package com.lec.board.service;

import java.sql.Connection;

import com.lec.board.dao.BoardDAO;
import com.lec.board.vo.BoardBean;
import com.lec.db.JDBCUtility;

public class BoardWriteService {

	public boolean registerBoard(BoardBean board) {
		
		boolean isWriteSeuccess = false;
		
		Connection conn = JDBCUtility.getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		int insertCount = boardDAO.insert(board);
				
		if(insertCount > 0) {
			JDBCUtility.commit(conn);
			JDBCUtility.close(conn, null, null);
			isWriteSeuccess = true;
		} else {
			JDBCUtility.rollback(conn);
		}		
		return isWriteSeuccess;
	}
}
