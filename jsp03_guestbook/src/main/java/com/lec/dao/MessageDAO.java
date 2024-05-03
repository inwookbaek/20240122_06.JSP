package com.lec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.lec.jdbc.JDBCUtil;
import com.lec.model.Message;

public class MessageDAO {
	
	private MessageDAO() {}
	private static MessageDAO messageDAO = new MessageDAO();
	public static MessageDAO getInstance() {
		return messageDAO;
	}

	public List<Message> selectList(Connection conn, int firstRow, int endRow) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from guestbook_message "
				   + " order by message_id desc limit ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, firstRow-1);
			pstmt.setInt(2, endRow-1);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				List<Message> messageList = new ArrayList<Message>();
				do {
					messageList.add(makeMessage(rs));
				} while(rs.next());
				return messageList;
			} else {
				return Collections.emptyList();
			}
		} finally {
			JDBCUtil.close(null, pstmt, rs);
		}
	}
	
	public Message makeMessage(ResultSet rs) throws SQLException {
		Message message = new Message();
		message.setId(rs.getInt("message_id"));
		message.setGuestName(rs.getString("guest_name"));
		message.setPassword(rs.getString("password"));
		message.setMessage(rs.getString("message"));		
		return message;
	}
	
	public int insert(Connection conn, Message message) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "insert into guestbook_message " 
		           + " (guest_name, password, message) "
				   + " values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			return pstmt.executeUpdate();
		} finally {
			JDBCUtil.close(conn, pstmt, null);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from guestbook_message";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			return rs.getInt(1);
		} finally {
			JDBCUtil.close(null, stmt, rs);
		}
	}

	public Message select(Connection conn, int messageId) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from guestbook_message where message_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageId);
			rs = pstmt.executeQuery();
			if(rs.next()) return makeMessage(rs);
			else return null;
		} finally {
			JDBCUtil.close(null, pstmt, rs);
		}
	}
	
	
	public int delete(Connection conn, int messageId) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "delete from guestbook_message where message_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageId);
			return pstmt.executeUpdate();
		} finally {
			JDBCUtil.close(null, pstmt, null);
		} 
	}
	
	public int update(Connection conn, int messageId, String msg) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "update guestbook_message set message = ? "
				   + " where message_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, msg);
			pstmt.setInt(2, messageId);
			return pstmt.executeUpdate();
		} finally {
			JDBCUtil.close(null, pstmt, null);
		} 
	}

}














