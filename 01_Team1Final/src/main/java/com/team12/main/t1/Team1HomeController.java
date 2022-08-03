package com.team12.main.t1;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class Team1HomeController {
	
	@RequestMapping(value = "/team1Main", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		
		
		req.setAttribute("contentPage", "1Team/t1_home.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/index.go", method = RequestMethod.GET)
	public String indexGo(HttpServletRequest req) {
		return home(req);
	}
	
}

