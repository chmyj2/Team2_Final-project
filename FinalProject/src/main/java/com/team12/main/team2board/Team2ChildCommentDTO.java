package com.team12.main.team2board;

import java.util.Date;

public class Team2ChildCommentDTO {
	private int c_child_num;
	private int c_child_board_num;
	private String c_child_member_id;
	private int c_child_parent_num;
	private String c_child_txt;
	private String c_child_date;
	
	public Team2ChildCommentDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getC_child_num() {
		return c_child_num;
	}

	public void setC_child_num(int c_child_num) {
		this.c_child_num = c_child_num;
	}

	public int getC_child_board_num() {
		return c_child_board_num;
	}

	public void setC_child_board_num(int c_child_board_num) {
		this.c_child_board_num = c_child_board_num;
	}

	public String getC_child_member_id() {
		return c_child_member_id;
	}

	public void setC_child_member_id(String c_child_member_id) {
		this.c_child_member_id = c_child_member_id;
	}

	public int getC_child_parent_num() {
		return c_child_parent_num;
	}

	public void setC_child_parent_num(int c_child_parent_num) {
		this.c_child_parent_num = c_child_parent_num;
	}

	public String getC_child_txt() {
		return c_child_txt;
	}

	public void setC_child_txt(String c_child_txt) {
		this.c_child_txt = c_child_txt;
	}

	public String getC_child_date() {
		return c_child_date;
	}

	public void setC_child_date(String c_child_date) {
		this.c_child_date = c_child_date;
	}

	public Team2ChildCommentDTO(int c_child_num, int c_child_board_num, String c_child_member_id,
			int c_child_parent_num, String c_child_txt, String c_child_date) {
		super();
		this.c_child_num = c_child_num;
		this.c_child_board_num = c_child_board_num;
		this.c_child_member_id = c_child_member_id;
		this.c_child_parent_num = c_child_parent_num;
		this.c_child_txt = c_child_txt;
		this.c_child_date = c_child_date;
	}
	
	
	
}
