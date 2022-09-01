package com.team12.main.team1.store;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team12.main.team1.join.MemberDAO;

@Controller
public class Team1ProductController {

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private Team1ProductDAO mpDAO;
	
	// 마스터 상품등록 페이지 이동
	@RequestMapping(value = "/master.reg", method = RequestMethod.GET)
	public String masterReg(HttpServletRequest req) {
		
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "master/masterProductUpdate.jsp");
		
		return "1Team/t1_index";
	}
	
	
	// 상품등록하기
	@RequestMapping(value = "/master.create", method = RequestMethod.POST)
	public String masterCreate(HttpServletRequest req, MultipartHttpServletRequest mr) {
		
		mDAO.loginCheck(req);
		mpDAO.productReg(req, mr);
		req.setAttribute("contentPage", "master/masterProductUpdate.jsp");
		
		return "1Team/t1_index";
	}
}
