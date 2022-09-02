package com.team12.main.t2Login;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
				req.getSession().setMaxInactiveInterval(60 * 60);
				
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
				req.getSession().setMaxInactiveInterval(60 * 60);
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
				req.getSession().setMaxInactiveInterval(60 * 60);
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
			String member_paper="비동의";
			
			
			m.setMember_ID(member_ID);
			m.setMember_PW(member_PW);
			m.setMember_linkWhere(member_linkWhere);
			m.setMember_name(member_name);
			m.setMember_sex(member_sex);
			m.setMember_phoneNum(member_phoneNum);
			m.setMember_email(member_email);
			m.setMember_address(member_address);
			m.setMember_birth(null);
			m.setMember_paper(member_paper);
			
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
		System.out.println(path);

		
		try {
			
			String fileName = baby_img.getOriginalFilename();
			
			String saveFileName = UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
			System.out.println(saveFileName);
			
			//값 받아오기
			
			
			
			/*System.out.println(baby_memberID);
			System.out.println(saveFileName);
			System.out.println(baby_name);
			System.out.println(baby_weight);
			System.out.println(baby_birth);
			System.out.println(baby_sex);
			System.out.println(baby_type);
			System.out.println(baby_typeDetail);
			System.out.println(baby_neut);*/
			
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
			
			if (!baby_img.getOriginalFilename().isEmpty()) {
				//실제 업로드 코드
				baby_img.transferTo(new File(path,saveFileName));
				ss.getMapper(Team2loginMapper.class).petReg(p);
				System.out.println("펫 등록 성공");
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			//String fileName = mr.getFilesystemName("baby_img");
			//new File(path + "/" + fileName).delete();
			System.out.println("2등록실패------------------------");
		}
		
		
	}



	public void splitAddr(HttpServletRequest req) {
		// 주소 ! 기준으로 자르기
		Membert2 m = (Membert2) req.getSession().getAttribute("loginMember");
		if (m.getMember_address() != null) {
			String m_addr = m.getMember_address();
			String[]  m_addr2 = m_addr.split("!");
			req.setAttribute("addr", m_addr2);
			
		}
		
	}



	public void memberInfoUpdate(Membert2 m, HttpServletRequest req) {
		// 회원정보 수정하는 기능
		Membert2 loginMember = (Membert2) req.getSession().getAttribute("loginMember");
		
		String addr1 = req.getParameter("m_addr1");
		String addr2 = req.getParameter("m_addr2");
		String addr3 = req.getParameter("m_addr3");
		
		
		String member_address = addr1 +"!"+addr2+"!"+addr3;
		m.setMember_address(member_address);
		
		if (ss.getMapper(Team2loginMapper.class).memberUpdate(m)==1) {
			System.out.println("------------------정보수정완료");
			req.getSession().setAttribute("loginMember", m);
		}else {
			System.out.println("-----------------------정보수정 실패");
		}
		
	}



	public void petinfoGet(HttpServletRequest req, pet p) {
		// 펫 정보 출력하기
		Membert2 loginMember = (Membert2) req.getSession().getAttribute("loginMember");
		
		String ID = loginMember.getMember_ID();
		
		//System.out.println("---------------------"+ID);
		p.setBaby_memberID(ID);
		pet petInfo = ss.getMapper(Team2loginMapper.class).getPetInfo(p);
		
		
		
		req.setAttribute("petInfo",petInfo); 

		
	}




	public void petInfoUpdate(HttpServletRequest req, MultipartFile baby_img, String baby_name, Double baby_weight,
			Date baby_birth, String baby_sex, String baby_type, String baby_typeDetail, String baby_neut) {
		
		// 펫정보 업데이트하기
		
				String path = req.getSession().getServletContext().getRealPath("resources/t2_sj_petFiles");
				System.out.println(path);
				Membert2 member = (Membert2) req.getSession().getAttribute("loginMember");
				//사용자 ID 가져오기
				String ID = member.getMember_ID();
				
				//사용자 ID에 일치하는 펫 사진 가져오기
				pet p = new pet();
				p.setBaby_memberID(ID);
				pet petInfo = ss.getMapper(Team2loginMapper.class).getPetInfo(p);
				
				String oldFile = petInfo.getBaby_img();
				String newFile = "1";
				
				newFile = baby_img.getOriginalFilename();
				System.out.println("oldFile:"+oldFile);
				System.out.println("newFile"+newFile);
				
					if (newFile == "") {
						newFile = oldFile;
						
					}else {
						
						newFile= UUID.randomUUID().toString()+newFile.substring(newFile.lastIndexOf("."));
						
					}
					

				try {
					
					//값 태워보내기
					p.setBaby_img(newFile);
					p.setBaby_name(baby_name);
					p.setBaby_birth(baby_birth);
					p.setBaby_img(newFile);
					p.setBaby_neut(baby_neut);
					p.setBaby_sex(baby_sex);
					p.setBaby_type(baby_type);
					p.setBaby_typeDetail(baby_typeDetail);
					p.setBaby_weight(baby_weight);
					
					if (!newFile.isEmpty()) {
						//실제 업로드 코드
						
						if (ss.getMapper(Team2loginMapper.class).petInfoUpdate(p) ==1) {
							System.out.println("pet info GOOD");
						if (!oldFile.equals(newFile)) {
							baby_img.transferTo(new File(path,newFile));
							
							newFile = URLDecoder.decode(oldFile, "utf-8");
							new File(path+"/"+oldFile).delete();
						}
				}else {
						System.out.println("펫 정보 수정 실패(2)");
					if (!oldFile.equals(newFile)) {
							newFile = URLDecoder.decode(newFile, "utf-8");
							new File(path + "/" + newFile).delete();
						}
						
						System.out.println("펫 등록 성공");
					}
					}
					
					
					
					
				} catch (Exception e) {
					e.printStackTrace();
					if (!oldFile.equals(newFile)) {
						try {
							newFile = URLDecoder.decode(newFile, "utf-8");
						} catch (UnsupportedEncodingException e1) {
						}
						new File(path + "/" + newFile).delete();
					}
				}
		
	}



	public void petinfoGet(HttpServletRequest req) {
		//펫 정보 얻어가는 다른 방법
		Membert2 loginMember = (Membert2) req.getSession().getAttribute("loginMember");
		
		String ID = loginMember.getMember_ID();
		
		System.out.println("---------------------"+ID);
		pet p = new pet();
		p.setBaby_memberID(ID);
		pet petInfo = ss.getMapper(Team2loginMapper.class).getPetInfo(p);
		
		
		
		req.setAttribute("petInfo",petInfo);
		
	}



	public void petDelete(HttpServletRequest req, pet p) {
		// 펫 정보 삭제하는 기능
		
		try {
		Membert2 loginMember = (Membert2) req.getSession().getAttribute("loginMember");
		String ID = loginMember.getMember_ID();
		p.setBaby_memberID(ID);
		if (ss.getMapper(Team2loginMapper.class).petDelete(p)==1) {
			System.out.println("삭제성공");
			String path = req.getSession().getServletContext().getRealPath("resources/t2_sj_petFiles");
			
				String baby_img = p.getBaby_img();
				
				baby_img = URLDecoder.decode(baby_img, "utf-8");
				new File(path+"/"+baby_img).delete();
			} 
			}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
		}
		
	}



	public boolean pwCheck(HttpServletRequest req, Membert2 m) {
		// 비밀번호 일치하는 지 확인하는 기능
		Membert2 loginMember = (Membert2) req.getSession().getAttribute("loginMember");
		
		String PW = loginMember.getMember_PW();
		String PWInput = m.getMember_PW();
		if (PW.equals(PWInput)) {
			return true;
		}else {
			req.setAttribute("result", "비밀번호가 일치하지 않습니다.");
			return false;
		}
	}



	public void PWChange(HttpServletRequest req, Membert2 m) {
		// 비밀번호를 바꾸는 작업을 하는 기능
		System.out.println(m.getMember_PW());
		Membert2 loginMember = (Membert2) req.getSession().getAttribute("loginMember");
		m.setMember_ID(loginMember.getMember_ID());
		
		if(ss.getMapper(Team2loginMapper.class).memberPWChange(m)==1) {
			System.out.println("비밀번호 업데이트 완료");
			m.setMember_linkWhere(1);
			
			//바꾼 정보 다시 넣기
			
			Membert2 dbMember= ss.getMapper(Team2loginMapper.class).getMemberByID(m);
			req.getSession().setAttribute("loginMember", dbMember);
		}
	}



	public void deleteMember(HttpServletRequest req) {
		// 일반회원 탈퇴하는 기능
		
		Membert2 m = (Membert2) req.getSession().getAttribute("loginMember");
		
		if (ss.getMapper(Team2loginMapper.class).deleteMember(m)==1) {
			System.out.println("탈퇴 성공하였다!!!");
			
			String path = req.getSession().getServletContext().getRealPath("resources/t2_sj_petFiles");
			
			String baby_img=req.getParameter("baby_img");
			System.out.println(baby_img);
			try {
				baby_img = URLDecoder.decode(baby_img, "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			new File(path+"/"+baby_img).delete();
			logout(req);
			loginCheck(req);
		}
	}



	public void IDfindByEmail(HttpServletRequest req, Membert2 m) {
		// 아이디 찾기 이메일, 이름으로
		
		Membert2 dbMember= ss.getMapper(Team2loginMapper.class).IDfindByEmail(m);

		
		
		if (dbMember != null) {
			System.out.println(dbMember.getMember_ID());
			System.out.println(dbMember.getMember_linkWhere());
			req.setAttribute("tellID", dbMember);
		}else {
			System.out.println("존재하지 않는 회원입니다만");
		}
		
	}



	public void IDfindByPhoneNum(HttpServletRequest req, Membert2 m) {
		// 전화번호랑 이름으로  아이디 찾기
		
		Membert2 dbMember = ss.getMapper(Team2loginMapper.class).getMemberByPhone(m);
		
		if (dbMember != null) {
			System.out.println(dbMember.getMember_ID());
			System.out.println(dbMember.getMember_linkWhere());
			req.setAttribute("tellID", dbMember);
		}else {
			if (ss.getMapper(Team2loginMapper.class).findmemberID(m) >= 1) {
				
				req.setAttribute("result","소셜 로그인로 가입하셨거나" );
			}
		}
		
	}



	public void findPWbyEmail(HttpServletRequest req, Membert2 m) {
		// 패스워드 찾기 (이메일로 가 비밀번호 보내주기)
		
		Membert2 dbMember = ss.getMapper(Team2loginMapper.class).checkMember(m);
		
		if (dbMember != null) {
			
		if (dbMember.getMember_linkWhere() == 1) {
			System.out.println("1------>"+m.getMember_email());
			Random rnd = new Random();
			StringBuffer buf = new StringBuffer();
			for (int i = 0; i < 6; i++) {
				//rnd.nextBoolean() -> 랜덤으로 true,false를 리턴함
				if (rnd.nextBoolean()) {
					//랜덤으로 소문자
					buf.append((char)((int)(rnd.nextInt(26))+97));
					//랜덤으로 대문자
					buf.append((char)((int)(rnd.nextInt(26))+65));
				}else {
					//랜덤으로 숫자 나오기
					buf.append((rnd.nextInt(10)));
				}
				System.out.println(buf);
			}
			
			String setFrom = "tn3651@naver.com"; // 설정한 내 이메일
	        String toMail = m.getMember_email();
	        String title = "산책가자 새 비밀번호 입니다.";
	        String content = 
	                "산책가자를 새 비밀번호." +
	                "비밀번호는 " + buf + "입니다." + 
	                "해당 비밀번호로 로그인 후 비밀번호를 바꿔주세요";
	        
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
	        String newPW = buf.toString();
	        m.setMember_PW(newPW);
	        if (ss.getMapper(Team2loginMapper.class).memberPWChange(m) ==1) {
				
				System.out.println("성공?");
				req.setAttribute("contentPage", "t2login/t2_login.jsp");	
			}else {
				System.out.println("실패");
			}
			
			
		}else if (dbMember.getMember_linkWhere() ==2 || dbMember.getMember_linkWhere() == 3) {
			System.out.println("2------>"+m.getMember_email());
			req.setAttribute("linkeWhere", dbMember.getMember_linkWhere());
			
			req.setAttribute("contentPage", "t2login/t2_tellPWfail.jsp");	
		}
		}else {
			System.out.println("없는 회원입니다");
			
			req.setAttribute("contentPage", "t2login/t2_tellPWfail.jsp");	
		}
		
	}
	
	public void splitAddr_bus(HttpServletRequest req) {
        // 주소 ! 기준으로 자르기 비즈니스용
        vet v = (vet) req.getSession().getAttribute("loginMember_business");

        if (v.getVet_address() != null) {
            String v_addr = v.getVet_address();
            String[]  v_addr2 = v_addr.split("!");
            req.setAttribute("addr", v_addr2);

        }

    }



	public void businessInfoUpdate(HttpServletRequest req, vet v) {
		// 비즈니스 회원 정보 수정하는 기능
		
		//아이디 가져오기
		vet business = (vet) req.getSession().getAttribute("loginMember_business");
		v.setVet_ID(business.getVet_ID());
		
		String addr1 = req.getParameter("m_addr1");
		String addr2 = req.getParameter("m_addr2");
		String addr3 = req.getParameter("m_addr3");
		
		
		String vet_address = addr1 +"!"+addr2+"!"+addr3;
		v.setVet_address(vet_address); 
		System.out.println(v.getVet_phoneNum());
		
		if(ss.getMapper(Team2loginMapper.class).businessUpdate(v) ==1) {
			System.out.println("비즈니스 정보 수정 성공");
			req.getSession().setAttribute("loginMember_business", v);
		}else {
			System.out.println("비즈니스 정보 수정 실패");
		}
	}



	public boolean businessPWCheck(HttpServletRequest req, vet v) {
		// 비즈니스 비밀번호 일치하는 지 확인하는 기능
		
		vet business = (vet) req.getSession().getAttribute("loginMember_business");
		String PW = business.getVet_PW();
		String inPutPW = v.getVet_PW();
		
		if (inPutPW.equals(PW)) {
			return true;
		}else {
			return false;
		}
	}



	public void businessPWUpdate(HttpServletRequest req, vet v) {
		// 비즈니스 비밀번호 바꾸는 기능
		
		vet business = (vet) req.getSession().getAttribute("loginMember_business");
		if (business != null) {
			v.setVet_ID(business.getVet_ID());
		}
		
		if (ss.getMapper(Team2loginMapper.class).businessPWUpdate(v)==1) {
			System.out.println("비밀번호 업데이트 성공");
			
			//바뀐 정보 다시 넣기
			business = ss.getMapper(Team2loginMapper.class).getVetByID(v);
			req.getSession().setAttribute("loginMember_business", business);
		}
	}



	public void businessDelete(HttpServletRequest req) {
		// 비즈니스 멤버 탈퇴하는 기능
		
		vet v = (vet) req.getSession().getAttribute("loginMember_business");
		
		if (ss.getMapper(Team2loginMapper.class).deleteBusiness(v)==1) {
			System.out.println("비즈니스 탈퇴 성공");
			
			logout(req);
			loginCheck(req);
		}
	}



	public void businessFindIDbybusinessNum(HttpServletRequest req, vet v) {
		// 비즈니스 아이디 사업자 번호로 찾기
		
		vet dbVet = ss.getMapper(Team2loginMapper.class).getBusinessIDbyBusinessNum(v);
		
		if (dbVet != null) {
			System.out.println(dbVet.getVet_ID());
			System.out.println("비즈니스 아이디 찾기 완료");
			String ID = dbVet.getVet_ID();
			req.setAttribute("ID", ID);
		}else {
			System.out.println("비즈니스 아이디 없음");
			req.setAttribute("result", "회원가입한 이력이 없는 회원입니다.");
		}
	}



	public void businessFindIDbyphoneNum(HttpServletRequest req, vet v) {
		// 비즈니스 아이디 전화번호로 찾기
		
		vet dbVet = ss.getMapper(Team2loginMapper.class).getBusinessIDbyPhoneNum(v);
		
		if (dbVet != null) {
			System.out.println(dbVet.getVet_ID());
			System.out.println("비즈니스 아이디 폰번호로 찾기");
			String id = dbVet.getVet_ID();
			req.setAttribute("ID", id );
		}else {
			req.setAttribute("result", "회원가입한 이력이 없는 회원입니다.");
		}
		
	}



	public boolean businessFIndPWBybusinessNum(HttpServletRequest req, vet v) {
		// 비즈니스 회원 비밀번호 변경전 일치하는 회원이 있는 지 확인하는 기능
		
		
		if (ss.getMapper(Team2loginMapper.class).getBusinessPWbybusinessNum(v) == 1) {
			System.out.println("일치하는 회원이 있는 비즈니스 멤버");
			String id = v.getVet_ID();
			req.setAttribute("ID", id);
			return true;
		}else {
			System.out.println("일치하는 회원이 없는 비즈니스 멤버");
			return false;
		}
		
	}



	public boolean businessFindPWbyPhoneNum(HttpServletRequest req, vet v) {
		// 비즈니스 회원 비밀번호 변경전 일치하는 회원이 있는지 확인하는 기능 by phoneNum
		
		if (ss.getMapper(Team2loginMapper.class).getBusinessPWbyPhoneNum(v) == 1) {
			System.out.println("일치하는 회원이 있는 비즈니스 멤버");
			String id = v.getVet_ID();
			req.setAttribute("ID", id);
			return true;
		}else {
			System.out.println("일치하는 회원이 없는 비즈니스 멤버");
			return false;
		}
	}



	

	
	
	

}
