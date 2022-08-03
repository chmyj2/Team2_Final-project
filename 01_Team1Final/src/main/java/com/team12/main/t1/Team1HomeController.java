package com.team12.main.t1;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class Team1HomeController {
	
<<<<<<< HEAD
	@RequestMapping(value = "/team1Main", method = {RequestMethod.GET, RequestMethod.POST})
=======
	@RequestMapping(value = "/team1Main", method = RequestMethod.GET)
>>>>>>> cdae99558cacacd9933946fce6b5454938511cc5
	public String home(HttpServletRequest req) {
		
		
		req.setAttribute("contentPage", "t1_home.jsp");
		
		return "1Team/t1_index";
	}
	
<<<<<<< HEAD
=======
	@RequestMapping(value = "/index.go", method = RequestMethod.GET)
	public String indexGo(HttpServletRequest req) {
		return home(req);
	}
>>>>>>> cdae99558cacacd9933946fce6b5454938511cc5
	
}

