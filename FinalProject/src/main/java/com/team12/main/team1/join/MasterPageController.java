package com.team12.main.team1.join;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MasterPageController {
	
	@Autowired
	private	MemberDAO mDAO;
	
	@RequestMapping(value = "/about.go", method = RequestMethod.GET)
	public String aboutGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "master/about.jsp");
		
		return "1Team/t1_index";
	}
	
	@RequestMapping(value = "/contact.go", method = RequestMethod.GET)
	public String contactGo(HttpServletRequest req) {
		
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "master/contact.jsp");
		
		return "1Team/t1_index";
	}
}
