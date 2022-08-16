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
	ProductManagerDAO mDAO;
	
//  YK : 오른쪽 상단 위에 로그인이랑, 장바구니 아이콘 뜨게 하려면,
//	private MemberDAO mDAO; 이 친구 Autowired해야해요

	
	//	처음에 숍을 클릭했을 때
	@RequestMapping(value="/enter.team1Shop", method = RequestMethod.GET)
	public String shopEntering(ProductDTO p, HttpServletRequest req) {
			
//		mDAO.loginCheck(req);
			//모든 상품 불러오기
			mDAO.loadProducts(p, req);
			//페이징하기
			//로그인체크
		req.setAttribute("contentPage", "ShopPageYUJIN/team1shopMain.jsp");
		return "1Team/t1_index";
	}
	
	
	// 상품 디테일 페이지로 이동
	@RequestMapping(value="/get.aProductTeam1",method = RequestMethod.GET )
	public String detailAProduct(ProductDTO p, HttpServletRequest req){
		//상품 하나 가져오기
		mDAO.loadAProduct(p,req);
		
		//로그인체크
		req.setAttribute("contentPage", "ShopPageYUJIN/team1shopProductDetail.jsp");
		return "1Team/t1_index";
	}
	
	
	// 상품 카테고리별 출력
	@RequestMapping(value = "/loadByCategory.go", method = RequestMethod.GET)
	public String loadProductsByCategory(ProductDTO p, HttpServletRequest req) {
		
		mDAO.loadProductsByCategory(p, req);
		req.setAttribute("contentPage", "ShopPageYUJIN/team1shopMain.jsp");
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
	@RequestMapping(value = "/searchProducts.byWord", method = RequestMethod.GET)
	public String searchProductsByWord(ProductDTO p, HttpServletRequest req) {
		mDAO.searchProductsByWord(p, req);
		return "team1_shop_input";
	}
//	------------------------------------------------------------
	
	
	
	
	
}
