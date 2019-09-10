package com.bag.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bag.dao.BoardDAO;


@WebServlet("/BoardInsertController")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BoardInsertController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String sId = (String) session.getAttribute("sId");
		
		 BoardDAO dao = BoardDAO.getInstance();
		 dao.write(title, sId, contents);
		 HttpUtil.forward(request, response, "page.ido");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
