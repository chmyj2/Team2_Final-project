package com.team12.main.t2Login;

import java.io.File;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;

import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
			String date = req.getParameter("member_birth");
			
			Date member_birth = Date.valueOf(date);

			
			String member_address = addr1 +"!"+addr2+"!"+addr3;
			
			
			m.setMember_birth(member_birth);
			m.setMember_address(member_address);
			
			
			if (ss.getMapper(Team2loginMapper.class).join(m) == 1) {
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}



	public int checkBusinessNum(vet v) {
		// 비즈니스 사업자 번호 중복체크
		return ss.getMapper(Team2loginMapper.class).businessNumCheck(v);
	}



	public void joinBusiness(HttpServletRequest req, vet v) {
		// 비즈니스 회원가입 기능
		
		try {
			req.setCharacterEncoding("utf-8");
			
			String addr3 = req.getParameter("m_addr3");
			String addr2 = req.getParameter("m_addr2");
			String addr1 = req.getParameter("m_addr1");
			
			String vet_address = addr1 +"!"+addr2+"!"+addr3;
			
			v.setVet_address(vet_address);
			
			if (ss.getMapper(Team2loginMapper.class).joinBusiness(v) == 1) {
				System.out.println("비즈니스성공");
			}else {
				System.out.println("비즈니스실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}



	public int naverLogin(Membert2 m) {
		
			//아이디있는 지 확인
			System.out.println(m.getMember_ID());
		return ss.getMapper(Team2loginMapper.class).checkIdNaver(m);
	}



	public void loginNaver(HttpServletRequest req, Membert2 m) {
		// 네이버 로그인
		m.setMember_linkWhere(3);
		Membert2 dbMember = ss.getMapper(Team2loginMapper.class).getMemberByID(m);
		
		if (dbMember != null) {
				req.getSession().setAttribute("loginMember", dbMember);
				req.getSession().setMaxInactiveInterval(60 * 10);
		}else {
			System.out.println("--------111------------실패");
		}
		
	}



	public void naverJoin(HttpServletRequest req, Membert2 m) {
		//네이버로 회원가입한 사람 등록하기
		try {
			req.setCharacterEncoding("utf-8");
			
			String member_ID =req.getParameter("member_ID");
			String member_name = req.getParameter("member_name");
			String member_email = req.getParameter("member_email");
			String member_sex = req.getParameter("member_sex");
			
			String member_address = " ";
			String member_PW = " ";
			int member_linkWhere = 3;
			String member_phoneNum = " "; 
			
			
			m.setMember_ID(member_ID);
			m.setMember_PW(member_PW);
			m.setMember_linkWhere(member_linkWhere);
			m.setMember_name(member_name);
			m.setMember_sex(member_sex);
			m.setMember_phoneNum(member_phoneNum);
			m.setMember_email(member_email);
			m.setMember_address(member_address);
			m.setMember_birth(null);
			
			
			if (ss.getMapper(Team2loginMapper.class).join(m) == 1) {
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}



	public void petReg(HttpServletRequest req, MultipartFile baby_img, String baby_name, Double baby_weight, Date baby_birth, String baby_sex, String baby_type, String baby_typeDetail, String baby_neut, String baby_memberID) {
		// 펫등록하기
		String path = req.getSession().getServletContext().getRealPath("resources/t2_sj_petFiles");
		
		System.out.println("여기오는거니???????????");
		
		try {
			System.out.println("왜 안되는 거냐구 왜!!!");
			
			String fileName = baby_img.getOriginalFilename();
			
			String saveFileName = UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
			System.out.println(saveFileName);
			
			//값 받아오기
			
			
			
			System.out.println(baby_memberID);
			System.out.println(saveFileName);
			System.out.println(baby_name);
			System.out.println(baby_weight);
			System.out.println(baby_birth);
			System.out.println(baby_sex);
			System.out.println(baby_type);
			System.out.println(baby_typeDetail);
			System.out.println(baby_neut);
			
			//값세팅하기
			pet p = new pet();
			p.setBaby_birth(baby_birth);
			p.setBaby_img(saveFileName);
			p.setBaby_memberID(baby_memberID);
			p.setBaby_name(baby_name);
			p.setBaby_neut(baby_neut);
			p.setBaby_sex(baby_sex);
			p.setBaby_type(baby_type);
			p.setBaby_typeDetail(baby_typeDetail);
			p.setBaby_weight(baby_weight);
			
			if (ss.getMapper(Team2loginMapper.class).petReg(p)==1) {
				System.out.println("등록 성공-----------");
			}else {
				System.out.println("1등록 실패-----------");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			//String fileName = mr.getFilesystemName("baby_img");
			//new File(path + "/" + fileName).delete();
			System.out.println("2등록실패------------------------");
		}
		
		
	}

	
	
	

}
