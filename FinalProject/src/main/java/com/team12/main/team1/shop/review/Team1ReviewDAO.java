package com.team12.main.team1.shop.review;


import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team12.main.team1.join.MemberDAO;

@Service
public class Team1ReviewDAO {

	@Autowired
	private SqlSession ss;
	
	private MemberDAO mDAO;
	
	// 전체 리뷰 보여주기
	public void showReviewList(HttpServletRequest req, Team1ReviewDTO review) {
		System.out.println("_-________________________");
		List<Team1ReviewDTO> reviews = ss.getMapper(Team1ReviewMapper.class).getReviewList(review);
		
			System.out.println("title:"+review.getReview_title());
		
		req.setAttribute("r", reviews);
	}

	//글쓰기
	
	public void writeReview(HttpServletRequest req, MultipartHttpServletRequest mr) {
		System.out.println("----------------------------------------------");


		String path =	req.getSession().getServletContext().getRealPath("resources/reviewFile");
		System.out.println("path :"+path);
		

		try {
			
			System.out.println(mr.getParameter("review_text"));
			System.out.println(mr.getParameter("review_title"));
			System.out.println(mr.getFile("review_img"));
			MultipartFile img = mr.getFile("review_img");
			System.out.println("파일이름 -------:"+img.getOriginalFilename());
			
			Map<String, String> review = new HashMap();
					   
			review.put("review_text", mr.getParameter("review_text"));
			review.put("review_title", mr.getParameter("review_title"));
			review.put("review_img", img.getOriginalFilename());
			
			
		//	File f = new File(path+"/"+img.getOriginalFilename());
			
			
			int a = ss.getMapper(Team1ReviewMapper.class).writeReview(review);
			
			if(a == 1) {
				System.out.println("등록성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
}


	
	

