package com.team12.main.team2board;

import java.util.List;

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
   // 게시글 리스트
	@RequestMapping(value = "team2.boardlist", method = RequestMethod.GET)
	public String boardList(HttpServletRequest req, Team2BoardDTO board) {
		lDAO.loginCheck(req);
		bDAO.showPostList(req, board);
		req.setAttribute("contentPage", "board_jsp/board_list.jsp");

		return "2Team/t2_index";
	}
    
	// 글쓰기 페이지
	@RequestMapping(value = "team2.createPostPage", method = RequestMethod.GET)
	public String createPostPage(HttpServletRequest req, Team2BoardDTO board) {
		lDAO.loginCheck(req);
		req.setAttribute("contentPage", "board_jsp/board_create.jsp");

		return "2Team/t2_index";
	}

	
	// 이미지 서버 업로드
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		
		return bDAO.uploadImg(multipartFile,request);
	}
	
	// 글쓰기 내용 db 업로드
	@RequestMapping(value = "team2.createPost", method = RequestMethod.POST)
	public String post_create(HttpServletRequest req, Team2BoardDTO board) {
		lDAO.loginCheck(req);
		bDAO.createPost(req, board); 
		bDAO.showPostList(req, board);
		req.setAttribute("contentPage", "board_jsp/board_list.jsp");

		return "2Team/t2_index";
	}


	// 글 디테일
	@RequestMapping(value = "post.detail", method = RequestMethod.GET)
	public String post_detail(HttpServletResponse res ,HttpServletRequest req, Team2BoardDTO board, Team2CommentDTO comment) {
		lDAO.loginCheck(req);
		if(bDAO.countCheck(req, board) == 0) {
			bDAO.updateCount(res ,req, board);
		}
		bDAO.showPostDetail(req, board);
		bDAO.getComment(req, board, comment);
		req.setAttribute("contentPage", "board_jsp/board_detail.jsp");

		return "2Team/t2_index";
	}
	// 글 삭제 
	@RequestMapping(value = "post.delete", method = RequestMethod.GET)
	public String post_delete(HttpServletRequest req, Team2BoardDTO board) {
		lDAO.loginCheck(req);
		bDAO.deletePost(req, board);
		bDAO.showPostList(req, board);
		req.setAttribute("contentPage", "board_jsp/board_list.jsp");
		return "2Team/t2_index";
	}
	// 글 수정 페이지
	@RequestMapping(value = "post.updatePage", method = RequestMethod.GET)
	public String post_updatePage(HttpServletRequest req, Team2BoardDTO board) {
		lDAO.loginCheck(req);
		bDAO.showPostDetail(req, board);
		req.setAttribute("contentPage", "board_jsp/board_update.jsp");
		return "2Team/t2_index";
	}
	// 글 수정 db 업로드
	@RequestMapping(value = "post.update", method = RequestMethod.POST)
	public String post_update(HttpServletRequest req, Team2BoardDTO board) {
		lDAO.loginCheck(req);
		bDAO.updatePost(req, board);
		bDAO.showPostDetail(req, board);
		req.setAttribute("contentPage", "board_jsp/board_detail.jsp");
		return "2Team/t2_index";
	}
	
	// 좋아요 카운트
	@RequestMapping(value="/post.like", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public int[] post_updatelike(Team2BoardLikeDTO t)  {
		return bDAO.updateLike(t);
	}
	// 좋아요 개수 얻기
	@RequestMapping(value="/post.checkLike", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public int post_checkLike(Team2BoardLikeDTO t)  {
		return bDAO.checkLike(t);
	}

///////////////////////////////////////////////////////댓글
	
	// 댓글 작성
	@RequestMapping(value="/comment.create", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public int comment_create(Team2CommentDTO t)  {
		return bDAO.createComment(t);
	}
	// 댓글 수정
	@RequestMapping(value="/comment.update", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public int comment_update(Team2CommentDTO t)  {
		return bDAO.updateComment(t);
	}
	
	// 댓글 10개 ajax 가져오기
	@RequestMapping(value="/comment.get", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public CommentsJson comment_get(Team2CommentDTO t, CommentsJson c)  {
		return bDAO.getCommentsJson(t,c);
	}
	
	// 댓글 삭제
	@RequestMapping(value="/comment.delete", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public int comment_delete(Team2CommentDTO t)  {
		return bDAO.deleteComment(t);
	}
	
	
	
	
	
	
	
	
	

}
