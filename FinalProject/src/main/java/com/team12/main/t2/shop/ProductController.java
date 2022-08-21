package com.team12.main.t2.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team12.main.t2Login.LoginDAO;
import com.team12.main.t2Login.Membert2;
import com.team12.main.t2Login.vet;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO pDAO;
	
	@Autowired
	private LoginDAO lDAO;
	
	@Autowired
	private CartDAO cDAO;
	
	
	
//	이동 -------------------------------------------------------------------------
	
	
	// 상품페이지
	@RequestMapping(value = "/viewProductPage.go", method = RequestMethod.GET)
	public String viewProductPage(HttpServletRequest request,Product p,
			@RequestParam("toy") String toy) {
		// 진열된 상품가져오는일
		
		pDAO.getSnack(request,p);
		pDAO.getToy(request,p,toy);
		pDAO.getPetCategoryProduct(request,p);
		lDAO.loginCheck(request);
		request.setAttribute("contentPage", "YJ/viewProductPage.jsp");
		
		
		return "2Team/t2_index";
	}
	
	
	
	
	// 등록페이지
	@RequestMapping(value = "/regProductPage.go", method = RequestMethod.GET)
	public String regProductPage(HttpServletRequest request,Product p) {
		
		// 상품 전부 가져오는일
		pDAO.realGetAllProduct(request);
		lDAO.loginCheck(request);
		request.setAttribute("contentPage", "YJ/regProductPage.jsp");
		
		return "2Team/t2_index";
	}
	
	
	
	// 디테일페이지
	@RequestMapping(value = "/detailPage.go", method = RequestMethod.GET)
	public String detailPage(HttpServletRequest request,Product p) {
		//상품가져오는일
		pDAO.getProduct(request,p);
		lDAO.loginCheck(request);
		request.setAttribute("contentPage", "YJ/detailProductPage.jsp");
			
		return "2Team/t2_index";
	}
		
		
		
	// 수정페이지
	@RequestMapping(value = "/update.product.go", method = RequestMethod.GET)
	public String updatePage(HttpServletRequest request,Product p) {
		//상품가져오는일
		pDAO.getProduct(request,p);
		lDAO.loginCheck(request);
		request.setAttribute("contentPage", "YJ/updateProductPage.jsp");
			
		return "2Team/t2_index";
	}
	
	
	
	// 구매페이지
	@RequestMapping(value = "/purchasePage.go", method = RequestMethod.GET)
	public String purchasePageGo(HttpServletRequest request,Product p,
			@RequestParam("quanId") int quanId) {
		//상품가져오는일
		pDAO.getProduct(request,p);
		
		if (lDAO.loginCheck(request)) {
			request.setAttribute("quanId", quanId);
			request.setAttribute("contentPage", "YJ/purchasePage.jsp");
		}else {
			request.setAttribute("contentPage", "YJ/purchasePageCheckMember.jsp");
			
		}
		
		
		return "2Team/t2_index";
	}
	
	
	
	
	// 로그인 후 페이지(개인)
	@RequestMapping(value = "/t2LoginDO.purchase", method = RequestMethod.POST)
	public String LoginPurchase(HttpServletRequest request,Product p,Membert2 m) {
		//상품가져오는일
		pDAO.getProduct(request,p);
		//일반 로그인하기
			if(lDAO.login(request,m)) {
				
				cDAO.goPurchasePage(request);
				request.setAttribute("contentPage", "YJ/purchasedPage.jsp");
			}else {
				request.setAttribute("r", "로그인 실패");
				request.setAttribute("contentPage", "YJ/purchasePageCheckMember.jsp");
					
			}
				
			//로그인 체크
			lDAO.loginCheck(request);
				
			return "2Team/t2_index";
		}
	
	
	
	// 로그인 후 페이지(기업)
	@RequestMapping(value = "/t2LoginDO.business.purchase", method = RequestMethod.POST)
	public String LoginBusinessPurchase(HttpServletRequest request,Product p,vet v) {
		//상품가져오는일
		pDAO.getProduct(request,p);
		
		//비지니스 로그인하기
			if(lDAO.login_business(request,v)) {
				cDAO.goPurchasePage(request);
				request.setAttribute("contentPage", "YJ/purchasedPage.jsp");
			}else {
				request.setAttribute("rb", "로그인 실패");
				request.setAttribute("contentPage", "YJ/purchasePageCheckMember.jsp");
					
			}
				
			//로그인 체크
			lDAO.loginCheck(request);
				
			return "2Team/t2_index";
	}
	
	
	
	// 구매페이지(비회원)
		@RequestMapping(value = "/purchasePage.NonMembers", method = RequestMethod.GET)
		public String purchasePageNonMembers(HttpServletRequest request,Product p) {
			//상품가져오는일
			
			pDAO.getProduct(request,p);
			
			request.setAttribute("contentPage", "YJ/purchasePageNon-members.jsp");
			
			
			return "2Team/t2_index";
		}
	
	
	
	
	
	
	
	
	

	
	// 상품 등록
	@RequestMapping(value = "/Product.upload", method = RequestMethod.POST)
	public String regProduct(@RequestParam("productThumbnail") MultipartFile file, @RequestParam("productImg") List<MultipartFile> multiFileList,HttpServletRequest request,
			@RequestParam("pet_category") String pet_category,
			@RequestParam("toy_category") String toy_category,
			@RequestParam("productName") String productName,
			@RequestParam("productPrice") int productPrice,
			@RequestParam("productInfo") String productInfo,
			@RequestParam("productStock") int productStock,
			@RequestParam("onExhibition") String onExhibition,
			@RequestParam("productTag") String [] productTag){
		
		
		pDAO.regProduct(pet_category,toy_category,productName,productPrice,productInfo,productStock,onExhibition,file,multiFileList,request,productTag);
		pDAO.realGetAllProduct(request);
		lDAO.loginCheck(request);
			
		request.setAttribute("contentPage", "YJ/regProductPage.jsp");
		return "2Team/t2_index";
	}
	
	
	
	
	// 상품 수정
	@RequestMapping(value = "/product.update", method = RequestMethod.POST)
	public String ProductUpdate(@RequestParam("productThumbnailNew")MultipartFile file, @RequestParam("productImgNew") List<MultipartFile> multiFileList,HttpServletRequest request,Product p,
			@RequestParam("pet_category") String pet_category,
			@RequestParam("toy_category") String toy_category,
			@RequestParam("productName") String productName,
			@RequestParam("productPrice") int productPrice,
			@RequestParam("productInfo") String productInfo,
			@RequestParam("productStock") int productStock,
			@RequestParam("onExhibition") String onExhibition,
			@RequestParam("productTag") String [] productTag,
			@RequestParam("productNum") int productNum){
	
		
		pDAO.updateProduct(request,multiFileList,file,pet_category,toy_category,productName,productPrice,productInfo,productStock,onExhibition,productTag,productNum,p);
		pDAO.realGetAllProduct(request);
		lDAO.loginCheck(request);
		request.setAttribute("contentPage", "YJ/regProductPage.jsp");
		return "2Team/t2_index";
	}
	
	
	// 상품 삭제
	@RequestMapping(value = "/product.delete", method = RequestMethod.GET)
	public String deleteProduct(HttpServletRequest request,
			@RequestParam("thumbnail") String thumbnail,
			@RequestParam("img") String img,
			@RequestParam("num") int num){
		
		//상품가져오는일
		pDAO.deleteProduct(request,thumbnail,img,num);
		pDAO.realGetAllProduct(request);
		lDAO.loginCheck(request);
		request.setAttribute("contentPage", "YJ/regProductPage.jsp");
		
		return "2Team/t2_index";
	}
	
	
	
	
	
	
}
