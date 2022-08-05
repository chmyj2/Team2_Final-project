package com.team12.main.t2;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team12.main.t2Login.LoginDAO;


@Controller
public class Team2HomeController {
	
	@Autowired
	private LoginDAO lDAO;
	
	@RequestMapping(value = "/team2Main", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "t2_home.jsp");
		
		return "2Team/t2_index";
	}
	
}
