package com.team12.main.t2.hospital;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HospitalController {

	
	@RequestMapping(value = "/hospitalGo", method = RequestMethod.GET)
	public String hospitalGo(HttpServletRequest req) {
		
		
		
		req.setAttribute("contentPage", "sy/hospitalMain.jsp");
		
		return "2Team/t2_index";
	}
	
}
