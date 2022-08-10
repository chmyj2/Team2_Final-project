package com.team12.main.team1.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team12.main.team1.join.MemberDAO;


@Controller
public class CommunutyController {
	
	@Autowired
	private	MemberDAO mDAO;

	@RequestMapping(value = "/team1.community", method = RequestMethod.GET)
	public String communityGo(HttpServletRequest req) {
		
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "master/community.jsp");

		return "1Team/t1_index";
	}
}
