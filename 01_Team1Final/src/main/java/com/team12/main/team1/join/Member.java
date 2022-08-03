package com.team12.main.team1.join;

import java.util.Date;

public class Member {

	private String member_detail_num;
	private String member_name;
	private String member_birth;
	private String member_sex;
	private String member_phoneNum;
	private String member_Address;
	private String member_eMail;
	private Date member_joinDate;
	private String member_paper;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String member_detail_num, String member_name, String member_birth, String member_sex,
			String member_phoneNum, String member_Address, String member_eMail, Date member_joinDate,
			String member_paper) {
		super();
		this.member_detail_num = member_detail_num;
		this.member_name = member_name;
		this.member_birth = member_birth;
		this.member_sex = member_sex;
		this.member_phoneNum = member_phoneNum;
		this.member_Address = member_Address;
		this.member_eMail = member_eMail;
		this.member_joinDate = member_joinDate;
		this.member_paper = member_paper;
	}

	public String getMember_detail_num() {
		return member_detail_num;
	}

	public void setMember_detail_num(String member_detail_num) {
		this.member_detail_num = member_detail_num;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
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

	public String getMember_Address() {
		return member_Address;
	}

	public void setMember_Address(String member_Address) {
		this.member_Address = member_Address;
	}

	public String getMember_eMail() {
		return member_eMail;
	}

	public void setMember_eMail(String member_eMail) {
		this.member_eMail = member_eMail;
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
