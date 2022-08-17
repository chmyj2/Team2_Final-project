package com.team12.main.t2Login;

import java.sql.Date;

public class pet {

	private int baby_num;
	private String baby_memberID;
	private String baby_name;
	private Date baby_birth;
	private String baby_sex;
	private double baby_weight;
	private String baby_type;
	private String baby_typeDetail;
	private String baby_neut;
	private String baby_img;
	
	public pet() {
		// TODO Auto-generated constructor stub
	}

	public pet(int baby_num, String baby_memberID, String baby_name, Date baby_birth, String baby_sex,
			double baby_weight, String baby_type, String baby_typeDetail, String baby_neut, String baby_img) {
		super();
		this.baby_num = baby_num;
		this.baby_memberID = baby_memberID;
		this.baby_name = baby_name;
		this.baby_birth = baby_birth;
		this.baby_sex = baby_sex;
		this.baby_weight = baby_weight;
		this.baby_type = baby_type;
		this.baby_typeDetail = baby_typeDetail;
		this.baby_neut = baby_neut;
		this.baby_img = baby_img;
	}

	public int getBaby_num() {
		return baby_num;
	}

	public void setBaby_num(int baby_num) {
		this.baby_num = baby_num;
	}

	public String getBaby_memberID() {
		return baby_memberID;
	}

	public void setBaby_memberID(String baby_memberID) {
		this.baby_memberID = baby_memberID;
	}

	public String getBaby_name() {
		return baby_name;
	}

	public void setBaby_name(String baby_name) {
		this.baby_name = baby_name;
	}

	public Date getBaby_birth() {
		return baby_birth;
	}

	public void setBaby_birth(Date baby_birth) {
		this.baby_birth = baby_birth;
	}

	public String getBaby_sex() {
		return baby_sex;
	}

	public void setBaby_sex(String baby_sex) {
		this.baby_sex = baby_sex;
	}

	public double getBaby_weight() {
		return baby_weight;
	}

	public void setBaby_weight(double baby_weight) {
		this.baby_weight = baby_weight;
	}

	public String getBaby_type() {
		return baby_type;
	}

	public void setBaby_type(String baby_type) {
		this.baby_type = baby_type;
	}

	public String getBaby_typeDetail() {
		return baby_typeDetail;
	}

	public void setBaby_typeDetail(String baby_typeDetail) {
		this.baby_typeDetail = baby_typeDetail;
	}

	public String getBaby_neut() {
		return baby_neut;
	}

	public void setBaby_neut(String baby_neut) {
		this.baby_neut = baby_neut;
	}

	public String getBaby_img() {
		return baby_img;
	}

	public void setBaby_img(String baby_img) {
		this.baby_img = baby_img;
	}
	
	
}
