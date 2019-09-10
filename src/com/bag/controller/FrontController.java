package com.bag.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	HashMap<String, Controller> list = null;
	String charset = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		charset = config.getInitParameter("charset");
		
		list = new HashMap<String,Controller>();
		
		list.put("/memberLogin.do", new MemberLoginController());
		list.put("/memberRegis.do", new MemberInsertController());
		list.put("/memberSearchId.do", new MemberSearchIdController());
		list.put("/memberSearchPw.do", new MemberSearchPwController());
		list.put("/memberUpdate.do", new MemberUpdateController());
		list.put("/memberDelete.do", new MemberDeleteController());
		list.put("/bagbasket.do", new BagBasketController());
		list.put("/bagbasket2.do",new BagBasketController2());
		list.put("/memberLogout.do", new MemberLogoutController());
	}

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding(charset);
		resp.setCharacterEncoding(charset);
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String path = uri.substring(contextPath.length());
		
		Controller subController = list.get(path);
		subController.execute(req,resp);
		
		
	}
}
