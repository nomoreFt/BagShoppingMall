package com.bag.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bag.dao.BoardDAO;


@WebServlet("/BoardDeleteController")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BoardDeleteController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("bNum"));
		System.out.println(num);
		 BoardDAO dao = BoardDAO.getInstance();
		 dao.delete(num);
		 HttpUtil.forward(request, response, "page.ido");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
