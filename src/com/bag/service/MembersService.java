package com.bag.service;

import java.sql.SQLException;

import com.bag.dao.MembersDAO;
import com.bag.vo.MembersVO;

public class MembersService {
	
	private static MembersService service = new MembersService();
	MembersDAO dao = MembersDAO.getInstance();
	
	public MembersService() {
		// TODO Auto-generated constructor stub
	};
	
	public static MembersService getInstance() {
		return service;
	} 
	
	public void insertMember(MembersVO member) {
		dao.insertMember(member);
	}
	
	public int loginCheck(String id, String pw) {
		return dao.loginCheck(id, pw);
	}

	public MembersVO searchMember(String name, int tel) throws SQLException {
		return dao.searchMember(name,tel);
	}
	
	public MembersVO searchMe(String id) throws SQLException {
		return dao.searchMe(id);
	}

	public void updateMember(MembersVO member) {
		dao.updateMember(member);
		
	}

	public void deleteMember(String sId) {
		dao.deleteMember(sId);
	}

	
}
