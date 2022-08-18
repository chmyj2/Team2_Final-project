package com.team12.main.t2.hospital;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team12.main.t2Login.LoginDAO;

@Controller
public class HospitalController {

	@Autowired
	private LoginDAO lDAO;
	
	@Autowired
	private HospitalDAO HDAO;

	@RequestMapping(value = "/hospitalGo", method = RequestMethod.GET)
	public String hospitalGo(HttpServletRequest req) {

		//lDAO.loginCheck(req);
		req.setAttribute("contentPage", "sy/hospitalMain.jsp");
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/hospitalDetailGo", method = RequestMethod.GET)
	public String hospitalDetailGo(HttpServletRequest req , HospitalDTO hDTO) {

		//lDAO.loginCheck(req);
		System.out.println("와라");
		HDAO.hospitalView(req,hDTO);

		req.setAttribute("contentPage", "sy/hospitalDetail.jsp");
		
		return "2Team/t2_index";

	}
	@RequestMapping(value = "/hospitalReserveGo", method = RequestMethod.GET)
	public String hospitalReserveGo(HttpServletRequest req , HospitalDTO hDTO) {
		
		//lDAO.loginCheck(req);
		HDAO.hospitalView(req,hDTO);
		
		req.setAttribute("contentPage", "sy/hospitalReserve.jsp");
		
		return "2Team/t2_index";
	}


}