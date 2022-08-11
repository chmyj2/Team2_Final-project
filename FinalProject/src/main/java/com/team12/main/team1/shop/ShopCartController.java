package com.team12.main.team1.shop;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShopCartController {
	
	@Autowired
	CartTeam1DAO cDAO;
	
	//장바구니 넣기 버튼을 눌렀을 때
	@RequestMapping(value="/team1.addCart", method = RequestMethod.POST)
	public String shopEntering(CartDTO c, HttpServletRequest req) {
		
		// 상품을카트에추가하기
		cDAO.addCart(c,req);
		req.setAttribute("contentPage", "ShopPageYUJIN/team1shopMain.jsp");
		return "1Team/t1_index";
	}
	
	
	
	
	

}
