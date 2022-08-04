package com.team12.main.team1.join;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	
	
	
	@Autowired
	private	MemberDAO mDAO;
	
	
	
	@RequestMapping(value = "/loginandjoin.go", method = RequestMethod.GET)
	public String indexGO(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "../LDH/loginAndJoin.jsp");
		
		return "1Team/t1_index";
	}
	
	
	
	@RequestMapping(value = "/member.join.go", method = RequestMethod.GET)
	public String memberJoinGo(Member m, HttpServletRequest req) {
		
//		mDAO.join(m, req);
//		mDAO.loginCheck(req);
		
		req.setAttribute("contentPage", "../LDH/join.jsp");
		return "1Team/t1_index";
	}
	
	@RequestMapping(value = "/member.join", method = RequestMethod.POST)
	public String memberJoin(Member m, HttpServletRequest req) {
		
		mDAO.join(m, req);
		mDAO.loginCheck(req);
		
		req.setAttribute("contentPage", "../LDH/loginAndJoin.jsp");
		return "1Team/t1_index";
	}
	
//	@RequestMapping(value = "/member.login", method = RequestMethod.POST)
//	public String memberLogin(Member m, HttpServletRequest req) {
//		
//		// 로그인
//		mDAO.login(m, req);
//		mDAO.loginCheck(req);
//		req.setAttribute("contentPage", "home.jsp");
//		
//		return "index";
//	}

	
	@RequestMapping(value = "member.info", method = RequestMethod.GET)
	public String memberInfo(HttpServletRequest req) {
		if(mDAO.loginCheck(req)) {
		
		// 세션이 없을 때 null인데 그걸 잘라달라하면 500에러
		mDAO.splitAddr(req);
		req.setAttribute("contentPage", "LDH/info.jsp");
		
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	
	
	@RequestMapping(value = "member.logout", method = RequestMethod.GET)
	public String logout(Member m, HttpServletRequest req) {
		
		mDAO.logout(req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	@RequestMapping(value = "member.update", method = RequestMethod.POST)
	public String memberUpdate(Member m, HttpServletRequest req) {
		if (mDAO.loginCheck(req)) {
			mDAO.update(m, req);
			mDAO.splitAddr(req);
			req.setAttribute("contentPage", "LDH/info.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	@RequestMapping(value = "member.bye", method = RequestMethod.GET)
	public String memberBye(HttpServletRequest req) {
		if (mDAO.loginCheck(req)) {
			mDAO.bye(req);
		}
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	@RequestMapping(value = "member.get", 
			method = RequestMethod.GET, 
			produces = "application/json; charset=utf-8")
	public @ResponseBody int memberGet(Member m, HttpServletRequest req) {
		return mDAO.getMemberNum(m, req);
	}
	
	
	
	
	
}
