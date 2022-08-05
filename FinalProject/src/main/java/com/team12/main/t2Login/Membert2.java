package com.team12.main.t2Login;

import java.util.Date;

public class Membert2 {
	private String member_ID;
	private String member_PW;
	private int member_linkWhere;
	private String member_name;
	private Date member_birth;
	private String member_sex;
	private String member_phoneNum;
	private String member_address;
	private	String member_email;
	private Date member_joinDate;
	private String member_paper;
	
	public Membert2() {
		// TODO Auto-generated constructor stub
	}
	
	public Membert2(String member_ID, String member_PW, int member_linkWhere, String member_name, Date member_birth,
			String member_sex, String member_phoneNum, String member_address, String member_email, Date member_joinDate,
			String member_paper) {
		super();
		this.member_ID = member_ID;
		this.member_PW = member_PW;
		this.member_linkWhere = member_linkWhere;
		this.member_name = member_name;
		this.member_birth = member_birth;
		this.member_sex = member_sex;
		this.member_phoneNum = member_phoneNum;
		this.member_address = member_address;
		this.member_email = member_email;
		this.member_joinDate = member_joinDate;
		this.member_paper = member_paper;
	}
	public String getMember_ID() {
		return member_ID;
	}
	public void setMember_ID(String member_ID) {
		this.member_ID = member_ID;
	}
	public String getMember_PW() {
		return member_PW;
	}
	public void setMember_PW(String member_PW) {
		this.member_PW = member_PW;
	}
	public int getMember_linkWhere() {
		return member_linkWhere;
	}
	public void setMember_linkWhere(int member_linkWhere) {
		this.member_linkWhere = member_linkWhere;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public Date getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(Date member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_sex() {
		return member_sex;
	}
	public void setMember_sex(String member_sex) {
		this.member_sex = member_sex;
	}
	public String getMember_phoneNum() {
		return member_phoneNum;
	}
	public void setMember_phoneNum(String member_phoneNum) {
		this.member_phoneNum = member_phoneNum;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public Date getMember_joinDate() {
		return member_joinDate;
	}
	public void setMember_joinDate(Date member_joinDate) {
		this.member_joinDate = member_joinDate;
	}
	public String getMember_paper() {
		return member_paper;
	}
	public void setMember_paper(String member_paper) {
		this.member_paper = member_paper;
	}
	
	
}
