package com.team12.main.team2board;

import java.util.List;

public interface Team2BoardMapper {

	int getAllpostCount(Team2BoardDTO board);

	List<Team2BoardDTO> getPostList(Team2BoardDTO board);

	int writePost(Team2BoardDTO board);

	Team2BoardDTO postDetail(Team2BoardDTO board);

	int deletePost(Team2BoardDTO board);

	int updatepost(Team2BoardDTO board);

	int updatecount(Team2BoardDTO board);

	int checkLike(Team2BoardLikeDTO t);

	void countUpTotalLike(Team2BoardLikeDTO t);

	void countDownTotalLike(Team2BoardLikeDTO t);
	
	void insertInfoLike(Team2BoardLikeDTO t);

	Team2BoardLikeDTO getTotalLike(Team2BoardLikeDTO t);

	void deleteInfoLike(Team2BoardLikeDTO t);

	int createcomment(Team2CommentDTO t);

	List<Team2CommentDTO> getcomment(Team2CommentDTO comment);

	int getTotalCommentCount(Team2CommentDTO comment);

	List<CommentBean> getcommentJson(Team2CommentDTO t);

	int deletecomment(Team2CommentDTO t);

	int updatecomment(Team2CommentDTO t);

	Team2CommentDTO getCommentNum(Team2CommentDTO t);

	Team2BoardDTO getImgsName(Team2BoardDTO board);

	




}
