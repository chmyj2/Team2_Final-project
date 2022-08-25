package com.team12.main.team1.shop.review;

public class PageMaker {

	private int startPage; // 시작페이지
	private int endPage;	// 끝 페이지
	private boolean prev;	// 이전
	private boolean next;	// 다음
	
	private PagingCriteria cri;
	
	public PageMaker(PagingCriteria cri,int total){
		this.cri = cri;
		//Math.ceil 올림
		
		// 전체 마지막 페이지
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		//마지막 페이지
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0) * 10);
		//시작 페이지
		this.startPage = getEndPage()-9;
		// 전체 마지막 페이지
		if(realEnd < this.endPage) {
			this.endPage=realEnd;
		}
		
		this.next = getEndPage() < realEnd;
		this.prev = getStartPage()>1;
		
	}
	
	public PagingCriteria getCri() {
		return cri;
	}

	public void setCri(PagingCriteria cri) {
		this.cri = cri;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	@Override
	public String toString() {
		return "PageMaker [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + "]";
	}
	
	
	
}
