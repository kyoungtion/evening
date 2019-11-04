package com.kh.evening.member.model.vo;

import java.sql.Date;

public class Member {
	
	private String user_id;
	private String user_name;
	private String rank_code;
	private String user_pwd;
	private String nickName;
	private String user_residentNumber;
	private String phone;
	private String address;
	private Date enroll_date;
	private Date update_date;
	private String bookmark;
	private String status;
	private int penalty_point;
	private Date panalty_date;
	private int penalty_stack;
	
	public Member() {}

	public Member(String user_id, String user_name, String rank_code, String user_pwd, String nickName,
			String user_residentNumber, String phone, String address, Date enroll_date, Date update_date,
			String bookmark, String status, int penalty_point, Date panalty_date, int penalty_stack) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.rank_code = rank_code;
		this.user_pwd = user_pwd;
		this.nickName = nickName;
		this.user_residentNumber = user_residentNumber;
		this.phone = phone;
		this.address = address;
		this.enroll_date = enroll_date;
		this.update_date = update_date;
		this.bookmark = bookmark;
		this.status = status;
		this.penalty_point = penalty_point;
		this.panalty_date = panalty_date;
		this.penalty_stack = penalty_stack;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getRank_code() {
		return rank_code;
	}

	public void setRank_code(String rank_code) {
		this.rank_code = rank_code;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUser_residentNumber() {
		return user_residentNumber;
	}

	public void setUser_residentNumber(String user_residentNumber) {
		this.user_residentNumber = user_residentNumber;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public String getBookmark() {
		return bookmark;
	}

	public void setBookmark(String bookmark) {
		this.bookmark = bookmark;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPenalty_point() {
		return penalty_point;
	}

	public void setPenalty_point(int penalty_point) {
		this.penalty_point = penalty_point;
	}

	public Date getPanalty_date() {
		return panalty_date;
	}

	public void setPanalty_date(Date panalty_date) {
		this.panalty_date = panalty_date;
	}

	public int getPenalty_stack() {
		return penalty_stack;
	}

	public void setPenalty_stack(int penalty_stack) {
		this.penalty_stack = penalty_stack;
	}

	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_name=" + user_name + ", rank_code=" + rank_code + ", user_pwd="
				+ user_pwd + ", nickName=" + nickName + ", user_residentNumber=" + user_residentNumber + ", phone="
				+ phone + ", address=" + address + ", enroll_date=" + enroll_date + ", update_date=" + update_date
				+ ", bookmark=" + bookmark + ", status=" + status + ", penalty_point=" + penalty_point
				+ ", panalty_date=" + panalty_date + ", penalty_stack=" + penalty_stack + "]";
	}

	
	
	
	
}
