package com.team12.main.t2.regProduct;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class regProductController {

	@RequestMapping(value = "/regProductPage", method = RequestMethod.GET)
	public String regProductPage(HttpServletRequest request) {
		
		request.setAttribute("contentPage", "2Team/YJ/regProductPage.jsp");
		
		// 상품가져오는일
		return "2Team/t2_index";
	}
	
}
