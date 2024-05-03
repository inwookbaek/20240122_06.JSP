package com.lec.db;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet {

	@Override
	public void init() throws ServletException {
		// System.out.println("1. init()");
		loadJDBCDriver();
		initConnetionPool();
	}
	
	private void loadJDBCDriver() {
		String DRV = getInitParameter("jdbcDriver");
		// System.out.println(DRV + ", JDBC 드라이버로딩 성공!!");
		try {
			Class.forName(DRV);
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC 드라이버로딩 실패!!");
			e.printStackTrace();
		}
	}

	private void initConnetionPool() {
		String URL = getInitParameter("jdbcURL");
		String USR = getInitParameter("dbUser");
		String PWD = getInitParameter("dbPass");
		// System.out.println(URL + ", " + USR + ", " + PWD );
		
		// Connection Pool 사용하려면
		// 1. commons-dbcp2-?.?.jar
		// 2. commons-pool2-?.?.jar
		// 3. commons-logging-?.?.jar
		// 4. web.xml에 poolName을 등록
		ConnectionFactory connectionFactory = new DriverManagerConnectionFactory(URL, USR, PWD);
		PoolableConnectionFactory poolFactory = new PoolableConnectionFactory(connectionFactory, null);
		poolFactory.setValidationQuery("select 1");  // 커넥셕유효성을 검사 (mysql or mariaDB)
		// poolFactory.setValidationQuery("select * from dual");  // 커넥셕유효성을 검사 (oracle)
		
		GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
		poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L); // 사용가능한 커넥션유무 검사 주기
		poolConfig.setTestWhileIdle(true);  // pool에 보관중인 커넥션 유효검사 여부
		poolConfig.setMinIdle(5);   // 커넥션 최소 갯수
		poolConfig.setMaxTotal(10);   // 커넥션 최대 갯수
		
		GenericObjectPool<PoolableConnection> connPool = new GenericObjectPool(poolFactory, poolConfig);
		poolFactory.setPool(connPool);  // 생성된 커넥션을 연결
		
		try {
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			String poolName = getInitParameter("poolName");
			driver.registerPool(poolName, connPool);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}