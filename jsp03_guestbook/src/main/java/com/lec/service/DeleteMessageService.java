package com.lec.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.lec.dao.MessageDAO;
import com.lec.jdbc.ConnectionProvider;
import com.lec.jdbc.JDBCUtil;
import com.lec.model.Message;

public class DeleteMessageService {

	private DeleteMessageService() {}
	private static DeleteMessageService instance = new DeleteMessageService();
	public static DeleteMessageService getInstance() {
		return instance;
	}
	
	public void deleteMessage(int messageId, String password) {
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			MessageDAO messageDAO = MessageDAO.getInstance();
			Message message = messageDAO.select(conn, messageId);
			
			if(message == null) {
				throw new MessageNotFoundException("선택된 방명록이 없습니다!!");
			}
			
			if(!message.matchPassword(password)) {
				throw new InvalidPasswordException("비밀번호가 일치하지 않습니다!");
			}
			
			int deleteCount = messageDAO.delete(conn, messageId);
			
			conn.commit();
			
		} catch (SQLException e) {
			JDBCUtil.rollback(conn);
			throw new ServiceException("메시지삭제에 실패했습니다. " + e.getMessage(), e);
		} catch (InvalidPasswordException | MessageNotFoundException e) {
			JDBCUtil.rollback(conn);
			throw e;
		} finally {
			JDBCUtil.close(conn, null, null);
		}
	}
}
