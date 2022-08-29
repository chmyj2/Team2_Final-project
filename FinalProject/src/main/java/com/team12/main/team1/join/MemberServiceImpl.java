package com.team12.main.team1.join;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	
	@Inject
	private MemberDAO manager;
	
	@Autowired
	private SqlSession ss;
	
	
	// 아이디 중복 검사(AJAX)
		@Override
		public void check_id(String id, HttpServletResponse response, HttpServletRequest req, Member m) throws Exception {
			PrintWriter out = response.getWriter();
			out.println(manager.check_id(id));
			out.close();
		}

		// 이메일 중복 검사(AJAX)
		@Override
		public void check_email(String email, HttpServletResponse response, HttpServletRequest req, Member m) throws Exception {
			PrintWriter out = response.getWriter();
			out.println(manager.check_email(email));
			out.close();
		}
	
	
	// 아이디 찾기
		@Override
		public String find_id(HttpServletResponse response, String email, HttpServletRequest req, Member m) throws Exception {

			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			String id = manager.find_id(email);
			
	
			
//			ss.getMapper(Team1joinMapper.class).find_id(m) == 1
			
			if (id == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				req.getSession().setAttribute("loginMember", m);
				return null;
			} else {
				return id;
			}
		

		}

}
