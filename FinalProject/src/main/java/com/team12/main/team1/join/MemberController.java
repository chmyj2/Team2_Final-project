package com.team12.main.team1.join;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	
	 @Autowired
	 private MemberDAO kakaoService;
	
	
	
	
	
	
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
		System.out.println(m.getMember_ID());
		// 로그인
		mDAO.login(m, req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "t1_home.jsp");
		
		return "1Team/t1_index";
	}

	
	   @RequestMapping("member.kakao")
	    public String home(@RequestParam(value = "code", required = false) String code, Member m, HttpServletRequest req, HttpSession session) throws Exception{
		   System.out.println("#########" + code);
//	        String access_Token = kakaoService.getAccessToken(code);
//	        HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
//	        System.out.println("###access_Token#### : " + access_Token);
//	        System.out.println("###userInfo#### : " + userInfo.get("email"));
//	        System.out.println("###nickname#### : " + userInfo.get("nickname"));
//	        System.out.println("###profile_image#### : " + userInfo.get("profile_image"));
	        
//	        req.setAttribute("loginPage", "../LDH/loginSuccess.jsp");
//	        req.setAttribute("contentPage", "t1_home.jsp");
	        mDAO.joinKakao(req, code);
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
