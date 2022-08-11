package com.team12.main.t2.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO pDAO;
	
	
	
//	이동 -------------------------------------------------------------------------
	
	
	// 상품페이지
	@RequestMapping(value = "/viewProductPage.go", method = RequestMethod.GET)
	public String viewProductPage(HttpServletRequest request,Product p) {
		// 진열된 상품가져오는일
		pDAO.getAllProduct(request,p);
		request.setAttribute("contentPage", "YJ/viewProductPage.jsp");
		
		return "2Team/t2_index";
	}
	
	// 등록페이지
	@RequestMapping(value = "/regProductPage.go", method = RequestMethod.GET)
	public String regProductPage(HttpServletRequest request,Product p) {
		
		// 상품 전부 가져오는일
		pDAO.realGetAllProduct(request);
		request.setAttribute("contentPage", "YJ/regProductPage.jsp");
		
		return "2Team/t2_index";
	}
	
	
	
	// 디테일페이지
		@RequestMapping(value = "/detail.go", method = RequestMethod.GET)
		public String detailPage(HttpServletRequest request,Product p) {
			//상품가져오는일
			pDAO.getProduct(request,p);
			request.setAttribute("contentPage", "YJ/detailProductPage.jsp");
			
			return "2Team/t2_index";
		}
		
		
		
		// 수정페이지
		@RequestMapping(value = "/update.product.go", method = RequestMethod.GET)
		public String updatePage(HttpServletRequest request,Product p) {
			//상품가져오는일
			pDAO.getProduct(request,p);
			request.setAttribute("contentPage", "YJ/updateProductPage.jsp");
			
			return "2Team/t2_index";
		}
	
	
	
//	기능 -------------------------------------------------------------------------

	
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
		request.setAttribute("contentPage", "YJ/regProductPage.jsp");
		
		return "2Team/t2_index";
	}
	
	
	
	
	
	
}
