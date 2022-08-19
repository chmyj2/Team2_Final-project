package com.team12.main.team1.shop;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team12.main.team1.join.MemberDAO;
import com.team12.main.team1.shop.review.Team1ReviewDAO;
import com.team12.main.team1.shop.review.Team1ReviewDTO;

@Controller
public class ShopManagerController {
	
	@Autowired
	ProductManagerDAO pDAO; // 8/17 YK 변경해놨습니다
	
	@Autowired
	MemberDAO mDAO;
	
	@Autowired
	private Team1ReviewDAO rDAO;	// YK 리뷰DAO입니다.
	
	
	// YK Store 눌렀을때  페이지입니다 -> dog/cat페이지로 넘어갈 수 있게
	@RequestMapping(value="/enter.team1MainShop", method = RequestMethod.GET)
	public String shopMainEntering(ProductDTO p, HttpServletRequest req) {
			
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "ShopPageYUJIN/team1ShopStore.jsp");
		return "1Team/t1_index";
	}
	
	//	처음에 숍을 클릭했을 때 // -> Dog 눌렀을때 페이지로 변경하려 해요 YK
	@RequestMapping(value="/enter.team1StoreForDog", method = RequestMethod.GET)
	public String shopEntering(ProductDTO p, HttpServletRequest req) {
			
		mDAO.loginCheck(req);
			//모든 상품 불러오기
		pDAO.loadProducts(p, req);
			//페이징하기
			//로그인체크
	
		req.setAttribute("contentPage", "ShopPageYUJIN/team1shopMain.jsp");
		return "1Team/t1_index";
	}
	// Yk Store For Cat Page입니다
	@RequestMapping(value="/enter.team1StoreForCat", method = RequestMethod.GET)
	public String shopEnteringCat(ProductDTO p, HttpServletRequest req) {
			
		mDAO.loginCheck(req);
			//모든 상품 불러오기
			pDAO.loadProducts(p, req);
			//페이징하기
			//로그인체크
		req.setAttribute("contentPage", "ShopPageYUJIN/team1ShopForCat.jsp");
		return "1Team/t1_index";
	}
	
	
	// 상품 디테일 페이지로 이동
	@RequestMapping(value="/get.aProductTeam1",method = RequestMethod.GET )
	public String detailAProduct(Team1ReviewDTO review, ProductDTO p, HttpServletRequest req){
		
		//로그인체크
		mDAO.loginCheck(req);
		//리뷰 리스트 가져오기
		rDAO.showReviewList(req, review);
		//상품 하나 가져오기
		pDAO.loadAProduct(p,req);
		
		
		req.setAttribute("contentPage", "ShopPageYUJIN/team1shopProductDetail.jsp");
		return "1Team/t1_index";
	}
	
	
	// 상품 카테고리별 출력
	@RequestMapping(value = "/loadByCategory.go", method = RequestMethod.GET)
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
