package com.team12.main.team1.join;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberjoinDAO {
	
	@Autowired
	private SqlSession ss;

	public void join(Member m, HttpServletRequest req) {
		// TODO Auto-generated method stub
		
		String path = req.getSession().getServletContext().getRealPath("resources/files"); // 이미지 경로
		MultipartRequest mr = null;
		try {
			
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			
			String practice_member_detail_num = mr.getParameter("member_detail_num");
			String practice_member_name = mr.getParameter("member_name");
			String practice_member_bitrh = mr.getParameter("member_birth");
			String practice_member_sex = mr.getParameter("member_sex");
			String practice_member_phoneNum = mr.getParameter("member_phoneNum");
			
			String practice_member_Address1 = mr.getParameter("member_Address1");
			String practice_member_Address2 = mr.getParameter("member_Address2");
			String practice_member_Address3 = mr.getParameter("member_Address3");
			
			String practice_member_Address = practice_member_Address1 + "!" + practice_member_Address2 + "!" + practice_member_Address3;
			
//			String practice_member_Address = mr.getParameter("member_Address");
			String practice_member_eMail = mr.getParameter("member_eMail");
			String practice_member_joinDate = mr.getParameter("member_joinDate");
			String practice_member_paper = mr.getParameter("member_paper");
			
			m.setMember_detail_num(practice_member_detail_num);
			m.setMember_name(practice_member_name);
			m.setMember_birth(practice_member_bitrh);
			m.setMember_sex(practice_member_sex);
			m.setMember_phoneNum(practice_member_phoneNum);
			m.setMember_Address(practice_member_Address);
			m.setMember_eMail(practice_member_eMail);
//			m.setMember_joinDate(practice_member_joinDate);
			m.setMember_paper(practice_member_paper);
			
			if (ss.getMapper(Team1joinMapper.class).join(m) == 1) {
				req.setAttribute("result", "가입성공");
			}else {
				req.setAttribute("result", "가입실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
			req.setAttribute("result", "가입실패");
		}
		
		
		
	}

}
