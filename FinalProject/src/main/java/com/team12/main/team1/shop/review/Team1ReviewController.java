package com.team12.main.team1.shop.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team12.main.team1.join.MemberDAO;

@Controller
public class Team1ReviewController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private Team1ReviewDAO rDAO;
	
	@RequestMapping(value = "/write.review", method = RequestMethod.GET)
	public String writeReview(HttpServletRequest req) {
		
		mDAO.loginCheck(req);
//		jsp 아직 안만듦.
		req.setAttribute("contentPage", "/review.jsp");
		
		return "1Team/t1_index";
	}

}
