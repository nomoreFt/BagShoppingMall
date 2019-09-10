package com.bag.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bag.vo.MembersVO;

public class MembersDAO {
	
	private static MembersDAO dao = new MembersDAO();
	public MembersDAO() {}
	
	public static MembersDAO getInstance() {
		return dao;
	} //외부에서 dao 접글할 때
	
	public Connection getConnection() { //내부에서 connection
		
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	
	//연결 닫는 메서드 오버로드
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

	
	public ArrayList<MembersVO> getAllInfo() throws SQLException{ 
		
		ArrayList<MembersVO> mList = new ArrayList<MembersVO>();
		
		String sql = "SELECT * FROM members ORDER BY id";
		
		Connection conn = this.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ps = conn.prepareStatement(sql); 
		rs = ps.executeQuery(); 
		
		while(rs.next()) { 
			
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			int tel = rs.getInt("tel");
			String addr = rs.getString("addr");
			String accname = rs.getString("accname");
			String accbank = rs.getString("accbank");
			String accnum = rs.getString("accnum");
			
			/*MembersVO tv = new MembersVO(id, pw, name, tel, addr, accname, accbank, accnum);
			mList.add(tv);*/
		}
		
		return mList; 
	} 
	
	
	public void insertMember(MembersVO member) {
		
		Connection conn = this.getConnection();
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement("INSERT INTO members VALUES(?,?,?,?,?,?,?,?)");
			
			ps.setString(1, member.getId());
			ps.setString(2, member.getPw());
			ps.setString(3, member.getName());
			ps.setInt(4, member.getTel());
			ps.setString(5, member.getAddr());
			ps.setString(6, member.getAccname());
			ps.setString(7, member.getAccbank());
			ps.setString(8, member.getAccnum());
			
			ps.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, ps);
		}
	}
	
	
	 public int loginCheck(String id, String pw) {
		 
	     	Connection conn = this.getConnection();
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	 
	        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
	        int x = -1;
	 
	        try {
	            String sql ="SELECT pw FROM members WHERE id=?";
	 
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, id);
	            rs = ps.executeQuery();
	 
	            if (rs.next()) { //입력된 아이디에 비번이 있는 경우
	            	
	                dbPW = rs.getString("pw");
	                
	                if (dbPW.equals(pw)) 
	                    x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
	                else                  
	                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
	                
	            } else {
	                x = -1; // 해당 아이디가 없을 경우
	            }
	 
	            return x;
	 
	        } catch (Exception sqle) {
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	        	close(conn, ps, rs);
	        }
	    }

		public MembersVO searchMember(String name, int tel) { 
			
			MembersVO tv = null;
			
			String sql = "SELECT * FROM members WHERE name=? AND tel=?";
			
			Connection conn = this.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				ps.setInt(2, tel);
				rs = ps.executeQuery();
				
				while(rs.next()) { 
					
					String rid = rs.getString("id");
					String rpw = rs.getString("pw");
					String rname = rs.getString("name");
					int rtel = rs.getInt("tel");
					String raddr = rs.getString("addr");
					String raccname = rs.getString("accname");
					String raccbank = rs.getString("accbank");
					String raccnum = rs.getString("accnum");
					
					tv = new MembersVO(rid, rpw, rname, rtel, raddr, raccname, raccbank, raccnum);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  finally {
	        	close(conn, ps, rs);
	        }
	
			
			return tv; 
		} 
		
		
		public MembersVO searchMe(String id) { 
			
			MembersVO tv = null;
			
			String sql = "SELECT * FROM members WHERE id=?";
			
			Connection conn = this.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				
				while(rs.next()) { 
					
					String rid = rs.getString("id");
					String rpw = rs.getString("pw");
					String rname = rs.getString("name");
					int rtel = rs.getInt("tel");
					String raddr = rs.getString("addr");
					String raccname = rs.getString("accname");
					String raccbank = rs.getString("accbank");
					String raccnum = rs.getString("accnum");
					
					tv = new MembersVO(rid, rpw, rname, rtel, raddr, raccname, raccbank, raccnum);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
	        	close(conn, ps, rs);
	        }
			
			return tv; 
		}

		public void updateMember(MembersVO mv) {
			
			String id = mv.getId();
			String name = mv.getName();
			String pw = mv.getPw();
			int tel = mv.getTel();
			String addr = mv.getAddr();
			String accname = mv.getAccname();
			String accbank = mv.getAccbank();
			String accnum = mv.getAccnum();
			
			Connection conn = this.getConnection();
			PreparedStatement ps = null;
			
			String sql = "UPDATE members SET name=?, pw=?, tel=?, addr=?, accname=?, accbank=?, accnum=? WHERE id=?";
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, pw);
				ps.setInt(3, tel);
				ps.setString(4, addr);
				ps.setString(5, accname);
				ps.setString(6, accbank);
				ps.setString(7, accnum);
				ps.setString(8, id);
				ps.executeUpdate();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} finally {
	        	close(conn, ps);
	        }
			
		}

		public void deleteMember(String sId) {
			
			Connection conn = this.getConnection();
			PreparedStatement ps = null;
			
			System.out.println("DAO sId"+sId);
			String sql = "DELETE FROM members WHERE id=?";
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, sId);
				ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
	        	close(conn, ps);
	        }
			
		} 
}
