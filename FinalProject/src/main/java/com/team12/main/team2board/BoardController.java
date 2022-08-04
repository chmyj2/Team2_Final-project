package com.team12.main.team2board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

@RequestMapping(value = "team2.boardlist", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
	
	  req.setAttribute("contentPage", "2Team/board_jsp/board_list.jsp");
	  return "2Team/t2_index";
		
	}
	
}
