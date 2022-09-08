package com.team12.main.team1.join;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MemberService {


	String find_id(HttpServletResponse response, String email, HttpServletRequest req) throws Exception;



}
