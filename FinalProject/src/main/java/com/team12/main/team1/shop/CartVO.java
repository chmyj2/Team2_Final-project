package com.team12.main.team1.shop;

import com.team12.main.team1.join.Member;

public class CartVO {
	
	private int cart_code; // 카트번호
	private String cart_mem_code; // 멤버정보
	private String cart_product_code; // 상품코드
	
	private int cart_product_count; // 수량
	private String cart_option;	// option 정보
	
	private Member member_ID;	// join Member_ID
	private ProductDTO product_code; //join NUM_PK
	
	private String cart_CKLimit; // 쿠키 제한시간
	private String cart_CK;	// 쿠키정보
	
//	---------------------------------------------
	public CartVO() {
		// TODO Auto-generated constructor stub
	}

	public CartVO(int cart_code, String cart_mem_code, String cart_product_code, int cart_product_count,
			String cart_option, Member member_ID, ProductDTO product_code, String cart_CKLimit, String cart_CK) {
		super();
		this.cart_code = cart_code;
		this.cart_mem_code = cart_mem_code;
		this.cart_product_code = cart_product_code;
		this.cart_product_count = cart_product_count;
		this.cart_option = cart_option;
		this.member_ID = member_ID;
		this.product_code = product_code;
		this.cart_CKLimit = cart_CKLimit;
		this.cart_CK = cart_CK;
	}

	public int getCart_code() {
		return cart_code;
	}

	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
	}

	public String getCart_mem_code() {
		return cart_mem_code;
	}

	public void setCart_mem_code(String cart_mem_code) {
		this.cart_mem_code = cart_mem_code;
	}

	public String getCart_product_code() {
		return cart_product_code;
	}

	public void setCart_product_code(String cart_product_code) {
		this.cart_product_code = cart_product_code;
	}

	public int getCart_product_count() {
		return cart_product_count;
	}

	public void setCart_product_count(int cart_product_count) {
		this.cart_product_count = cart_product_count;
	}

	public String getCart_option() {
		return cart_option;
	}

	public void setCart_option(String cart_option) {
		this.cart_option = cart_option;
	}

	public Member getMember_ID() {
		return member_ID;
	}

	public void setMember_ID(Member member_ID) {
		this.member_ID = member_ID;
	}

	public ProductDTO getProduct_code() {
		return product_code;
	}

	public void setProduct_code(ProductDTO product_code) {
		this.product_code = product_code;
	}

	public String getCart_CKLimit() {
		return cart_CKLimit;
	}

	public void setCart_CKLimit(String cart_CKLimit) {
		this.cart_CKLimit = cart_CKLimit;
	}

	public String getCart_CK() {
		return cart_CK;
	}

	public void setCart_CK(String cart_CK) {
		this.cart_CK = cart_CK;
	}

}
