package com.team12.main.t2Login;

import java.util.Date;

public class vet {
	private String vet_ID;
	private String vet_PW;
	private String vet_businessNum;
	private String vet_address;
	private String vet_phoneNum;
	private Date vet_joinDate;
	
	public vet() {
		// TODO Auto-generated constructor stub
	}

	public vet(String vet_ID, String vet_PW, String vet_businessNum, String vet_address, String vet_phoneNum,
			Date vet_joinDate) {
		super();
		this.vet_ID = vet_ID;
		this.vet_PW = vet_PW;
		this.vet_businessNum = vet_businessNum;
		this.vet_address = vet_address;
		this.vet_phoneNum = vet_phoneNum;
		this.vet_joinDate = vet_joinDate;
	}

	public String getVet_ID() {
		return vet_ID;
	}

	public void setVet_ID(String vet_ID) {
		this.vet_ID = vet_ID;
	}

	public String getVet_PW() {
		return vet_PW;
	}

	public void setVet_PW(String vet_PW) {
		this.vet_PW = vet_PW;
	}

	public String getVet_businessNum() {
		return vet_businessNum;
	}

	public void setVet_businessNum(String vet_businessNum) {
		this.vet_businessNum = vet_businessNum;
	}

	public String getVet_address() {
		return vet_address;
	}

	public void setVet_address(String vet_address) {
		this.vet_address = vet_address;
	}

	public String getVet_phoneNum() {
		return vet_phoneNum;
	}

	public void setVet_phoneNum(String vet_phoneNum) {
		this.vet_phoneNum = vet_phoneNum;
	}

	public Date getVet_joinDate() {
		return vet_joinDate;
	}

	public void setVet_joinDate(Date vet_joinDate) {
		this.vet_joinDate = vet_joinDate;
	}
	
	
}
