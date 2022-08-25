package com.team12.main.team1.shop.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.team12.main.team1.join.MemberDAO;
import com.team12.main.team2board.Team2BoardDTO;

@Controller
public class Team1ReviewController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private Team1ReviewDAO rDAO;

	
	// 전체 리뷰 보기
	@RequestMapping(value = "show.review", method = RequestMethod.GET)
	public String showReview(HttpServletRequest req, Team1ReviewDTO review) {
		
		mDAO.loginCheck(req);
		rDAO.showReviewList(req, review);
		req.setAttribute("contentPage", "ShopPageYUJIN/team1shopProductDetail.jsp");
		
		return "1Team/t1_index";
	}
	
	
	//	리뷰 쓰기
	@RequestMapping(value = "write.review1", method = RequestMethod.POST)
	public String writeReview(HttpServletRequest req, MultipartHttpServletRequest mr) {
		mDAO.loginCheck(req);
		rDAO.writeReview(req, mr);
//		rDAO.showReviewList(req, review);
//		rDAO.showAllReviewCnt(req);
		req.setAttribute("contentPage", "ShopPageYUJIN/team1shopProductDetail.jsp");
		
		return "1Team/t1_index";
	}
	
	// 리뷰 삭제하기
	
	@RequestMapping(value = "review.delete", method = RequestMethod.GET)
	public String reviewDelete(HttpServletRequest req, Team1ReviewDTO review) {
	
		mDAO.loginCheck(req);
		rDAO.deleteReview(req, review);
		rDAO.showReviewList(req, review);
		
		req.setAttribute("contentPage", "ShopPageYUJIN/team1shopProductDetail.jsp");
		
		return "1Team/t1_index";
	}
	
	// 리뷰 수정하기
	@RequestMapping(value = "review.update", method = RequestMethod.GET)
	public String reviewUpdate(HttpServletRequest req, Team1ReviewDTO review) {
	
		mDAO.loginCheck(req);
		rDAO.updateReview(req, review);
		rDAO.showReviewList(req, review);
		
		req.setAttribute("contentPage", "ShopPageYUJIN/team1shopProductDetail.jsp");
		
		return "1Team/t1_index";
	}
	
	
	
	
}
