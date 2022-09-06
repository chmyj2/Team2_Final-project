package com.team12.main.team1.adopt;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team12.main.team1.join.MemberDAO;

@Controller
public class AdoptController {
	
	//로그인체크용	
	@Autowired
	private	MemberDAO mDAO;

	//입양 페이지로 이동
	@RequestMapping(value = "/enter.team1Adopt", method = RequestMethod.GET)
	public String mainCall(HttpServletRequest req) {
		
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "t1_Adopt/adopt.jsp");
		return "1Team/t1_index";
	}
	

}
