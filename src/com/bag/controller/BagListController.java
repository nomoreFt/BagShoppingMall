package com.bag.controller;
 
import java.io.IOException;
import java.util.List;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bag.dao.BagsDAO;
import com.bag.dao.MembersDAO;
import com.bag.vo.BagsVO;
import com.bag.vo.MembersVO;
import com.bag.vo.PagingVO;

 
@SuppressWarnings("serial")
@WebServlet("/baglist.ido")
public class BagListController extends HttpServlet{
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	
    	req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
    	
    	BagsDAO dao = BagsDAO.getInstance();
        int page = 1;
        
        if(req.getParameter("page")!=null){
            page = Integer.parseInt(req.getParameter("page"));
        }
        PagingVO paging = new PagingVO();
        int count = dao.getAllCount();
        
        paging.setTotalCount(count);//전체 정보 개수
        paging.setPage(page);//현재 페이지 저장
        paging.setCountList(12);//나올 row 개수 정하기
        paging.setCountPage(10);//페이지에 따라 출력될 페이지 1~10<more>
        paging.setTotalPage(paging.getTotalCount()/paging.getCountList());//전체페이지개수구하기
        paging.setStartPage(((paging.getPage()-1)/10) * 10 +1);//시작 페이지
        paging.setEndPage(paging.getStartPage()+paging.getCountPage()-1);
       
        req.setAttribute("paging", paging);
        List<BagsVO> list = dao.selectAllBags(page);
        req.setAttribute("list", list);
        
        RequestDispatcher dispatcher = req.getRequestDispatcher("/bag/bagOut.jsp");
        dispatcher.forward(req, res);
    }
}


