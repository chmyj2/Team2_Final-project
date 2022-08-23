package com.team12.main.t2.hospital;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team12.main.t2Login.LoginDAO;
import com.team12.main.t2Login.Membert2;

@Controller
public class HospitalController {

	@Autowired
	private LoginDAO lDAO;
	
	@Autowired
	private HospitalDAO HDAO;

	@RequestMapping(value = "/hospitalGo", method = RequestMethod.GET)
	public String hospitalGo(HttpServletRequest req) {

		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "sy/hospitalMain.jsp");
		
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "/hospitalDetailGo", method = RequestMethod.GET)
	public String hospitalDetailGo(HttpServletRequest req , HospitalDTO hDTO) {

		lDAO.loginCheck(req);
		HDAO.hospitalView(req,hDTO);
		
		req.setAttribute("contentPage", "sy/hospitalDetail.jsp");
		
		return "2Team/t2_index";

	}
	@RequestMapping(value = "/hospitalReserveGo", method = RequestMethod.GET)
	public String hospitalReserveGo(HttpServletRequest req , HospitalDTO hDTO,Membert2 m2) {
		
		lDAO.loginCheck(req);
		HDAO.hospitalView(req,hDTO);
		HDAO.petinfoView(req,m2);
		
		
		req.setAttribute("contentPage", "sy/hospitalReserve.jsp");
		
		return "2Team/t2_index";
	}
	@RequestMapping(value = "/hospitalReserveDo", method = RequestMethod.GET)
	public String hospitalReserveDo(HttpServletRequest req , reserveDTO rDTO) {
		
		lDAO.loginCheck(req);
		HDAO.hopitalReserve(req, rDTO);
	
		req.setAttribute("contentPage", "sy/hospitalReserveConfirm.jsp");
		
		return "2Team/t2_index";
	}
	@RequestMapping(value = "/hospitalReserveLookupgo", method = RequestMethod.GET)
	public String hospitalConfirmgo(HttpServletRequest req , reserveDTO rDTO ,Membert2 m2) {
		
		
		System.out.println("내기능"+m2.getMember_ID());
		lDAO.loginCheck(req);
		HDAO.hospitalReserveView(req,m2);
		req.setAttribute("contentPage", "sy/hospitalReserveLookup.jsp");
		
		return "2Team/t2_index";
	}


}