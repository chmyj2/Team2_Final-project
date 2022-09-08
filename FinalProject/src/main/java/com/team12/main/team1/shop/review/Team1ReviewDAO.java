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
	
	@Autowired
	private MemberDAO mDAO;
	
	
	// 전체 리뷰 보여주기
	public void showReviewList(HttpServletRequest req, Team1ReviewDTO review) {
		
		int page = review.getPage();
		
		if(page == 0) {
			page = 1;
		}
		
		// 보여주고 싶은 리뷰 수
		int cnt = 5;
		// 총 리뷰 수
		int allReview = ss.getMapper(Team1ReviewMapper.class).getAllReviewCnt(review);
		req.setAttribute("p", allReview);
		
		System.out.println("댓글 합 ---------"+allReview);
		// 총 페이지 수
		int totalPage = (int) Math.ceil((double)allReview / cnt);
		req.setAttribute("pageCount", totalPage);
		
		
		// 총데이터 수 - (한페이지당보여줄개수 * (페이지번호 - 1));
		
		int start = (page - 1) * cnt + 1;
	
		// (페이지번호 == 총페이지수) ? 총데이터수 : 시작데이터번호 + 한페이지당보여줄 개수 -1;
		int end = (page == totalPage) ? allReview  : start + cnt - 1 ;
		
		review.setStart_data(start);
		review.setEnd_data(end);
		
		if(page == 1) {
			review.setStart_data(1);
			review.setEnd_data(5);
		}
		
		List<Team1ReviewDTO> reviews = ss.getMapper(Team1ReviewMapper.class).getReviewList(review);
		req.setAttribute("r", reviews);
		
		
	}

	
	//글쓰기
	
	public void writeReview(HttpServletRequest req, MultipartHttpServletRequest mr ) {

		String path = req.getSession().getServletContext().getRealPath("resources/reviewFile");
		System.out.println("path :"+path);
		
		try {
			System.out.println(mr.getParameter("review_text"));
			System.out.println(mr.getParameter("review_title"));
			System.out.println(mr.getFile("review_img"));
			System.out.println(mr.getParameter("review_star"));
			MultipartFile img = mr.getFile("review_img");
			System.out.println("파일이름 -------:"+img.getOriginalFilename());
			
			
			Map<String, String> review = new HashMap();
			
			review.put("review_title", mr.getParameter("review_title"));
			review.put("review_img", img.getOriginalFilename());
			review.put("review_text", mr.getParameter("review_text"));
			review.put("review_star", mr.getParameter("review_star"));
			
			
			File f = new File(path+"/"+img.getOriginalFilename());
//			f.createNewFile();
			img.transferTo(f);
			
			int a = ss.getMapper(Team1ReviewMapper.class).writeReview(review);
			
			if(a == 1) {
				System.out.println("등록성공");
			} else {
				System.out.println("등록실패");
		
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	// 게시글 삭제
	public void deleteReview(HttpServletRequest req, Team1ReviewDTO review) {
		if (ss.getMapper(Team1ReviewMapper.class).deleteReview(review) == 1) {
			System.out.println("삭제성공");
		} else {
			System.out.println("삭제실패");
		}
	}
	
	
	// 리뷰글 개수
/*	public void showAllReviewCnt(HttpServletRequest req) {
	int a = ss.getMapper(Team1ReviewMapper.class).getAllReview();
		req.setAttribute("p", a);	
		System.out.println(a);
	
	}*/

	// 리뷰글 평점 평균
	public void showAllReviewAvg(HttpServletRequest req) {


        double avg = ss.getMapper(Team1ReviewMapper.class).getAllReviewAvg();
        String result = String.format("%.1f", avg); 
        req.setAttribute("avg", result );
        System.out.println(result);

    }


		

	// 리뷰 글 수정
	public void updateReview(HttpServletRequest req, Team1ReviewDTO review) {
		String update = ss.getMapper(Team1ReviewMapper.class).updateReview(review);
		System.out.println("수정완료!" + update);

		
	}




	
	
	
}


	
	

