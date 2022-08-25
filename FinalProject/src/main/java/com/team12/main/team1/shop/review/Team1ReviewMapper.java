package com.team12.main.team1.shop.review;

import java.util.List;
import java.util.Map;

public interface Team1ReviewMapper {
	
	// 전체 리뷰 보여주기
	 List<Team1ReviewDTO> getReviewList(Team1ReviewDTO review);
	 Team1ReviewDTO showReview(Team1ReviewDTO review);
	
	 int getAllReviewCnt(Team1ReviewDTO review);
	// 리뷰 쓰기
	 int writeReview(Map<String, String> review);
	
	// 리뷰 삭제하기
	int deleteReview(Team1ReviewDTO review);
	
	// 전체 리뷰 갯수 구하기
//	int getAllReview();
	int getAllReview(Team1ReviewDTO review);
	
	// 전체 별점 평균 구하기
	double getAllReviewAvg();

//	int getAllReviewAvg();
	
	// 리뷰 수정하기
	String updateReview(Team1ReviewDTO review);

	
	


	

}
