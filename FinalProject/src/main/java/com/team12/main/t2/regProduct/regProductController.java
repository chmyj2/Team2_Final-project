package com.team12.main.t2.regProduct;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class regProductController {

	@Autowired
	private ProductDAO pDAO;
	
	
	
	
	@RequestMapping(value = "/regProductPage", method = RequestMethod.GET)
	public String regProductPage(HttpServletRequest request) {
		
		// 상품가져오는일
		//pDAO.getAllProduct(request);
		
		request.setAttribute("contentPage", "YJ/regProductPage.jsp");
		
		return "2Team/t2_index";
	}
	
	
	
	
	
	
	
	

	
	
	@RequestMapping(value = "/Product.upload", method = RequestMethod.POST)
	public String regProduct(@RequestParam("productThumbnail")MultipartFile file, @RequestParam("productImg") List<MultipartFile> multiFileList,Model model ,HttpServletRequest request) {		
		pDAO.regProduct(model,request,multiFileList,file);
				
		request.setAttribute("contentPage", "YJ/regProductPage.jsp");
		return "2Team/t2_index";
	}
	

	
	
	
}
