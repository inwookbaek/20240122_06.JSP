package com.lec.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.lec.dao.MessageDAO;
import com.lec.jdbc.ConnectionProvider;
import com.lec.model.Message;

public class WriteMessageService {

	private WriteMessageService() {}
	private static WriteMessageService instance = new WriteMessageService();
	public static WriteMessageService getInstance() {
		return instance;
	}
	
	public void write(Message message) { 
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDAO messageDAO = MessageDAO.getInstance();
			messageDAO.insert(conn, message);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
