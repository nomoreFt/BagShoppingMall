package com.bag.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bag.service.MembersService;

public class MemberDeleteController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		 
		String sId = (String) session.getAttribute("sId");
		
		MembersService service = MembersService.getInstance();
		service.deleteMember(sId);
		
		session.invalidate();
		
		HttpUtil.forward(req, resp, "/memberDeleteResult.jsp");
	}

}
