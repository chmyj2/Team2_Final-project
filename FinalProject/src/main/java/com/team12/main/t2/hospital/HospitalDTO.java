package com.team12.main.t2.hospital;

public class HospitalDTO {
	
	

	private String hospital_no;
	private int hospital_stateNo;
	private String hospital_state;
	private String hospital_tel;
	private String hospital_addr;
	private String hospital_addr2;
	private int hospital_postNo;
	private String hospital_name;

	public HospitalDTO() {
		// TODO Auto-generated constructor stub
	}


	public HospitalDTO(String hospital_no, int hospital_stateNo, String hospital_state, String hospital_tel,
			String hospital_addr, String hospital_addr2, int hospital_postNo, String hospital_name) {
		super();
		this.hospital_no = hospital_no;
		this.hospital_stateNo = hospital_stateNo;
		this.hospital_state = hospital_state;
		this.hospital_tel = hospital_tel;
		this.hospital_addr = hospital_addr;
		this.hospital_addr2 = hospital_addr2;
		this.hospital_postNo = hospital_postNo;
		this.hospital_name = hospital_name;
	}

	public String getHospital_no() {
		return hospital_no;
	}

	public void setHospital_no(String hospital_no) {
		this.hospital_no = hospital_no;
	}

	public int getHospital_stateNo() {
		return hospital_stateNo;
	}

	public void setHospital_stateNo(int hospital_stateNo) {
		this.hospital_stateNo = hospital_stateNo;
	}

	public String getHospital_state() {
		return hospital_state;
	}

	public void setHospital_state(String hospital_state) {
		this.hospital_state = hospital_state;
	}

	public String getHospital_tel() {
		return hospital_tel;
	}

	public void setHospital_tel(String hospital_tel) {
		this.hospital_tel = hospital_tel;
	}

	public String getHospital_addr() {
		return hospital_addr;
	}

	public void setHospital_addr(String hospital_addr) {
		this.hospital_addr = hospital_addr;
	}

	public String getHospital_addr2() {
		return hospital_addr2;
	}

	public void setHospital_addr2(String hospital_addr2) {
		this.hospital_addr2 = hospital_addr2;
	}

	public int getHospital_postNo() {
		return hospital_postNo;
	}

	public void setHospital_postNo(int hospital_postNo) {
		this.hospital_postNo = hospital_postNo;
	}

	public String getHospital_name() {
		return hospital_name;
	}

	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}

	
	

}
