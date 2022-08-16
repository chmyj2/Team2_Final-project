package com.team12.main.team1.join;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;



@Service
public class MemberDAO {
	
	@Autowired
	private SqlSession ss;

	public void join(Member m, HttpServletRequest req){
		// TODO Auto-generated method stub
		
		       
//				req.setCharacterEncoding("utf-8");
			
		
			String jm_address1 = req.getParameter("m_addr1");
			String jm_address2 = req.getParameter("m_addr2");
			String jm_address3 = req.getParameter("m_addr3");
			
			String jm_addr = jm_address1 + "!" + jm_address2  + "!" + jm_address3;
			
		
			Date jm_date = Date.valueOf(req.getParameter("member_birth"));


			m.setMember_ID(req.getParameter("member_ID"));
			m.setMember_PW(req.getParameter("member_PW"));
			m.setMember_name(req.getParameter("member_name"));
			m.setMember_birth(jm_date);
			m.setMember_sex(req.getParameter("member_sex"));
			m.setMember_phoneNum(req.getParameter("member_phoneNum"));
	        m.setMember_address(jm_addr);
	        m.setMember_email(req.getParameter("member_email"));


	if (ss.getMapper(Team1joinMapper.class).join(m) == 1) {
		req.setAttribute("result", "가입성공");
	} else {
		req.setAttribute("result", "가입실패");
	}
		      
} 


	public void login(Member m, HttpServletRequest req) {
		// TODO Auto-generated method stub
		Member dbMember = ss.getMapper(Team1joinMapper.class).getMemberByID(m);

		if (dbMember != null) {
			if (m.getMember_PW().equals(dbMember.getMember_PW())) {
				req.getSession().setAttribute("loginMember", dbMember);
				req.getSession().setMaxInactiveInterval(60 * 10);
			} else {
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else {
			req.setAttribute("result", "로그인 실패(미가입ID)");
		}
		
		
		
	}

	public boolean loginCheck(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		if (m != null) {
			req.setAttribute("loginPage", "../LDH/loginSuccess.jsp");
			return true;
		} 
			req.setAttribute("loginPage", "../LDH/beforeLogin.jsp");
			return false;
		}
	
	public void splitAddr(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		String jm_addr = m.getMember_address();
		String[] jm_addr2 = jm_addr.split("!");
		req.setAttribute("addr", jm_addr2);

	}

	public void logout(HttpServletRequest req) {
		// TODO Auto-generated method stub
		req.getSession().setAttribute("loginMember", null);
	}

	
	
	
	
	
	public void update(Member m, HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	try {
		
	
		String jm_address1 = req.getParameter("jm_addr1");
		String jm_address2 = req.getParameter("jm_addr2");
		String jm_address3 = req.getParameter("jm_addr3");

		String jm_addr = jm_address1 + "!" + jm_address2 + "!" + jm_address3;


		m.setMember_ID(req.getParameter("jm_id"));
		m.setMember_PW(req.getParameter("jm_pw"));
		m.setMember_name(req.getParameter("jm_name"));
		m.setMember_phoneNum(req.getParameter("jm_pNum"));
   
		m.setMember_address(jm_addr);
        m.setMember_email(req.getParameter("jm_email"));
		
//        System.out.println(m.getMember_ID());
//        System.out.println(m.getMember_PW());
//        System.out.println(m.getMember_name());
//        System.out.println(m.getMember_phoneNum());
//        System.out.println(jm_addr);
//        System.out.println(m.getMember_email());
//        



		if (ss.getMapper(Team1joinMapper.class).update(m) == 1) {
			req.setAttribute("result", "수정성공");
			req.getSession().setAttribute("loginMember", m);
		} else {
			req.setAttribute("result", "수정실패");
		}
	} catch (Exception e) {
		e.printStackTrace();
		req.setAttribute("result", "수정실패");
		// TODO: handle exception
	}
		
	}
	

	public void bye(HttpServletRequest req) {
		// TODO Auto-generated method stub
		
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");

			//int msgCount = ss.getMapper(SNSMapper.class).getMsgCountByOwner(m);
			//int allMsgCount = sDAO.getAllMsgCount();

			if (ss.getMapper(Team1joinMapper.class).bye(m) == 1) {
				req.setAttribute("result", "탈퇴성공");

				//sDAO.setAllMsgCount(allMsgCount - msgCount);

				String path = req.getSession().getServletContext().getRealPath("resources/files");
//				String jm_photo = m.getM_photo();
//				jm_photo = URLDecoder.decode(jm_photo, "utf-8");
//				new File(path + "/" + jm_photo).delete();

				logout(req);
				loginCheck(req);
			} else {
				req.setAttribute("result", "탈퇴실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "탈퇴실패");
		}
		
	}

	public int getMemberNum(Member m, HttpServletRequest req) {
		//System.out.println(ss.getMapper(MemberMapper.class).getMemberNum(m));
		return ss.getMapper(Team1joinMapper.class).getMemberNum(m);
	}
	
	
	}
