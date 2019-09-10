package com.bag.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bag.service.MembersService;
import com.bag.vo.MembersVO;

public class MemberSearchPwController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id;
		String name = null;
		int tel = 0;
		
		if(req.getParameter("id") != null) {
			id = req.getParameter("id");
			name = req.getParameter("name");
			tel = Integer.parseInt(req.getParameter("tel"));
		}
		
		MembersVO mv = null;
		
		MembersService service = MembersService.getInstance();
		try {
			mv = service.searchMember(name, tel);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*System.out.println(mv.getId());*/
		req.setAttribute("id", mv.getId());
		req.setAttribute("pw", mv.getPw());
		
		HttpUtil.forward(req, resp, "/whatPwResult.jsp");
	}

}
