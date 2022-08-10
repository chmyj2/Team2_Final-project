package com.team12.main.team2board;

public class Team2BoardLikeDTO {
	
	private int like_board_num;
	private String like_member_id;
	private int board_like;
	
	public Team2BoardLikeDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getLike_board_num() {
		return like_board_num;
	}

	public void setLike_board_num(int like_board_num) {
		this.like_board_num = like_board_num;
	}

	public String getLike_member_id() {
		return like_member_id;
	}

	public void setLike_member_id(String like_member_id) {
		this.like_member_id = like_member_id;
	}

	public int getBoard_like() {
		return board_like;
	}

	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}

	public Team2BoardLikeDTO(int like_board_num, String like_member_id, int board_like) {
		super();
		this.like_board_num = like_board_num;
		this.like_member_id = like_member_id;
		this.board_like = board_like;
	}


	
	
}
