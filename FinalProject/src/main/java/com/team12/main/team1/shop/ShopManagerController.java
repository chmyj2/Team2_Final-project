package com.team12.main.team1.shop;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team12.main.t2.shop.ProductDAO;
import com.team12.main.team1.join.MemberDAO;
import com.team12.main.team1.shop.review.Team1ReviewDAO;
import com.team12.main.team1.shop.review.Team1ReviewDTO;
import com.team12.main.team1.store.Team1ProductDAO;
import com.team12.main.team1.store.Team1ProductDTO;

@Controller
public class ShopManagerController {
	
	@Autowired
	private ProductManagerDAO pDAO;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private Team1ReviewDAO rDAO; 
	
	@Autowired
	private Team1ProductDAO pdDAO;
	
	
	// 메인 샵 들어가기
	@RequestMapping(value="/enter.team1MainShop", method = RequestMethod.GET)
	public String shopMainEntering(HttpServletRequest req) {
			
		mDAO.loginCheck(req);
		
		req.setAttribute("contentPage", "ShopPageYUJIN/team1ShopStore.jsp");
		return "1Team/t1_index";
	}
	
	
	// 스토어 메인
	@RequestMapping(value="/enter.team1StoreFor", method = RequestMethod.GET)
	public String shopEntering(Team1ProductDTO product, HttpServletRequest req) {
			
		mDAO.loginCheck(req);
		// 모든 상품 불러오기
		pdDAO.showAllProduct(req,product);
	
		req.setAttribute("contentPage", "ShopPageYUJIN/team1ShopForDog.jsp");
		return "1Team/t1_index";
	}
	
	// 상품 디테일 페이지로 이동
	@RequestMapping(value="/get.aProductTeam1",method = RequestMethod.GET )
	public String detailAProduct(Team1ReviewDTO review, ProductDTO p, HttpServletRequest req){
		
		//로그인체크
		mDAO.loginCheck(req);
		//리뷰 리스트 가져오기
		
		rDAO.showReviewList(req, review);
		//전체 리뷰 평균 가져오기
		rDAO.showAllReviewAvg(req);
		//상품 하나 가져오기
		//pDAO.loadAProduct(p,req);
		
		
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
