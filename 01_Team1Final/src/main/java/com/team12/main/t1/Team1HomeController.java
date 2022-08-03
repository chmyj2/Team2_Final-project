package com.team12.main.t1;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class Team1HomeController {
	
	@RequestMapping(value = "/team1.go", method = RequestMethod.GET)
	public String teamGo(HttpServletRequest req) {
		
		
		req.setAttribute("contentPage", "1Team/t1_home.jsp");
		return "index";
	}
	

	
}

