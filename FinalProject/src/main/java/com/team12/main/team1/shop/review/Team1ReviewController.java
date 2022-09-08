package com.team12.main.team1.shop.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.team12.main.team1.join.MemberDAO;
import com.team12.main.team1.store.Team1ProductDAO;
import com.team12.main.team1.store.Team1ProductDTO;
import com.team12.main.team2board.Team2BoardDTO;
import com.team12.main.team2board.Team2CommentDTO;

@Controller
public class Team1ReviewController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private Team1ReviewDAO rDAO;
	
	@Autowired
	private Team1ProductDAO mpDAO;
	

	
	// 전체 리뷰 보기
	@RequestMapping(value = "show.review", method = RequestMethod.GET)
	public String showReview(HttpServletRequest req, Team1ReviewDTO review) {
		
		mDAO.loginCheck(req);
		rDAO.showReviewList(req, review);
		req.setAttribute("contentPage", "master/team1shopProductDetail.jsp");
		
		return "1Team/t1_index";
	}
	
	
	//	리뷰 쓰기
	@RequestMapping(value = "write.review1", method = RequestMethod.POST)
	public String writeReview(HttpServletRequest req, MultipartHttpServletRequest mr, Team1ProductDTO p) {
		mDAO.loginCheck(req);
		rDAO.writeReview(req, mr);
//		rDAO.showReviewList(req, review);
		req.setAttribute("contentPage", "master/team1shopProductDetail.jsp");
		
		return "1Team/t1_index";
	}
	
	// 리뷰 삭제하기
	
	@RequestMapping(value = "review.delete", method = RequestMethod.GET)
	public String reviewDelete(HttpServletRequest req, Team1ReviewDTO review) {
	
		mDAO.loginCheck(req);
		rDAO.deleteReview(req, review);
		rDAO.showReviewList(req, review);
		
		req.setAttribute("contentPage", "master/team1shopProductDetail.jsp");
		
		return "1Team/t1_index";
	}
	
/*	// 리뷰 수정하기
	@RequestMapping(value = "review.update", method = RequestMethod.GET)
	public String reviewUpdate(HttpServletRequest req, Team1ReviewDTO review) {
	
		mDAO.loginCheck(req);
		rDAO.updateReview(req, review);
		rDAO.showReviewList(req, review);
		
		req.setAttribute("contentPage", "ShopPageYUJIN/team1shopProductDetail.jsp");
		
		return "1Team/t1_index";
	}*/
	
	// 리뷰 추천순 정렬
	@RequestMapping(value = "review.orderBy", method = RequestMethod.GET)
	public String reviewOrderBy(HttpServletRequest req, Team1ReviewDTO review) {
	
		mDAO.loginCheck(req);
		System.out.println("1111");
		rDAO.reviewOrderBy(req, review);
		System.out.println("2222");
		rDAO.showReviewList(req, review);
		System.out.println("머고정렬을해라...");
		
		req.setAttribute("contentPage", "master/team1shopProductDetail.jsp");
		
		return "1Team/t1_index";
	}
	
	// 리뷰 수정
	
	@RequestMapping(value="/review.update", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public int review_update(Team1ReviewDTO r)  {
		return rDAO.updateReview(r);
	}
	
	
	
}
