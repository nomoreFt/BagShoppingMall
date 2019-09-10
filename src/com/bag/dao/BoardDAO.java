package com.bag.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.bag.vo.BoardVO;
import com.bag.vo.MembersVO;
import com.bag.vo.PagingVO;

public class BoardDAO {

	private static BoardDAO dao = new BoardDAO();

	private BoardDAO() {
		// TODO Auto-generated constructor stub
	}

	public static BoardDAO getInstance() {
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
	
	
	
	public ArrayList<BoardVO> selectAll(int page, int count, int totalPage) {

		
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int startNum = 0;
		int endNum = 0;
		
		if(totalPage+1 == page) {
			startNum = 1;
		}else {
			startNum = count -(10*page-1);
		}
		
		endNum = count - ((page-1)*10);
		
		String sql = "SELECT * FROM (" + "SELECT * FROM (" + "SELECT bNum row_num, board.* FROM board"
				+ ") WHERE row_num >= ?" + ") WHERE row_num <= ? ";
		
		
		try {
			conn = this.getConnect();
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, startNum);
			ps.setInt(2, endNum);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				
				BoardVO vo = new BoardVO();
				
				vo.setbNum(rs.getInt("bNum"));
				vo.setbTitle(rs.getString("bTitle"));
				vo.setbContents(rs.getString("bContents"));
				vo.setbHit_cnt(rs.getInt("bHit_cnt"));
				vo.setbDate(rs.getString("bDate")); 
				vo.setbId(rs.getString("bId"));
				
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
		
		String sql = "SELECT COUNT(*) as count FROM board";
		
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

	
	
	//현재의 시간을 가져오는 함수

	public String getDate() { 

		
		Connection conn = this.getConnect();
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		String SQL = "select to_char(sysdate,'yyyymmdd hh24:mi:ss') from dual";

		try {

			ps = conn.prepareStatement(SQL);

			rs = ps.executeQuery();

			if(rs.next()) {
				
				return rs.getString(1);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return ""; //데이터베이스 오류

	}
	
	
	
	
	//bNum 게시글 번호 가져오는 함수

	public int getNum() { 

		
		Connection conn = this.getConnect();
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		String SQL = "SELECT bNum FROM board ORDER BY bNum DESC";

		try {

			ps = conn.prepareStatement(SQL);

			rs = ps.executeQuery();

			if(rs.next()) {

				return rs.getInt(1) + 1;

			}

			return 1;//첫 번째 게시물인 경우

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; //데이터베이스 오류

	}
	
	
	
	//실제로 글을 작성하는 함수

	public int write(String title, String sId, String contents) { 

		String dd = getDate();
		Connection conn = this.getConnect();
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		String SQL = "INSERT INTO board VALUES(?, ?, ?, ?, ?, ?)";

		try {
			ps = conn.prepareStatement(SQL);

			ps.setInt(1, getNum());

			ps.setString(2, title);

			ps.setString(3, contents);

			ps.setInt(4, 1);

			ps.setString(5, getDate());
			
			ps.setString(6, sId);

			return ps.executeUpdate();

			

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; //데이터베이스 오류
	}

	public BoardVO getBoard(int bNum) {

		String SQL = "SELECT * FROM board WHERE bNum = ?";
		
		Connection conn = this.getConnect();
		PreparedStatement ps =null;
		ResultSet rs = null;

		try {

			ps = conn.prepareStatement(SQL);

			ps.setInt(1, bNum);

			rs = ps.executeQuery();

			if (rs.next()) {

				BoardVO bv = new BoardVO();

				bv.setbNum(rs.getInt("bNum"));

				bv.setbTitle(rs.getString("bTitle"));

				bv.setbContents(rs.getString("bContents"));

				bv.setbHit_cnt(rs.getInt("bHit_cnt"));
				
				bv.setbDate(rs.getString("bDate"));
				
				bv.setbId(rs.getString("bId"));

				return bv;

			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		
		return null;
	}
	
	
	   // DAO 조회수 증가 함수 
	   public int updateHit(int bNum, int bHit_cnt) {

	      String sql = "UPDATE board SET bHit_cnt=? WHERE bNum=?";

	      Connection conn = this.getConnect();
	      PreparedStatement ps = null;
	      
	      try {
	         
	         ps = conn.prepareStatement(sql);
	         
	         ps.setInt(1, bHit_cnt+1);
	         ps.setInt(2, bNum);

	         return ps.executeUpdate();
	         
	      } catch (Exception e) {

	         e.printStackTrace();

	      }

	      return -1 ; // 데이터베이스 오류

	   }

		//수정 함수

		public int update(String title, String contents, int num) {

				String SQL = "UPDATE board SET bTitle = ?, bContents = ? WHERE bNum = ?";

				Connection conn = this.getConnect();
				PreparedStatement ps =null;
				
				
				try {

					ps = conn.prepareStatement(SQL);

					ps.setString(1, title);

					ps.setString(2, contents);

					ps.setInt(3, num);

					return ps.executeUpdate();



				} catch (Exception e) {

					e.printStackTrace();

				}

				return -1; // 데이터베이스 오류

			}

		public int delete(int num) {

			String SQL = "DELETE FROM board WHERE bNum=?";

			Connection conn = this.getConnect();
			PreparedStatement ps = null;
			
			try {

				ps = conn.prepareStatement(SQL);   

				ps.setInt(1, num);

				return ps.executeUpdate();
				
			} catch (Exception e) {

				e.printStackTrace();

			}

			return -1; // 데이터베이스 오류

		}

	
}
