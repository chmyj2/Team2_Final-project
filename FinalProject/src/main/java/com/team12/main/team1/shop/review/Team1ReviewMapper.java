package com.team12.main.team1.shop.review;

import java.util.List;
import java.util.Map;

public interface Team1ReviewMapper {
	
	// 전체 리뷰 보여주기
	public List<Team1ReviewDTO> getReviewList(Team1ReviewDTO review);
	public Team1ReviewDTO showReview(Team1ReviewDTO review);
	
	public int getAllReviewCnt(Team1ReviewDTO review);
	// 리뷰 쓰기
	public int writeReview(Map<String, String> review);
	
	// 리뷰 삭제하기
	int deleteReview(Team1ReviewDTO review);


	

}
