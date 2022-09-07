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
		lDAO.login_business(req,v);
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "t2_home.jsp");
		
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
		if (lDAO.loginCheck(req)) {
			
			lDAO.petReg(req,baby_img,baby_name,baby_weight,baby_birth,baby_sex,baby_type,baby_typeDetail,baby_neut,baby_memberID);
			
			lDAO.petinfoGet(req);
			req.setAttribute("contentPage", "t2login/myPetInfo.jsp");
			
		}else {
			req.setAttribute("contentPage", "t2login/t2_login.jsp");
		}
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/t2myPage.go", method = RequestMethod.GET)
	public String t2myPagego(HttpServletRequest req) {
		//내정보페이지로 이동
		
		if(lDAO.loginCheck(req)) {
			//주소 ! 기준으로 자르기
			lDAO.splitAddr(req);
			req.setAttribute("contentPage", "t2login/t2_myPage.jsp");
		}else {
			req.setAttribute("contentPage", "t2login/t2_login.jsp");
		}
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/myinformation.chgae", method = RequestMethod.GET)
	public String myinformationchgae(HttpServletRequest req) {
		//내정보페이지 바꾸기 페이지
		
		if(lDAO.loginCheck(req)) {			
			lDAO.splitAddr(req);
			req.setAttribute("contentPage", "t2login/t2_myinforChage.jsp");
		}else {
		req.setAttribute("contentPage", "t2login/t2_login.jsp");
	}
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/myinforChange.do", method = RequestMethod.POST)
	public String myinforChangedo(HttpServletRequest req,Membert2 m) {
		//내정보 바꾸기
		
		if(lDAO.loginCheck(req)) {
			lDAO.memberInfoUpdate(m,req);
			lDAO.splitAddr(req);
			req.setAttribute("contentPage", "t2login/t2_myPage.jsp");
		}else {
			req.setAttribute("contentPage", "t2login/t2_login.jsp");			
		}
			
		
		return "2Team/t2_index";
	}
	
	
	@RequestMapping(value = "/t2mypetInformation.go", method = RequestMethod.GET)
	public String mypetInformationgo(HttpServletRequest req,pet p) {
		//강아지 정보 보러가는 페이지
		
		if(lDAO.loginCheck(req)) {
			lDAO.petinfoGet(req,p);
			req.setAttribute("contentPage", "t2login/myPetInfo.jsp");			
			
		}else {
			req.setAttribute("contentPage", "t2login/t2_login.jsp");			
			
		}
		
				
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/petInfoChange.go", method = RequestMethod.GET)
	public String petInfoChangego(HttpServletRequest req,pet p) {
		//강아지 정보 수정 페이지로 가는 controller
		
		if(lDAO.loginCheck(req)) {
			lDAO.petinfoGet(req,p);
			req.setAttribute("contentPage", "t2login/t2_petInfoChange.jsp");						
		}else {
			req.setAttribute("contentPage", "t2login/t2_login.jsp");			
			
		}
	
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/petInfoChage.do", method = RequestMethod.POST)
	public String petInfoChageDo(HttpServletRequest req,@RequestParam("baby_img") MultipartFile baby_img,
	         @RequestParam("baby_name") String baby_name,
	         @RequestParam("baby_weight") Double baby_weight,
	         @RequestParam("baby_birth") Date baby_birth,
	         @RequestParam("baby_sex") String baby_sex,
	         @RequestParam("baby_type") String baby_type,
	         @RequestParam("baby_typeDetail") String baby_typeDetail,
	         @RequestParam("baby_neut") String baby_neut) {
		//강아지 정보 수정 하는 기능
		
		if(lDAO.loginCheck(req)) {
			lDAO.petInfoUpdate(req,baby_img,baby_name,baby_weight,baby_birth,baby_sex,baby_type,baby_typeDetail,baby_neut);
			lDAO.petinfoGet(req);
			req.setAttribute("contentPage", "t2login/myPetInfo.jsp");
			 
		}else {
			req.setAttribute("contentPage", "t2login/t2_login.jsp");			
			
		}
		
		return "2Team/t2_index";
	}

	@RequestMapping(value = "/petInfoDelete", method = RequestMethod.GET)
	public String petInfoDelete(HttpServletRequest req,pet p) {
		//강아지 정보 삭제하는 기능
		
		if(lDAO.loginCheck(req)) {
			lDAO.petDelete(req,p);
			req.setAttribute("contentPage", "t2login/myPetInfo.jsp");						
		}else {
			req.setAttribute("contentPage", "t2login/t2_login.jsp");			
			
		}
	
		return "2Team/t2_index";
	}

	@RequestMapping(value = "/changePW.go", method = RequestMethod.GET)
	public String chagePW(HttpServletRequest req, Membert2 m) {
		//비밀번호 바꾸기 전 비밀번호 확인 페이지
		
		if(lDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "t2login/t2_changePWBefore.jsp");						
		}else {
			req.setAttribute("contentPage", "t2login/t2_login.jsp");			
			
		}
		
		return "2Team/t2_index";
	}

	@RequestMapping(value = "/pwchangeBefore.check", method = RequestMethod.POST)
	public String pwChangeBeforecheck(HttpServletRequest req, Membert2 m) {
		//비밀번호 일치하는 지 확인
		
		if(lDAO.loginCheck(req)) {
			if(lDAO.pwCheck(req,m)) {
				req.setAttribute("contentPage", "t2login/t2_changePW.jsp");										
			}else {
				req.setAttribute("contentPage", "t2login/t2_changePWBefore.jsp");
			}
		}else {
			req.setAttribute("contentPage", "t2login/t2_login.jsp");			
			
		}
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/pwChange.do", method = RequestMethod.POST)
	public String pwChangeDo(HttpServletRequest req, Membert2 m) {
		//비밀번호 변경하는 작업을 하는 controller
		
		if(lDAO.loginCheck(req)) {
			lDAO.PWChange(req,m);
			lDAO.splitAddr(req);
			req.setAttribute("contentPage", "t2login/t2_myPage.jsp");
		}else {
			req.setAttribute("contentPage", "t2login/t2_login.jsp");			
			
		}
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/DeleteMember.check", method = RequestMethod.GET)
	public String DeleteMemberCheck(HttpServletRequest req, Membert2 m) {
		//탈퇴하기 전 비밀번호 확인페이지로 가기
		
		if(lDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "t2login/t2_DeleteBeforePWCheck.jsp");						
		}else {
			req.setAttribute("contentPage", "t2login/t2_login.jsp");			
			
		}
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/deleteMember.PWCheck", method = RequestMethod.POST)
	public String deleteMemberPWCheck(HttpServletRequest req, Membert2 m) {
		//탈퇴하기 전 비밀번호 확인하는 기능 + 회원탈퇴 동의서로 가는 페이지
		
		if(lDAO.loginCheck(req)) {
			if(lDAO.pwCheck(req, m)) {
				lDAO.petinfoGet(req);
				req.setAttribute("contentPage", "t2login/t2_DeleteMemberInfo_agree.jsp");										
			}else {
				req.setAttribute("contentPage", "t2login/t2_DeleteBeforePWCheck.jsp");	
			}
		}else {
			req.setAttribute("contentPage", "t2login/t2_login.jsp");			
			
		}
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/deleteMember.Do", method = RequestMethod.GET)
	public String deleteMemberDo(HttpServletRequest req) {
		//멤버정보 삭제 + 삭제 완료 페이지
			
			
			lDAO.deleteMember(req);
			req.setAttribute("contentPage", "t2_home.jsp");						
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/t2FindID.go", method = RequestMethod.GET)
	public String t2FindIDGo(HttpServletRequest req) {
		//멤버 아이디 찾으러가는 페이지로 이동
		
		lDAO.loginCheck(req);
		
		req.setAttribute("contentPage", "t2login/t2_findIDgo.jsp");						
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/findID.DO", method = RequestMethod.POST)
	public String findIDDO(HttpServletRequest req,Membert2 m) {
		//멤버 아이디 찾는 기능
		
		lDAO.loginCheck(req);
		
		if (m.getMember_email() != null) {
			lDAO.IDfindByEmail(req,m);
		}else {
			lDAO.IDfindByPhoneNum(req,m);
		}
		
		req.setAttribute("contentPage", "t2login/t2_tellID.jsp");
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/t2FindPW.go", method = RequestMethod.GET)
	public String t2FindPWGo(HttpServletRequest req) {
		//멤버 비밀번호 찾으러가는 페이지로 이동
		
		lDAO.loginCheck(req);
		
		req.setAttribute("contentPage", "t2login/t2_findPWGO.jsp");						
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/sendPW.Do", method = RequestMethod.POST)
	public String sendPWDo(HttpServletRequest req,Membert2 m) {
		//멤버 비밀번호 (가 비밀번호 생성 후 보내는) controller
		
		lDAO.loginCheck(req);
		lDAO.findPWbyEmail(req, m);
							
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/t2VetMyPage.go", method = RequestMethod.GET)
	public String t2VetMyPageGo(HttpServletRequest req) {
		//비즈니스 마이 페이지로 가기
		
		if(lDAO.loginCheck(req)) {
			lDAO.splitAddr_bus(req);
			req.setAttribute("contentPage", "t2login/t2_businessMypage.jsp");
		}else {
			req.setAttribute("contentPage", "t2login/login_business.jsp");
		}
		
								
		
		
		return "2Team/t2_index";
	}

	@RequestMapping(value = "/businessInfoChange.go", method = RequestMethod.GET)
	public String businessInfoChangego(HttpServletRequest req) {
		//비즈니스 정보 수정 창으로 이동하는 controller
		
		if(lDAO.loginCheck(req)) {
			lDAO.splitAddr_bus(req);
			req.setAttribute("contentPage", "t2login/t2_businessInfoChange.jsp");
		}else {
			req.setAttribute("contentPage", "t2login/login_business.jsp");
		}
		
		
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/businessInfoChange.DO", method = RequestMethod.POST)
	public String businessInfoChangeDO(HttpServletRequest req , vet v) {
		//비즈니스 정보 수정하는 기능이 있는 controller
		
		if(lDAO.loginCheck(req)) {
			lDAO.businessInfoUpdate(req,v);
			lDAO.splitAddr_bus(req);
			req.setAttribute("contentPage", "t2login/t2_businessMypage.jsp");
		}else {
			req.setAttribute("contentPage", "t2login/login_business.jsp");
		}
		
		
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/businessPWchange.go", method = RequestMethod.GET)
	public String businessPWchangeGo(HttpServletRequest req ) {
		//비즈니스 비밀번호 바꾸기 전 비밀번호 체크하는 페이지로 이동하는 controller
		
		if(lDAO.loginCheck(req)) {
			
			req.setAttribute("contentPage", "t2login/t2_businessPWChangeBefore.jsp");
		}else {
			req.setAttribute("contentPage", "t2login/login_business.jsp");
		}
		
		
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/businessPWCheck.do", method = RequestMethod.POST)
	public String businessPWCheckDo(HttpServletRequest req,vet v ) {
		//비즈니스 비밀번호 찾기 전 비밀번호 확인하는 기능있는 controller
		
		if(lDAO.loginCheck(req)) {
			if(lDAO.businessPWCheck(req,v)) {
				req.setAttribute("contentPage", "t2login/t2_BusinessChangePW.jsp");				
			}else {
				req.setAttribute("result", "비밀번호가 일치하지 않습니다.");
				req.setAttribute("contentPage", "t2login/t2_businessPWChangeBefore.jsp");				
			}
		}else {
			req.setAttribute("contentPage", "t2login/login_business.jsp");
		}
		
		
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/businessPWchange.DO", method = RequestMethod.POST)
	public String businessPWChangeDo(HttpServletRequest req,vet v ) {
		//비즈니스 비밀번호 바꾸는 기능을 하는 controller
		
		if(lDAO.loginCheck(req)) {
			lDAO.businessPWUpdate(req,v);
			lDAO.splitAddr_bus(req);
			req.setAttribute("contentPage", "t2login/t2_businessMypage.jsp");
		}else {
			req.setAttribute("contentPage", "t2login/login_business.jsp");
		}
		
		
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/businessDeletePWCheck.go", method = RequestMethod.GET)
	public String businessDeletePWCheckGo(HttpServletRequest req,vet v ) {
		//비즈니스 탈퇴하기 전 패스워드 확인하는 페이지가는 controller
		
		if(lDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "t2login/t2_businessDeletePWCheck.jsp");
		}else {
			req.setAttribute("contentPage", "t2login/login_business.jsp");
		}
		
		
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/businessDeletePWCheck.DO", method = RequestMethod.POST)
	public String businessDeletePWCheckDO(HttpServletRequest req,vet v ) {
		//비즈니스 탈퇴 전 패스워드 일치하는 지 확인하는 기능이 있는 controller
		
		if(lDAO.loginCheck(req)) {
			if(lDAO.businessPWCheck(req,v)) {
				req.setAttribute("contentPage", "t2login/t2_businessDelete_agree.jsp");				
			}else {
				req.setAttribute("result", "비밀번호가 일치하지 않습니다.");
				req.setAttribute("contentPage", "t2login/t2_businessDeletePWCheck.jsp");				
			}
		}else {
			req.setAttribute("contentPage", "t2login/login_business.jsp");
		}
		
		
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/businessDelte.DO", method = RequestMethod.GET)
	public String businessDelteDO(HttpServletRequest req,vet v ) {
		//비즈니스 멤버 탈퇴하는 기능이 있는 controller
		
		if(lDAO.loginCheck(req)) {
			lDAO.businessDelete(req);
			req.setAttribute("contentPage", "t2_home.jsp");
		}else {
			req.setAttribute("contentPage", "t2login/login_business.jsp");
		}
		
		
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/businessIDFind.go", method = RequestMethod.GET)
	public String businessIDFindgo(HttpServletRequest req,vet v ) {
		//비즈니스 멤버 아이디 찾는 페이지로 넘어가는 controller
		
		lDAO.loginCheck(req);
		
		req.setAttribute("contentPage", "t2login/t2_businessFindID.jsp");
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/businessIDFind.do", method = RequestMethod.POST)
	public String businessIDFinddo(HttpServletRequest req,vet v ) {
		//비즈니스 멤버 아이디 찾는 기능으로 연결해주는 controller
		
		lDAO.loginCheck(req);
		if (v.getVet_businessNum() != null) {
			lDAO.businessFindIDbybusinessNum(req,v);
		}else {
			lDAO.businessFindIDbyphoneNum(req,v);
		}
		
		req.setAttribute("contentPage", "t2login/t2_businesstellID.jsp");
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/businessPWFind.go", method = RequestMethod.GET)
	public String businessPWFindgo(HttpServletRequest req,vet v ) {
		//비즈니스 멤버 비밀번호 찾으러 가는 controller
		
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "t2login/t2_businessFindPW.jsp");
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/businessFindPW.DO", method = RequestMethod.POST)
	public String businessFindPWDO(HttpServletRequest req,vet v ) {
		//비즈니스 멤버 패스워드변경 전 일치하는 회원이 있는 지 확인하는 기능을 가진 controller
		
		lDAO.loginCheck(req);
		if (v.getVet_businessNum() != null) {
			if (lDAO.businessFIndPWBybusinessNum(req,v)) {
				req.setAttribute("contentPage", "t2login/t2_BusinessChangePW.jsp");
			}else {
				req.setAttribute("contentPage", "t2login/t2_businessTellPW.jsp");
				
			}
		}else {
			if (lDAO.businessFindPWbyPhoneNum(req,v)) {
				req.setAttribute("contentPage", "t2login/t2_BusinessChangePW.jsp");
			}else {
				req.setAttribute("contentPage", "t2login/t2_businessTellPW.jsp");
			}
		}
		
		
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/businessFindPWchange.DO", method = RequestMethod.POST)
	public String businessFindPWchangeDO(HttpServletRequest req,vet v ) {
		//비즈니스 멤버 비밀번호 찾으러 가는 controller
		
		lDAO.loginCheck(req);
		lDAO.businessPWUpdate(req,v);
		req.setAttribute("contentPage", "t2login/login_business.jsp");
		
		return "2Team/t2_index";
	}
	
	
	
	
}
