package com.team12.main.team2board;


public class CommentBean {
	
	private int comment_num;
	private int comment_board_num;
	private String comment_member_id;
	private String comment_txt;
	private String comment_date;
	
	public CommentBean() {
		// TODO Auto-generated constructor stub
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public int getComment_board_num() {
		return comment_board_num;
	}

	public void setComment_board_num(int comment_board_num) {
		this.comment_board_num = comment_board_num;
	}

	public String getComment_member_id() {
		return comment_member_id;
	}

	public void setComment_member_id(String comment_member_id) {
		this.comment_member_id = comment_member_id;
	}

	public String getComment_txt() {
		return comment_txt;
	}

	public void setComment_txt(String comment_txt) {
		this.comment_txt = comment_txt;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}

	public CommentBean(int comment_num, int comment_board_num, String comment_member_id, String comment_txt,
			String comment_date) {
		super();
		this.comment_num = comment_num;
		this.comment_board_num = comment_board_num;
		this.comment_member_id = comment_member_id;
		this.comment_txt = comment_txt;
		this.comment_date = comment_date;
	}


	
}
