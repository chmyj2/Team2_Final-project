package com.team12.main.t2.viewProductPage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class viewProductController {
	

	@RequestMapping(value = "/viewProductPage", method = RequestMethod.GET)
	public String viewProductPage(HttpServletRequest request) {
//		상품가져오는일
		request.setAttribute("contentPage", "YJ/viewProductPage.jsp");
		
		return "2Team/t2_index";
	}
	
	
}
