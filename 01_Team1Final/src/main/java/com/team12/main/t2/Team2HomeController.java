package com.team12.main.t2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class Team2HomeController {
	
	@RequestMapping(value = "/team2Main", method = RequestMethod.GET)
	public String home() {
		
		
		return "2Team/t2_index";
	}
	
}
