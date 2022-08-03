package com.team12.main.t1;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class Team1HomeController {
<<<<<<< HEAD
	
<<<<<<< HEAD
	@RequestMapping(value = "/team1.go", method = RequestMethod.GET)
	public String teamGo(HttpServletRequest req) {
		
		
		req.setAttribute("contentPage", "1Team/t1_home.jsp");
		return "index";
	}
	
	
	
}
=======

	
=======
>>>>>>> b3218038037c176040fe484bf174288d15d3cb7e

	@RequestMapping(value = "/team1Main", method = RequestMethod.GET)
	public String mainCall(HttpServletRequest req) {

		req.setAttribute("contentPage", "t1_home.jsp");
		return "1Team/t1_index";
	}
>>>>>>> 8506a076e3f259e2fe52bc33ede1b9de04980cbe


}