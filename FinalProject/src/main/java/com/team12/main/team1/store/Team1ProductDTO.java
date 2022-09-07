package com.team12.main.team1.store;


public class Team1ProductDTO {
	private int product_num; 
	private String product_category; 
	private String product_sub_category; 
	private String product_title; 
	private String product_title2; 
	private int product_price; 
	private int product_stock; 
	private String product_thumnail; 
	private String product_detail; 
	private String product_info;
	private String product_manufactor;
	
	public Team1ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public Team1ProductDTO(int product_num, String product_category, String product_sub_category, String product_title,
			String product_title2, int product_price, int product_stock, String product_thumnail, String product_detail,
			String product_info, String product_manufactor) {
		super();
		this.product_num = product_num;
		this.product_category = product_category;
		this.product_sub_category = product_sub_category;
		this.product_title = product_title;
		this.product_title2 = product_title2;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_thumnail = product_thumnail;
		this.product_detail = product_detail;
		this.product_info = product_info;
		this.product_manufactor = product_manufactor;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getProduct_category() {
		return product_category;
	}

	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}

	public String getProduct_sub_category() {
		return product_sub_category;
	}

	public void setProduct_sub_category(String product_sub_category) {
		this.product_sub_category = product_sub_category;
	}

	public String getProduct_title() {
		return product_title;
	}

	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}

	public String getProduct_title2() {
		return product_title2;
	}

	public void setProduct_title2(String product_title2) {
		this.product_title2 = product_title2;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}

	public String getProduct_thumnail() {
		return product_thumnail;
	}

	public void setProduct_thumnail(String product_thumnail) {
		this.product_thumnail = product_thumnail;
	}

	public String getProduct_detail() {
		return product_detail;
	}

	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}

	public String getProduct_info() {
		return product_info;
	}

	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}

	public String getProduct_manufactor() {
		return product_manufactor;
	}

	public void setProduct_manufactor(String product_manufactor) {
		this.product_manufactor = product_manufactor;
	}

	
	
	
	
	
	
}
