package com.team12.main.t2.hospital;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 예약확인 용
	@RequestMapping(value = "/hospitalReserveLookupgo", method = RequestMethod.GET)
	public String hospitalConfirmgo(HttpServletRequest req , reserveDTO rDTO ,Membert2 m2) {
		
		lDAO.loginCheck(req);
		HDAO.hospitalReserveView(req,m2);
		req.setAttribute("contentPage", "sy/hospitalReserveLookup.jsp");
		
		return "2Team/t2_index";
	}
	
	//예약취소 팝업창
	@RequestMapping(value="/reserveCanclego")
	public String urlMethod(HttpServletRequest req , Membert2 m2 , reserveDTO rDTO) throws Exception {		
	
		lDAO.loginCheck(req);
		
		
		return "2Team/sy/hospitalReserveCancle";
	}
	
	//예약취소 비밀번호확인용
	@RequestMapping(value = "/reservePw.check", method = RequestMethod.GET)
	public @ResponseBody String reservecheckPW(Membert2 m2) {
		
		return HDAO.hospitalReservePWCheck(m2);
	}
	
	// 예약취소 취소 
	@RequestMapping(value = "/hospitalReserveCancleDo", method = RequestMethod.GET)
	public void hospitalReserveCancleDo(HttpServletRequest req ,Membert2 m2 ,reserveDTO rDTO) {
		
		
		lDAO.loginCheck(req);
		HDAO.hospitalReserveCancle(req,rDTO);
	
	}
	
	
	



}