package com.bag.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bag.service.MembersService;
import com.bag.vo.MembersVO;

public class MemberUpdateController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		 
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		int tel = Integer.parseInt(req.getParameter("tel"));
		String addr = req.getParameter("addr");
		String accname = req.getParameter("accname");
		String accbank = req.getParameter("accbank");
		String accnum = req.getParameter("accnum");	
		
		MembersVO member = new MembersVO(id, pw, name, tel, addr, accname, accbank, accnum);	
		
		MembersService service = MembersService.getInstance();
		service.updateMember(member);
		
		req.setAttribute("member", member);
		
		HttpUtil.forward(req, resp, "index.jsp");
		 
	}

}
