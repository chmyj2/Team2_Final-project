package com.team12.main.team1.shop.review;

public class PagingCriteria {
	
	private int pageNum = 1; // 페이지 번호
	private int amount = 10; // 페이지당 데이터 갯수

	public PagingCriteria() {
		// TODO Auto-generated constructor stub
	}

	public PagingCriteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;	// 페이지 번호
		this.amount = amount;	// 페이지당 데이터 갯수
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "PagingCriteria [pageNum=" + pageNum + ", amount=" + amount + "]";
	}
	
}
