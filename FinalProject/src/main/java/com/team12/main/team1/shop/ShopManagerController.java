package com.team12.main.team1.shop;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShopManagerController {
	@Autowired
	ProductManagerDAO mDAO;

	//	처음에 숍을 클릭했을 때
	@RequestMapping(value="/enter.team1Shop", method = RequestMethod.GET)
	public String shopEntering(HttpServletRequest req) {
		
			//모든 상품 불러오기
			//페이징하기
		
			//로그인체크
		req.setAttribute("contentPage", "ShopPageYUJIN/team1ShopCart.jsp");
		return "1Team/t1_index";
	}
	
	
	
	
	
	
	
	
	
	
	
//	------------------------------------------------------------
	// button 등록합시다를 눌렀을 때.
	@RequestMapping(value = "/shopManager.upload", method = RequestMethod.POST)
	public String maincall(ProductDTO p, HttpServletRequest req) {
		mDAO.regProduct(p,req);
		return "team1_shop_input";
	}
//	------------------------------------------------------------
	// button Load All Products를 눌렀을 때.
	@RequestMapping(value = "/shopManager.loadAll", method = RequestMethod.GET)
	public String loadProducts(ProductDTO p, HttpServletRequest req) {
		mDAO.loadProducts(p, req);
		return "team1_shop_input";
	}
//	------------------------------------------------------------
	@RequestMapping(value = "/loadByCategory.go", method = RequestMethod.GET)
	public String loadProductsByCategory(ProductDTO p, HttpServletRequest req) {
		mDAO.loadProductsByCategory(p, req);
		return "team1_shop_input";
	}
//	------------------------------------------------------------
	@RequestMapping(value = "/searchProducts.byWord", method = RequestMethod.GET)
	public String searchProductsByWord(ProductDTO p, HttpServletRequest req) {
		mDAO.searchProductsByWord(p, req);
		return "team1_shop_input";
	}
//	------------------------------------------------------------
	
	
	
	
	
}
