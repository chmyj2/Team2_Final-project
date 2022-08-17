package com.team12.main.team1.join;

import java.io.IOException;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team12.main.t2Login.Membert2;
import com.team12.main.team1.join.*;
@Controller
public class MemberController {
	
	
	
	
	@Autowired
	private	MemberDAO mDAO;
	
	
	@Autowired
	private HttpSession session;
	
	
	
	
	
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
		String access_Token = mDAO.getAccessToken(code);
		
		// userInfo의 타입을 Member로 변경 및 import.
		Member userInfo = mDAO.getUserInfo(access_Token);
		
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.getMember_name());
		System.out.println("###email#### : " + userInfo.getMember_email());
		
		// 아래 코드가 추가되는 내용
		session.invalidate();
		// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
		session.setAttribute("kakaoN", userInfo.getMember_name());
		session.setAttribute("kakaoE", userInfo.getMember_email());
		// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
		// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.
		
		return "1Team/t1_index";
    	
	}
	

	
	
	

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
	
	// ------------------ 마이페이지 펫 인포 YK ----------------------------
	@RequestMapping(value = "pet.info", method = RequestMethod.GET)
	public String petInfo(HttpServletRequest req) {
		if(mDAO.loginCheck(req)) {
			
		// 세션이 없을 때 null인데 그걸 잘라달라하면 500에러
		mDAO.splitAddr(req);
		req.setAttribute("contentPage", "../LDH/petInfo.jsp");
		
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
