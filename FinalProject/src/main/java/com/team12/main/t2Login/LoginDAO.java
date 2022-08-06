package com.team12.main.t2Login;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class LoginDAO {
	
	@Autowired
	private SqlSession ss;

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

	
	
	

}
