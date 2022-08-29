package com.team12.main.team1.store;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team12.main.team1.join.MemberDAO;

@Controller
public class Team1ProductController {

	@Autowired
	MemberDAO mDAO;
	
	@Autowired
	private Team1ProductDAO pDAO;
	
	// 마스터 상품등록 페이지 상품 등록
	@RequestMapping(value = "master.reg", method = RequestMethod.POST)
	public String masterReg(HttpServletRequest req, Team1ProductDTO product) {
		
		mDAO.loginCheck(req);
//		pDAO.productReg(req, product);
		req.setAttribute("contentPage", "master/masterProductUpdate.jsp");
		
		return "1Team/t1_index";
	}
}
