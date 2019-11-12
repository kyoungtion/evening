package com.kh.evening.gesipan.model.vo;

import java.sql.Date;

public class GesipanReply {
	private int g_reply_id;
	private String user_id;
	private String nickname;
	private int g_ref;
	private String reply_content;
	private int reply_add;
	private Date reply_enroll_date;
	private Date reply_update_date;
	private String reply_status;

	public GesipanReply() {}

	public GesipanReply(int g_reply_id, String user_id, String nickname, int g_ref, String reply_content, int reply_add,
			Date reply_enroll_date, Date reply_update_date, String reply_status) {
		super();
		this.g_reply_id = g_reply_id;
		this.user_id = user_id;
		this.nickname = nickname;
		this.g_ref = g_ref;
		this.reply_content = reply_content;
		this.reply_add = reply_add;
		this.reply_enroll_date = reply_enroll_date;
		this.reply_update_date = reply_update_date;
		this.reply_status = reply_status;
	}

	public int getG_reply_id() {
		return g_reply_id;
	}

	public void setG_reply_id(int g_reply_id) {
		this.g_reply_id = g_reply_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getG_ref() {
		return g_ref;
	}

	public void setG_ref(int g_ref) {
		this.g_ref = g_ref;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public int getReply_add() {
		return reply_add;
	}

	public void setReply_add(int reply_add) {
		this.reply_add = reply_add;
	}

	public Date getReply_enroll_date() {
		return reply_enroll_date;
	}

	public void setReply_enroll_date(Date reply_enroll_date) {
		this.reply_enroll_date = reply_enroll_date;
	}

	public Date getReply_update_date() {
		return reply_update_date;
	}

	public void setReply_update_date(Date reply_update_date) {
		this.reply_update_date = reply_update_date;
	}

	public String getReply_status() {
		return reply_status;
	}

	public void setReply_status(String reply_status) {
		this.reply_status = reply_status;
	}

	@Override
	public String toString() {
		return "GesipanReply [g_reply_id=" + g_reply_id + ", user_id=" + user_id + ", nickname=" + nickname + ", g_ref="
				+ g_ref + ", reply_content=" + reply_content + ", reply_add=" + reply_add + ", reply_enroll_date="
				+ reply_enroll_date + ", reply_update_date=" + reply_update_date + ", reply_status=" + reply_status
				+ "]";
	}

	
	
}


