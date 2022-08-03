package com.team12.main.t2;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Team2LoginController {

	@RequestMapping(value = "/t2.login", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "t2_login/t2_login.jsp");
		
		return "2Team/t2_index";
	}
}
