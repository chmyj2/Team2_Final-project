package com.team12.main.team1.shop;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team12.main.team1.join.MemberDAO;

@Controller
public class ShopManagerController {
	
	@Autowired
	private ProductManagerDAO pDAO;
	
	@Autowired
	private MemberDAO mDAO;

	// Store 눌렀을때  페이지입니다 -> dog/cat페이지로 넘어갈 수 있게
	@RequestMapping(value="/enter.team1MainShop", method = RequestMethod.GET)
	public String shopMainEntering(ProductDTO p, HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "ShopPageYUJIN/team1ShopStore.jsp");
		return "1Team/t1_index";
	}
	
	// Store For Dog
	@RequestMapping(value="/enter.team1StoreForDog", method = RequestMethod.GET)
	public String shopEntering(ProductDTO p, HttpServletRequest req) {
			mDAO.loginCheck(req);
			pDAO.loadProducts(p, req);
			req.setAttribute("contentPage", "ShopPageYUJIN/team1ShopForDog.jsp");
		return "1Team/t1_index";
	}
	
	// Store For Cat
	@RequestMapping(value="/enter.team1StoreForCat", method = RequestMethod.GET)
	public String shopEnteringCat(ProductDTO p, HttpServletRequest req) {
			mDAO.loginCheck(req);
			pDAO.loadProducts(p, req);
			req.setAttribute("contentPage", "ShopPageYUJIN/team1ShopForCat.jsp");
		return "1Team/t1_index";
	}
	
	// Product Detail Page
	@RequestMapping(value="/enter.productDetail", method = RequestMethod.GET)
	public String getProductDetail(ProductDTO p, HttpServletRequest req) {
		mDAO.loginCheck(req);
		pDAO.loadAProduct(p, req);		
		req.setAttribute("contentPage", "ShopPageYUJIN/team1shopProductDetail.jsp");
		return "1Team/t1_index";
	}
	
	// Load By Category
	@RequestMapping(value = "/get.team1byCategory", method = RequestMethod.GET)
	public String loadProductsByCategory(ProductDTO p, HttpServletRequest req) {
		
		pDAO.loadProductsByCategory(p, req);
		req.setAttribute("contentPage", "ShopPageYUJIN/team1shopMain.jsp");
		return "1Team/t1_index";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	------------------------------------------------------------
	// button 등록합시다를 눌렀을 때.
	@RequestMapping(value = "/shopManager.upload", method = RequestMethod.POST)
	public String maincall(ProductDTO p, HttpServletRequest req) {
		pDAO.regProduct(p,req);
		return "team1_shop_input";
	}
//	------------------------------------------------------------
	// button Load All Products를 눌렀을 때.
	@RequestMapping(value = "/shopManager.loadAll", method = RequestMethod.GET)
	public String loadProducts(ProductDTO p, HttpServletRequest req) {
		pDAO.loadProducts(p, req);
		return "team1_shop_input";
	}
//	------------------------------------------------------------
	@RequestMapping(value = "/searchProducts.byWord", method = RequestMethod.GET)
	public String searchProductsByWord(ProductDTO p, HttpServletRequest req) {
		pDAO.searchProductsByWord(p, req);
		return "team1_shop_input";
	}
//	------------------------------------------------------------	
}
