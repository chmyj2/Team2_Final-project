package com.team12.main.team2board;

import java.util.List;

public class ChildCommentJson {
	
	private List<Team2ChildCommentDTO> ChildComments;
	
	public ChildCommentJson() {
		// TODO Auto-generated constructor stub
	}
	public List<Team2ChildCommentDTO> getChildComments() {
		return ChildComments;
	}
	public void setChildComments(List<Team2ChildCommentDTO> childComments) {
		ChildComments = childComments;
	}
	public ChildCommentJson(List<Team2ChildCommentDTO> childComments) {
		super();
		ChildComments = childComments;
	}
	
}
