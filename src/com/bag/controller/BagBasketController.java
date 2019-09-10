package com.bag.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bag.dao.BagsDAO;
import com.bag.vo.BagsBasketVO;
import com.bag.vo.BagsVO;

public class BagBasketController implements Controller {
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		BagsDAO dao = BagsDAO.getInstance();
		HttpSession sess = req.getSession();
		HashMap<String, Object> map = null;
		 
		
		//hash맵 중복 처리
		if(sess.getAttribute("map")==null) {
			map = new HashMap<>();
		}else {
			map = (HashMap)sess.getAttribute("map");
		}
		//파라미터 받기
		String selectedNum = req.getParameter("selectedNum");
		String selectedBag = req.getParameter("selectedBag");
		
	
		//장바구니에 기존 상품이있는지 검사
		if(map.containsKey(selectedBag)) {
			BagsBasketVO bagsBasketVO1 = (BagsBasketVO) map.get(selectedBag);
			bagsBasketVO1.setSelectedBag(selectedBag);
			bagsBasketVO1.setSelectedNum(Integer.parseInt(selectedNum) + bagsBasketVO1.getSelectedNum());
			map.put(selectedBag, bagsBasketVO1);
			System.out.println("맵에 기존 가방이 있는 경우 실행");
		}else {
			BagsBasketVO bagsBasketVO2 = new BagsBasketVO();
			bagsBasketVO2.setSelectedBag(selectedBag);
			bagsBasketVO2.setSelectedNum(Integer.parseInt(selectedNum));
			map.put(selectedBag, bagsBasketVO2);
			System.out.println("맵에 기존 가방이 없는 경우 실행");
		}
		

	
		
		//가방 리스트 db 꺼내오기
		
		
		List<BagsVO> list = new ArrayList<BagsVO>();
		
		Iterator<String> keys = map.keySet().iterator();
		while( keys.hasNext() ){
		    String key = keys.next();
			BagsVO vo = dao.searchBag(key);
			System.out.println("list에 들어가는 vo" +  vo);
			list.add(vo);
		}
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getBag_src());
		}
				sess.setAttribute("map", map);
				req.setAttribute("list", list);
		
		HttpUtil.forward(req, resp, "/basket/basketOut.jsp");
	}

}
