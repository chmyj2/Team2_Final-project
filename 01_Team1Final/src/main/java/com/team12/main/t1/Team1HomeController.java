package com.team12.main.t1;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class Team1HomeController {
<<<<<<< HEAD
	
=======

>>>>>>> 901c78a0ab8fc756badde1dc00be7a5b3c93afc7
	@RequestMapping(value = "/team1Main", method = RequestMethod.GET)
	public String mainCall(HttpServletRequest req) {

		req.setAttribute("contentPage", "t1_home.jsp");
		return "1Team/t1_index";
	}


}