package com.team12.main.team2board;

public class PageDTO {

	private int rnStart;
	private int rnEnd;
	private String board_category;
	
	public PageDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getRnStart() {
		return rnStart;
	}

	public void setRnStart(int rnStart) {
		this.rnStart = rnStart;
	}

	public int getRnEnd() {
		return rnEnd;
	}

	public void setRnEnd(int rnEnd) {
		this.rnEnd = rnEnd;
	}

	public String getCategory() {
		return board_category;
	}

	public void setCategory(String category) {
		this.board_category = category;
	}

	public PageDTO(int rnStart, int rnEnd, String category) {
		super();
		this.rnStart = rnStart;
		this.rnEnd = rnEnd;
		this.board_category = category;
	}
	
	


	
}
