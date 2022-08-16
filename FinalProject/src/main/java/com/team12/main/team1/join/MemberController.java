package com.team12.main.team1.join;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value = "/member.login", method = RequestMethod.POST)
	public String memberLogin(Member m, HttpServletRequest req) {
		
		// 로그인
		mDAO.login(m, req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "t1_home.jsp");
		
		return "1Team/t1_index";
	}

	
	
	
	
	@RequestMapping(value="/member.kakao", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		System.out.println("#########" + code);
		return "1Team/t1_index";
		/*
		 * 리턴값의 testPage는 아무 페이지로 대체해도 괜찮습니다.
		 * 없는 페이지를 넣어도 무방합니다.
		 * 404가 떠도 제일 중요한건 #########인증코드 가 잘 출력이 되는지가 중요하므로 너무 신경 안쓰셔도 됩니다.
		 */
    	}
//	@RequestMapping(value = "member.info.go", method = RequestMethod.GET)
//	public String memberInfoGO(HttpServletRequest req) {
//		if(mDAO.loginCheck(req)) {
//			
//			// 세션이 없을 때 null인데 그걸 잘라달라하면 500에러
//			mDAO.splitAddr(req);
//			req.setAttribute("login", "../LDH/login.jsp");
//			
//		} else {
//			req.setAttribute("login", "../LDH/notLogin.jsp");
//		}
//		return "1Team/t1_index";
//	}
	
	@RequestMapping(value = "member.info", method = RequestMethod.GET)
	public String memberInfo(HttpServletRequest req) {
		if(mDAO.loginCheck(req)) {
		
		// 세션이 없을 때 null인데 그걸 잘라달라하면 500에러
		mDAO.splitAddr(req);
		req.setAttribute("contentPage", "../LDH/info.jsp");
		
		} else {
			req.setAttribute("contentPage", "../LDH/loginAndJoin.jsp");
		}
		return "1Team/t1_index";
	}
	
	
	
	@RequestMapping(value = "member.logout", method = RequestMethod.GET)
	public String logout(Member m, HttpServletRequest req) {
		
		mDAO.logout(req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "t1_home.jsp");
		return "1Team/t1_index";
	}
	
	@RequestMapping(value = "member.update", method = RequestMethod.POST)
	public String memberUpdate(Member m, HttpServletRequest req) {
		if (mDAO.loginCheck(req)) {
			mDAO.update(m, req);
			mDAO.splitAddr(req);
			req.setAttribute("contentPage", "../LDH/info.jsp");
		} else {
			req.setAttribute("contentPage", "t1_home.jsp");
		}
		return "1Team/t1_index";
	}
	
	@RequestMapping(value = "member.bye", method = RequestMethod.GET)
	public String memberBye(HttpServletRequest req) {
		if (mDAO.loginCheck(req)) {
			mDAO.bye(req);
		}
		req.setAttribute("contentPage", "t1_home.jsp");
		return "1Team/t1_index";
	}
	
	@RequestMapping(value = "member.get", 
			method = RequestMethod.GET, 
			produces = "application/json; charset=utf-8")
	public @ResponseBody int memberGet(Member m, HttpServletRequest req) {
		return mDAO.getMemberNum(m, req);
	}
	
	
	
	
	
}
