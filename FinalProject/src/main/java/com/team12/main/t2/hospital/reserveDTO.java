package com.team12.main.t2.hospital;

import java.util.Date;

public class reserveDTO {

	private int reserve_no; 
	private String reserve_hospitalNo;
	private String reserve_hospitalName;
 	private String reserve_memberID;		
	private String reserve_memberName;
	private String reserve_memberBirth;
	private String reserve_memberphNmb;
	private String reserve_petName;
	private String reserve_petBirth;
	private String reserve_petType;
	private String reserve_petEctinfo;
	private String reserve_date;
	private Date reserve_writing_date;
	
	
	public reserveDTO() {
		// TODO Auto-generated constructor stub
	}


	public reserveDTO(int reserve_no, String reserve_hospitalNo, String reserve_hospitalName, String reserve_memberID,
			String reserve_memberName, String reserve_memberBirth, String reserve_memberphNmb, String reserve_petName,
			String reserve_petBirth, String reserve_petType, String reserve_petEctinfo, String reserve_date,
			Date reserve_writing_date) {
		super();
		this.reserve_no = reserve_no;
		this.reserve_hospitalNo = reserve_hospitalNo;
		this.reserve_hospitalName = reserve_hospitalName;
		this.reserve_memberID = reserve_memberID;
		this.reserve_memberName = reserve_memberName;
		this.reserve_memberBirth = reserve_memberBirth;
		this.reserve_memberphNmb = reserve_memberphNmb;
		this.reserve_petName = reserve_petName;
		this.reserve_petBirth = reserve_petBirth;
		this.reserve_petType = reserve_petType;
		this.reserve_petEctinfo = reserve_petEctinfo;
		this.reserve_date = reserve_date;
		this.reserve_writing_date = reserve_writing_date;
	}


	public int getReserve_no() {
		return reserve_no;
	}


	public void setReserve_no(int reserve_no) {
		this.reserve_no = reserve_no;
	}


	public String getReserve_hospitalNo() {
		return reserve_hospitalNo;
	}


	public void setReserve_hospitalNo(String reserve_hospitalNo) {
		this.reserve_hospitalNo = reserve_hospitalNo;
	}


	public String getReserve_hospitalName() {
		return reserve_hospitalName;
	}


	public void setReserve_hospitalName(String reserve_hospitalName) {
		this.reserve_hospitalName = reserve_hospitalName;
	}


	public String getReserve_memberID() {
		return reserve_memberID;
	}


	public void setReserve_memberID(String reserve_memberID) {
		this.reserve_memberID = reserve_memberID;
	}


	public String getReserve_memberName() {
		return reserve_memberName;
	}


	public void setReserve_memberName(String reserve_memberName) {
		this.reserve_memberName = reserve_memberName;
	}


	public String getReserve_memberBirth() {
		return reserve_memberBirth;
	}


	public void setReserve_memberBirth(String reserve_memberBirth) {
		this.reserve_memberBirth = reserve_memberBirth;
	}


	public String getReserve_memberphNmb() {
		return reserve_memberphNmb;
	}


	public void setReserve_memberphNmb(String reserve_memberphNmb) {
		this.reserve_memberphNmb = reserve_memberphNmb;
	}


	public String getReserve_petName() {
		return reserve_petName;
	}


	public void setReserve_petName(String reserve_petName) {
		this.reserve_petName = reserve_petName;
	}


	public String getReserve_petBirth() {
		return reserve_petBirth;
	}


	public void setReserve_petBirth(String reserve_petBirth) {
		this.reserve_petBirth = reserve_petBirth;
	}


	public String getReserve_petType() {
		return reserve_petType;
	}


	public void setReserve_petType(String reserve_petType) {
		this.reserve_petType = reserve_petType;
	}


	public String getReserve_petEctinfo() {
		return reserve_petEctinfo;
	}


	public void setReserve_petEctinfo(String reserve_petEctinfo) {
		this.reserve_petEctinfo = reserve_petEctinfo;
	}


	public String getReserve_date() {
		return reserve_date;
	}


	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}


	public Date getReserve_writing_date() {
		return reserve_writing_date;
	}


	public void setReserve_writing_date(Date reserve_writing_date) {
		this.reserve_writing_date = reserve_writing_date;
	}


	


	
	
	
}
