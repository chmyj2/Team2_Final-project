package com.team12.main.team1.join;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	
	@Inject
	private MemberDAO manager;
	
	
	// 아이디 찾기
		@Override
		public String find_id(HttpServletResponse response, String email) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			String id = manager.find_id(email);
			
			if (id == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			} else {
				return id;
			}
		}

}
