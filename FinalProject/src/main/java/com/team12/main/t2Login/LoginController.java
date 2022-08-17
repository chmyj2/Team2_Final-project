package com.team12.main.t2Login;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team12.main.t2.Team2HomeController;


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
		//로그인
		lDAO.login(req,m);
		
		//로그인 체크
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "t2login/joinOK.jsp");
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/joingo.business", method = RequestMethod.GET)
	public String joingoBusiness(HttpServletRequest req) {
		
		//회원가입창으로 이동 비즈니스용
		
		//로그인 체크
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "t2login/t2_joinBusiness.jsp");
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/businessNum.check", method = RequestMethod.GET)
	@ResponseBody
	public int businessNumcheck(vet v) {
		
		//비즈니스 사업자 번호 중복체크
		
		return lDAO.checkBusinessNum(v);
	}
	
	@RequestMapping(value = "/joinDo.business", method = RequestMethod.POST)
	public String joinDobusiness(HttpServletRequest req, vet v) {
		
		//비즈니스 회원가입
		lDAO.joinBusiness(req,v);
		
		//로그인 체크
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "t2login/t2_login.jsp");
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/naver.login", method = RequestMethod.GET)
	public String naverlogin(HttpServletRequest req, Membert2 m) {
		//네이버로그인
		
		return "2Team/t2login/naverLogin";
	}
	
	@RequestMapping(value = "/naverlogin.check", method = RequestMethod.GET)
	@ResponseBody
	public int naverlogincheck(HttpServletRequest req, Membert2 m) {
		//네이버 아이디 확인
		return lDAO.naverLogin(m);
	}
	
	@RequestMapping(value = "/naverlogin.do", method = RequestMethod.GET)
	public String naverloginDo(HttpServletRequest req, Membert2 m) {
			//네이버 로그인하기
			if (req.getParameter("member_ID") != null) {
				lDAO.loginNaver(req, m);
				lDAO.loginCheck(req);
			}
			req.setAttribute("contentPage", "t2_home.jsp");	
			
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/naverjoin.go", method = RequestMethod.GET)
	public String naverjoingo(HttpServletRequest req, Membert2 m) {
		//네이버 회원가입하러가기
		
		lDAO.naverJoin(req,m);
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "t2login/t2_login.jsp");
		
		
		return "2Team/t2_index";
	}
	
	
	@RequestMapping(value = "/petRegistration", method = RequestMethod.GET)
	public String petRegistration(HttpServletRequest req) {
		//펫등록페이지로 이동하기
		
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "t2login/petRegistration.jsp");
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/petInformationReg.do", method = RequestMethod.POST)
	public String petInformationRegdo(HttpServletRequest req, @RequestParam("baby_img") MultipartFile baby_img,
	         @RequestParam("baby_name") String baby_name,
	         @RequestParam("baby_weight") Double baby_weight,
	         @RequestParam("baby_birth") Date baby_birth,
	         @RequestParam("baby_sex") String baby_sex,
	         @RequestParam("baby_type") String baby_type,
	         @RequestParam("baby_typeDetail") String baby_typeDetail,
	         @RequestParam("baby_neut") String baby_neut,
	         @RequestParam("baby_memberID") String baby_memberID){
		//펫등록하기
		System.out.println("-----------------------");
		lDAO.petReg(req,baby_img,baby_name,baby_weight,baby_birth,baby_sex,baby_type,baby_typeDetail,baby_neut,baby_memberID);
		
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "t2_home.jsp");
		
		
		return "2Team/t2_index";
	}
	
	
	
	
	
	
	
}
