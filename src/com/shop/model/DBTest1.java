package com.shop.model;
import java.sql.*;
public class DBTest1 {
	private static Connection conn = null;
	private static PreparedStatement stmt = null;
	private static ResultSet rs = null;
	
	public static void main(String[] args) {
		try {
			conn = DBConn.getConnection();
			String sql = "select * from coupon";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				System.out.println("쿠폰코드: "+rs.getString("ccode"));
			}
			DBConn.close(rs, stmt, conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
