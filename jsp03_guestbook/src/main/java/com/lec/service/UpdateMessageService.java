package com.lec.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.lec.dao.MessageDAO;
import com.lec.jdbc.ConnectionProvider;
import com.lec.jdbc.JDBCUtil;
import com.lec.model.Message;

public class UpdateMessageService {
	
	private UpdateMessageService() {}
	private static UpdateMessageService instance = new UpdateMessageService();
	public static UpdateMessageService getInstance() {
		return instance;
	}
	
	public Message getMessage(int messageId) throws SQLException {
		
		Connection conn = ConnectionProvider.getConnection();
		MessageDAO messageDAO = MessageDAO.getInstance();
		Message message = messageDAO.select(conn, messageId);
		return message;
		
	}
	
	public void updateMessage(int messageId, String password, String msg) {
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			MessageDAO messageDAO = MessageDAO.getInstance();
			Message message = messageDAO.select(conn, messageId);
			
			if(!message.matchPassword(password)) {
				throw new InvalidPasswordException("비밀번호가 일치하지 않습니다!");
			}
			
			int updateCount = messageDAO.update(conn, messageId, msg);			
			conn.commit();
			
		} catch (SQLException e) {
			JDBCUtil.rollback(conn);
			throw new ServiceException("메시지수정에 실패했습니다. " + e.getMessage(), e);
		} catch (InvalidPasswordException e) {
			JDBCUtil.rollback(conn);
			throw e;
		} finally {
			JDBCUtil.close(conn, null, null);
		}
	}	
}
