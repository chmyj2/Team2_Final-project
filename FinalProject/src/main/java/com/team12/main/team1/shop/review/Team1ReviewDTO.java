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

	public Team1ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public Team1ReviewDTO(int review_num, String review_id, String review_title, String review_txt, Date review_date,
			String review_img, int review_star) {
		super();
		this.review_num = review_num;
		this.review_id = review_id;
		this.review_title = review_title;
		this.review_txt = review_txt;
		this.review_date = review_date;
		this.review_img = review_img;
		this.review_star = review_star;
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
	
	
	
}
