package com.bag.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bag.vo.BagsVO;
import com.bag.vo.MembersVO;

public class BagsDAO {

	private static BagsDAO dao = new BagsDAO();

	private BagsDAO() {
		// TODO Auto-generated constructor stub
	}

	public static BagsDAO getInstance() {
		return dao;
	}

	public Connection getConnect() {
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	public void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		close(conn, ps);
	}

	public void close(Connection conn, PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public List<BagsVO> selectAllBags(int page) {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int startNum = page*12 -11;
		int endNum = page*12;   	//1 ~ 12   13 ~ 24  25 36
		String sql = "SELECT * FROM (" + "SELECT * FROM (" + "SELECT num row_num, bags.* FROM bags"
				+ ") WHERE row_num >= ?" + ") WHERE row_num <= ?";
		List<BagsVO> list = new ArrayList<BagsVO>();
		try {
			conn = this.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startNum);
			ps.setInt(2, endNum);
			rs = ps.executeQuery();
			while (rs.next()) {
				BagsVO vo = new BagsVO();
				vo.setNum(rs.getString("num"));
				vo.setBag_src(rs.getString("bag_src"));
				vo.setBag_name(rs.getString("bag_name"));
				vo.setBag_price(rs.getString("bag_price"));
				vo.setBag_link(rs.getString("bag_link"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, ps, rs);
		}
		return list;
	}
	
	

	public int getAllCount() {
		String sql = "SELECT COUNT(*) as count FROM bags";
		Connection conn = this.getConnect();
		PreparedStatement ps =null;
		ResultSet rs = null;
		int count = 0;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				close(conn, ps, rs);
		}
		return count;
	}

	
	
	public BagsVO searchBag(String selectedBag) {
		Connection conn = this.getConnect();
		PreparedStatement ps = null;
		ResultSet rs = null;
		BagsVO vo = new BagsVO();
		try {
			ps = conn.prepareStatement("select * from bags where bag_name = ?");
			ps.setString(1, selectedBag);
			rs = ps.executeQuery();
			if(rs.next()) {
				vo.setBag_src(rs.getString("bag_src"));
				vo.setBag_name(rs.getString("bag_name"));
				vo.setBag_price(rs.getString("bag_price"));
				vo.setBag_link(rs.getString("bag_link"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}

}
