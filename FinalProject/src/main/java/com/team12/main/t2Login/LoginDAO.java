package com.team12.main.t2Login;

import java.sql.Date;
import java.text.SimpleDateFormat;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import oracle.jdbc.driver.T2CConnection;



@Service
public class LoginDAO {
	
	@Autowired
	private SqlSession ss;
	@Autowired
	private JavaMailSender mailSender;

	public boolean login(HttpServletRequest req, Membert2 m) {
		//로그인하는 기능
		Membert2 dbMember = ss.getMapper(Team2loginMapper.class).getMemberByID(m);
		
		if (dbMember != null) {
			if (m.getMember_PW().equals(dbMember.getMember_PW())) {
				req.getSession().setAttribute("loginMember", dbMember);
				req.getSession().setMaxInactiveInterval(60 * 10);
				
				return true;
			}else {
				
				return false;
			}
		}else {
			
			return false;
		}
		
	}
	
	

	public boolean loginCheck(HttpServletRequest req) {
		//로그인 체크
		if (req.getSession().getAttribute("loginMember_business") != null) {
			
			return	memberLogin_bu(req);
		}
		return	memberLogin(req);
		
	}

	private boolean memberLogin_bu(HttpServletRequest req) {
		// 기업용 체크
		vet vet = (com.team12.main.t2Login.vet) req.getSession().getAttribute("loginMember_business");
		if (vet != null) {
			req.setAttribute("loginPage", "t2login/loginOK.jsp");
			return true;
			
		}else {
			req.setAttribute("loginPage", "t2login/login.jsp");
			return false;
		}
	}

	private boolean memberLogin(HttpServletRequest req) {
		// 개인용 로그인 체크 
				Membert2 m = (Membert2) req.getSession().getAttribute("loginMember");
				if (m != null) {
					System.out.println(m.getMember_ID());
					req.setAttribute("loginPage", "t2login/loginOK.jsp");
					return true;
				}else {
					req.setAttribute("loginPage", "t2login/login.jsp");
					return false;
					
				}
		
	}

	public void logout(HttpServletRequest req) {
		// 로그아웃하기
		if (req.getSession().getAttribute("loginMember_business") != null) {
			
			req.getSession().setAttribute("loginMember_business",null);
			
		}else {
			req.getSession().setAttribute("loginMember", null);
			
		}
	}



	public boolean login_business(HttpServletRequest req, vet v) {
		// 기업용 로그인하기
		vet dbvet= ss.getMapper(Team2loginMapper.class).getVetByID(v);
		
		if(dbvet != null) {
			if(v.getVet_PW().equals(dbvet.getVet_PW())) {
				req.getSession().setAttribute("loginMember_business", dbvet);
				req.getSession().setMaxInactiveInterval(60 * 10);
				return true;
			}else {
				return false;
				
			}
		}else {
			return false;
			
		}
		
	}



	public String emailCheck(String member_email) {
		// 인증 이메일 보내기
		
		//랜덤숫자 생성
		Random random = new Random();
		int checknum = random.nextInt(888888)+111111; //111111~999999 랜덤 숫자
		System.out.println("랜덤 숫자"+checknum); //랜덤숫자 확인용
		
		//이메일 보낼 양식
		String setFrom = "tn3651@naver.com"; // 설정한 내 이메일
        String toMail = member_email;
        String title = "산책가자 회원가입 인증 이메일 입니다.";
        String content = 
                "산책가자를 방문해주셔서 감사합니다." +
                "</n></n>" + 
                "인증 번호는 " + checknum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        //이메일 전송을 위한 코드
        
        try {
        	MimeMessage mes =mailSender.createMimeMessage();
        	MimeMessageHelper helper = new MimeMessageHelper(mes,true,"utf-8");
        	helper.setFrom(setFrom);
        	helper.setTo(toMail);
        	helper.setSubject(title);
        	helper.setText(content);
        	mailSender.send(mes);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
        
		
		
		return Integer.toString(checknum);
	}



	public int checkId(Membert2 m) {
		//아이디 중복체크
		return ss.getMapper(Team2loginMapper.class).checkId(m);
	}



	public int checkEmail(Membert2 m) {
		// 이메일 중복체크
		return ss.getMapper(Team2loginMapper.class).checkEmail(m);
	}



	public void join(HttpServletRequest req, Membert2 m) {
		// 회원가입
		
		try {
			req.setCharacterEncoding("utf-8");
			
			
			String addr3 = req.getParameter("m_addr3");
			String addr2 = req.getParameter("m_addr2");
			String addr1 = req.getParameter("m_addr1");
			
			
			Date member_birth = Date.valueOf(req.getParameter("member_birth"));

			
			String member_address = addr1 +"!"+addr2+"!"+addr3;
			
			m.setMember_ID(req.getParameter("member_ID"));
			m.setMember_PW(req.getParameter("member_PW"));
			m.setMember_name(req.getParameter("member_name"));
			m.setMember_birth(member_birth);
			m.setMember_sex(req.getParameter("member_sex"));
			m.setMember_phoneNum(req.getParameter("member_phoneNum"));
			m.setMember_address(member_address);
			m.setMember_email(req.getParameter("member_email"));
			
			if (ss.getMapper(Team2loginMapper.class).join(m) == 1) {
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
	

}
