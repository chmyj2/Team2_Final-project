package com.team12.main.team1.shop.review;

import java.util.Date;

public class Team1ReviewDTO {
	
	private int review_num;
	private String review_id;
	private String review_title;
	private String review_txt;
	private Date review_date;
	private String review_img;
	private int review_star;
	private int start_data;
	private int end_data;
	private int page;
	private int array;
	

	public Team1ReviewDTO() {
		// TODO Auto-generated constructor stub
	}


	public Team1ReviewDTO(int review_num, String review_id, String review_title, String review_txt, Date review_date,
			String review_img, int review_star, int start_data, int end_data, int page, int array) {
		super();
		this.review_num = review_num;
		this.review_id = review_id;
		this.review_title = review_title;
		this.review_txt = review_txt;
		this.review_date = review_date;
		this.review_img = review_img;
		this.review_star = review_star;
		this.start_data = start_data;
		this.end_data = end_data;
		this.page = page;
		this.array = array;
	}


	public int getReview_num() {
		return review_num;
	}


	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}


	public String getReview_id() {
		return review_id;
	}


	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}


	public String getReview_title() {
		return review_title;
	}


	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}


	public String getReview_txt() {
		return review_txt;
	}


	public void setReview_txt(String review_txt) {
		this.review_txt = review_txt;
	}


	public Date getReview_date() {
		return review_date;
	}


	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}


	public String getReview_img() {
		return review_img;
	}


	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}


	public int getReview_star() {
		return review_star;
	}


	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}


	public int getStart_data() {
		return start_data;
	}


	public void setStart_data(int start_data) {
		this.start_data = start_data;
	}


	public int getEnd_data() {
		return end_data;
	}


	public void setEnd_data(int end_data) {
		this.end_data = end_data;
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getArray() {
		return array;
	}


	public void setArray(int array) {
		this.array = array;
	}


	
	


	
	
	
	
	
}
