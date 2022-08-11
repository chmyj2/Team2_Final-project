package com.team12.main.t2Login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	
	@Autowired
	private LoginDAO lDAO;
	
	@RequestMapping(value = "/t2LoginGO", method = RequestMethod.GET)
	public String loginGo(HttpServletRequest req) {
		
		//로그인페이지로 이동하기
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "t2login/t2_login.jsp");
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/t2LoginDO", method = RequestMethod.POST)
	public String loginDo(HttpServletRequest req, Membert2 m) {
		
		//일반 로그인하기
		if(lDAO.login(req,m)) {
			
			req.setAttribute("contentPage", "t2_home.jsp");
		}else {
			req.setAttribute("r", "로그인 실패");
			req.setAttribute("contentPage", "t2login/t2_login.jsp");
			
		}
		
		//로그인 체크
		lDAO.loginCheck(req);
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/t2LoginDO.business", method = RequestMethod.POST)
	public String loginDo_business(HttpServletRequest req, vet v) {
		
		//비지니스 로그인하기
		if(lDAO.login_business(req,v)) {
			
			req.setAttribute("contentPage", "t2_home.jsp");
		}else {
			req.setAttribute("rb", "로그인 실패");
			req.setAttribute("contentPage", "t2login/login_business.jsp");
			
		}
		
		//로그인 체크
		lDAO.loginCheck(req);
		
		return "2Team/t2_index";
	}
	
	
	
	@RequestMapping(value = "/t2logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req, Membert2 m) {
		
		//로그아웃하기
		lDAO.logout(req);
		
		//로그인 체크
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "t2_home.jsp");
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/acceptgo", method = RequestMethod.GET)
	public String accept(HttpServletRequest req) {
		
		//이용약관
		
		//로그인 체크
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "t2login/accept.jsp");
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/joingo", method = RequestMethod.GET)
	public String join(HttpServletRequest req) {
		
		//이용약관
		
		//로그인 체크
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "t2login/t2_join.jsp");
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/emailcheck", method = RequestMethod.GET)
	@ResponseBody
	public String emailcheck(HttpServletRequest req , String member_email ) {
		
		//이메일 체크하기
		System.out.println("이메일 요청");
		System.out.println("email:" + member_email);
		
		return lDAO.emailCheck(member_email);
	}
	
	@RequestMapping(value = "/id.check", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(Membert2 m) {
		
		//아이디 중복체크
		
		return lDAO.checkId(m);
	}
	
	@RequestMapping(value = "/email.check", method = RequestMethod.GET)
	@ResponseBody
	public int emailcheck(Membert2 m) {
		
		//이메일 중복체크
		
		return lDAO.checkEmail(m);
	}
	
	@RequestMapping(value = "/joinDo", method = RequestMethod.POST)
	public String joinDo(HttpServletRequest req, Membert2 m) {
		
		//회원가입
		lDAO.join(req,m);
		
		//로그인 체크
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "t2login/joinOK.jsp");
		
		return "2Team/t2_index";
	}
	
	
	
	
	
	
	
}
