package com.team12.main.team1.join;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MemberController {
	
	private MemberjoinDAO mlDAO;
	
	@RequestMapping(value = "/member.join", method = RequestMethod.POST)
	public String memberJoin(Member m, HttpServletRequest req) {
		
		mlDAO.join(m, req);
//		mlDAO.loginCheck(req);
		req.setAttribute("contentPage", "LDH/DH_login.jsp");
		
		return "index";
	}
	


	

	
}
