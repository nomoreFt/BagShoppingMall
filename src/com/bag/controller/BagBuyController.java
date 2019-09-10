package com.bag.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/bagbuy.ido")
public class BagBuyController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession sess = req.getSession();
		List<String> arr = (ArrayList<String>) sess.getAttribute("buyList");	
		System.out.println(sess.getAttribute("buyList"));
		String sum = req.getParameter("sum");

		req.setAttribute("sum", sum);
		for(int i = 0; i<arr.size();i++) {
		System.out.println(arr.get(i).toString() + "이것은 컨트롤러 ^ㅇ^");
		}
		HttpUtil.forward(req, resp, "/bagBuy.jsp");
	}
	
}
