package com.team12.main.t2.shop;

public class PagingDTO {

	
	private int nowPage;
    private int startPage;
    private int endPage;
    private int total;
    private int cntPerPage;
    private int lastPage;
    private int start;
    private int end;
    private int cntPage = 16;
    
    
    public PagingDTO() {
		// TODO Auto-generated constructor stub
	}
    
    
    public PagingDTO(int total, int nowPage, int cntPerPage) {
        setNowPage(nowPage);
        setCntPerPage(cntPerPage);
        setTotal(total);
        calcLastPage(getTotal(), getCntPerPage());
        calcStartEndPage(getNowPage(), cntPage);
        calcStartEnd(getNowPage(), getCntPerPage());
    }

    // 제일 마지막 페이지 계산
    public void calcLastPage(int total, int cntPerPage) {
        setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
    }

    // 시작, 끝 페이지 계산
    public void calcStartEndPage(int nowPage, int cntPage) {
        setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
        if (getLastPage() < getEndPage()) {
            setEndPage(getLastPage());
        }
        setStartPage(getEndPage() - cntPage + 1);
        if(getStartPage() < 1) {
            setStartPage(1);
        }
    }

    // DB 쿼리에서 사용할 start, end 값 계산
    public void calcStartEnd(int nowPage, int cntPerPage) {
        setEnd(nowPage * cntPerPage);
        setStart(getEnd() - cntPerPage + 1);
    }





	public PagingDTO(int nowPage, int startPage, int endPage, int total, int cntPerPage, int lastPage, int start,
			int end, int cntPage) {
		super();
		this.nowPage = nowPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.total = total;
		this.cntPerPage = cntPerPage;
		this.lastPage = lastPage;
		this.start = start;
		this.end = end;
		this.cntPage = cntPage;
	}





	public int getNowPage() {
		return nowPage;
	}





	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
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





	public int getTotal() {
		return total;
	}





	public void setTotal(int total) {
		this.total = total;
	}





	public int getCntPerPage() {
		return cntPerPage;
	}





	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}





	public int getLastPage() {
		return lastPage;
	}





	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}





	public int getStart() {
		return start;
	}





	public void setStart(int start) {
		this.start = start;
	}





	public int getEnd() {
		return end;
	}





	public void setEnd(int end) {
		this.end = end;
	}





	public int getCntPage() {
		return cntPage;
	}





	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
    
    
    
	
	
}
