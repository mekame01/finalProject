package com.kh.ml.member.model.vo;

// tb_member 테이블의 row 정보를 담을 클래스
public class Member {
	private String userId;
	private String password;
	private String email;
	private String gender;
	private int isLeave;
	
	public Member() {
		
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getIsLeave() {
		return isLeave;
	}

	public void setIsLeave(int isLeave) {
		this.isLeave = isLeave;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", email=" + email + ", gender=" + gender
				+ ", isLeave=" + isLeave + "]";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
