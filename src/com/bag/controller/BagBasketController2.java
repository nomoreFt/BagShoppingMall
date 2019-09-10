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

public class BagBasketController2 implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		
		BagsDAO dao = BagsDAO.getInstance();
		HttpSession sess = req.getSession();
		HashMap<String, Object> map = null;
		//map.put(selectedBag, bagsBasketVO1);
		// hash맵 중복 처리
		if (sess.getAttribute("map") == null) {
			req.setAttribute("error", "장바구니에 상품이 없습니다.");
			HttpUtil.forward(req, resp, "/basket/basketOut3.jsp");
			return;
		} else {
			map = (HashMap) sess.getAttribute("map");

			List<BagsVO> list = new ArrayList<BagsVO>();

			Iterator<String> keys = map.keySet().iterator();
			
			while (keys.hasNext()) {
				String key = keys.next();
				BagsVO vo = dao.searchBag(key);
				System.out.println("list에 들어가는 vo" + vo);
				list.add(vo);
			}
			for (int i = 0; i < list.size(); i++) {
				System.out.println("BagsbasketCOntroller2 에서 list에 잘 받아 들어가나 확인중" + list.get(i).getBag_src());
			}
			sess.setAttribute("map", map);
			req.setAttribute("list", list);

		}
		HttpUtil.forward(req, resp, "/basket/basketOut2.jsp");
	}

}
