package com.team12.main.team2board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

@Controller
public class BoardController {

	@Autowired
	private Team2BoardDAO bDAO;

	@RequestMapping(value = "team2.boardlist", method = RequestMethod.GET)
	public String boardList(HttpServletRequest req, Team2BoardDTO board) {

		bDAO.countPost(req, board);
		bDAO.showPostList(req, board);
		req.setAttribute("contentPage", "board_jsp/board_list.jsp");

		return "2Team/t2_index";
	}

	@RequestMapping(value = "team2.createPostPage", method = RequestMethod.GET)
	public String createPostPage(HttpServletRequest req, Team2BoardDTO board) {

		req.setAttribute("contentPage", "board_jsp/board_create.jsp");

		return "2Team/t2_index";
	}

	@RequestMapping(value = "team2.createPost", method = RequestMethod.POST)
	public String createPost(HttpServletRequest req, Team2BoardDTO board) {

		bDAO.countPost(req, board);
		bDAO.showPostList(req, board);
		bDAO.createPost(req, board);
		req.setAttribute("contentPage", "board_jsp/board_list.jsp");

		return "2Team/t2_index";
	}
	
	
	
	
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		
		return bDAO.uploadImg(multipartFile,request);
	}
	

}
