package com.team12.main.team2board;

import java.util.List;

public class CommentsJson {
	private List<CommentBean> comments;
	
	public CommentsJson() {
		// TODO Auto-generated constructor stub
	}

	public List<CommentBean> getComments() {
		return comments;
	}

	public void setComments(List<CommentBean> comments) {
		this.comments = comments;
	}

	public CommentsJson(List<CommentBean> comments) {
		super();
		this.comments = comments;
	}
	
}
