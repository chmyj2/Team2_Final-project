package com.team12.main.team2board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team12.main.t2Login.LoginDAO;

@Controller
public class BoardController {

	@Autowired
	private Team2BoardDAO bDAO;
	
	@Autowired
	private LoginDAO lDAO;

	@RequestMapping(value = "team2.boardlist", method = RequestMethod.GET)
	public String boardList(HttpServletRequest req, Team2BoardDTO board) {
		lDAO.loginCheck(req);
		bDAO.showPostList(req, board);
		req.setAttribute("contentPage", "board_jsp/board_list.jsp");

		return "2Team/t2_index";
	}

	@RequestMapping(value = "team2.createPostPage", method = RequestMethod.GET)
	public String createPostPage(HttpServletRequest req, Team2BoardDTO board) {
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "board_jsp/board_create.jsp");

		return "2Team/t2_index";
	}

	
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		
		return bDAO.uploadImg(multipartFile,request);
	}
	
	
	@RequestMapping(value = "team2.createPost", method = RequestMethod.POST)
	public String post_create(HttpServletRequest req, Team2BoardDTO board) {
		lDAO.loginCheck(req);
		bDAO.createPost(req, board);
		bDAO.showPostList(req, board);
		req.setAttribute("contentPage", "board_jsp/board_list.jsp");

		return "2Team/t2_index";
	}


	
	@RequestMapping(value = "post.detail", method = RequestMethod.GET)
	public String post_detail(HttpServletResponse res ,HttpServletRequest req, Team2BoardDTO board) {
		lDAO.loginCheck(req);
		if(bDAO.countCheck(req, board) == 0) {
			bDAO.updateCount(res ,req, board);
		}
		bDAO.showPostDetail(req, board);
		req.setAttribute("contentPage", "board_jsp/board_detail.jsp");

		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "post.delete", method = RequestMethod.GET)
	public String post_delete(HttpServletRequest req, Team2BoardDTO board) {
		lDAO.loginCheck(req);
		bDAO.deletePost(req, board);
		bDAO.showPostList(req, board);
		req.setAttribute("contentPage", "board_jsp/board_list.jsp");
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "post.updatePage", method = RequestMethod.GET)
	public String post_updatePage(HttpServletRequest req, Team2BoardDTO board) {
		lDAO.loginCheck(req);
		bDAO.showPostDetail(req, board);
		req.setAttribute("contentPage", "board_jsp/board_update.jsp");
		return "2Team/t2_index";
	}
	
	@RequestMapping(value = "post.update", method = RequestMethod.POST)
	public String post_update(HttpServletRequest req, Team2BoardDTO board) {
		lDAO.loginCheck(req);
		bDAO.updatePost(req, board);
		bDAO.showPostDetail(req, board);
		req.setAttribute("contentPage", "board_jsp/board_detail.jsp");
		return "2Team/t2_index";
	}
	
	
	@RequestMapping(value="/post.like", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public int[] post_updatelike(Team2BoardLikeDTO t)  {
		return bDAO.updateLike(t);
	}
	
	@RequestMapping(value="/post.checkLike", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public int post_checkLike(Team2BoardLikeDTO t)  {
		return bDAO.checkLike(t);
	}
	
	
	
	
	

}
