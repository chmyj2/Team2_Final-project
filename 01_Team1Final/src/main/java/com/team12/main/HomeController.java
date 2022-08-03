package com.team12.main;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		
		
		
		return "home";
	}
	
	
<<<<<<< HEAD

=======
<<<<<<< HEAD
	
=======
>>>>>>> 2485cdb (create board DB)

		
>>>>>>> 7efdbd5827e375331b74f31dfe9f49f909b7165e
}
