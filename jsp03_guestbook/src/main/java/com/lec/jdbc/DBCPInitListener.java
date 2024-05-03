package com.lec.jdbc;

import java.io.IOException;
import java.io.StringReader;
import java.sql.DriverManager;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.w3c.dom.ranges.RangeException;

public class DBCPInitListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		String poolConfig = sce.getServletContext().getInitParameter("poolConfig");
		Properties prop = new Properties();

		try {
			prop.load(new StringReader(poolConfig));
		} catch (IOException e) {
			throw new RuntimeException("web.xml:환경설정파일로딩실패!!!", e);
		}
		loadJDBCDriver(prop);
		initConnetionPool(prop);			
	}
	
	private void loadJDBCDriver(Properties prop) {
		String DRV = prop.getProperty("jdbcDriver");		
		try {
			Class.forName(DRV);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("JDBC 드라이버로딩 실패!!");
		}		
	}

	private void initConnetionPool(Properties prop) {
		String URL = prop.getProperty("url");		
		String USR = prop.getProperty("usr");		
		String PWD = prop.getProperty("pwd");	
		
		ConnectionFactory connectionFactory = new DriverManagerConnectionFactory(URL, USR, PWD);
		PoolableConnectionFactory poolFactory = new PoolableConnectionFactory(connectionFactory, null);
		poolFactory.setValidationQuery("select 1");
		
		GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
		poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
		poolConfig.setTestWhileIdle(true);
		poolConfig.setMinIdle(5); 
		poolConfig.setMaxTotal(10);
		
		GenericObjectPool<PoolableConnection> connPool = new GenericObjectPool(poolFactory, poolConfig);
		poolFactory.setPool(connPool);
		
		try {
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			driver.registerPool("guestbook", connPool);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}		
	}
}
