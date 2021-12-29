package com.shop.model;


import java.sql.*;
public class DBConn {
	final static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	final static String db_id = "system";
	final static String db_pw = "1234";
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection(url, db_id, db_pw);
		return conn;
	}
	//select
	public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
		if(rs !=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(stmt !=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn !=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(PreparedStatement stmt, Connection conn) {
		if(stmt !=null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn !=null ) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}