package com.team12.main.t2.hospital;

public class HospitalDTO {
	
	
	private int hopital_no;
	private int hopital_stateNo;
	private String hopital_state;
	private String hopital_tel;
	private String hopital_addr;
	private String hopital_addr2;
	private int hopital_postNo;
	private String hopital_name;
	
	public HospitalDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	

	public HospitalDTO(int hopital_no, int hopital_stateNo, String hopital_state, String hopital_tel,
			String hopital_addr, String hopital_addr2, int hopital_postNo, String hopital_name) {
		super();
		this.hopital_no = hopital_no;
		this.hopital_stateNo = hopital_stateNo;
		this.hopital_state = hopital_state;
		this.hopital_tel = hopital_tel;
		this.hopital_addr = hopital_addr;
		this.hopital_addr2 = hopital_addr2;
		this.hopital_postNo = hopital_postNo;
		this.hopital_name = hopital_name;
	}




	public int getHopital_no() {
		return hopital_no;
	}

	public void setHopital_no(int hopital_no) {
		this.hopital_no = hopital_no;
	}

	public int getHopital_stateNo() {
		return hopital_stateNo;
	}

	public void setHopital_stateNo(int hopital_stateNo) {
		this.hopital_stateNo = hopital_stateNo;
	}

	public String getHopital_state() {
		return hopital_state;
	}

	public void setHopital_state(String hopital_state) {
		this.hopital_state = hopital_state;
	}

	public String getHopital_tel() {
		return hopital_tel;
	}

	public void setHopital_tel(String hopital_tel) {
		this.hopital_tel = hopital_tel;
	}

	public String getHopital_addr() {
		return hopital_addr;
	}

	public void setHopital_addr(String hopital_addr) {
		this.hopital_addr = hopital_addr;
	}

	public String getHopital_addr2() {
		return hopital_addr2;
	}

	public void setHopital_addr2(String hopital_addr2) {
		this.hopital_addr2 = hopital_addr2;
	}

	public int getHopital_postNo() {
		return hopital_postNo;
	}

	public void setHopital_postNo(int hopital_postNo) {
		this.hopital_postNo = hopital_postNo;
	}

	public String getHopital_name() {
		return hopital_name;
	}

	public void setHopital_name(String hopital_name) {
		this.hopital_name = hopital_name;
	}
	
	
	

}
