package com.team12.main.team1.join;

public class kakaoMember {

	private String k_acTokken;
	private String k_email;
	private String k_nickname;
	private String k_memberID;
	
	public kakaoMember() {
		// TODO Auto-generated constructor stub
	}

	public kakaoMember(String k_acTokken, String k_email, String k_nickname, String k_memberID) {
		super();
		this.k_acTokken = k_acTokken;
		this.k_email = k_email;
		this.k_nickname = k_nickname;
		this.k_memberID = k_memberID;
	}

	public String getK_acTokken() {
		return k_acTokken;
	}

	public void setK_acTokken(String k_acTokken) {
		this.k_acTokken = k_acTokken;
	}

	public String getK_email() {
		return k_email;
	}

	public void setK_email(String k_email) {
		this.k_email = k_email;
	}

	public String getK_nickname() {
		return k_nickname;
	}

	public void setK_nickname(String k_nickname) {
		this.k_nickname = k_nickname;
	}

	public String getK_memberID() {
		return k_memberID;
	}

	public void setK_memberID(String k_memberID) {
		this.k_memberID = k_memberID;
	}
	
	
}
