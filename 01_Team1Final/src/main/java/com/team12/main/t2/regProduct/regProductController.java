package com.team12.main.t2.regProduct;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class regProductController {

	@Autowired
	private ProductDAO pDAO;
	
	
	@RequestMapping(value = "/regProductPage", method = RequestMethod.GET)
	public String regProductPage(HttpServletRequest request) {
		
		// 상품가져오는일
		
		
		request.setAttribute("contentPage", "YJ/regProductPage.jsp");
		
		return "2Team/t2_index";
	}
	
	
	
	// 상품 등록
	@RequestMapping(value = "/productInforeg", method = RequestMethod.POST)
	public String productInforeg(Product p,HttpServletRequest request) {
		// 등록하는 일
		pDAO.regProduct(p,request);
		// 상품가져오는일
		
		request.setAttribute("contentPage", "YJ/regProductPage.jsp");
		
		return "2Team/t2_index";
	}
	
	
	
	
}
