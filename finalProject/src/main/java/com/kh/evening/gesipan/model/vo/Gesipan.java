package com.kh.evening.gesipan.model.vo;

import java.sql.Date;

public class Gesipan {
	
//	 경히 안뇨오옹옹 키보드 소리가 참 좋구나아아아 히힣
//	 경히야아아아아아ㅓ다리니아라다내댜구어파타ㅣ니ㅏㄷ자ㅣㅓㄴ아ㅣㄴ앙ㄴ리ㅏ젇가ㅣㄴ이ㅏ미ㅏㅇ라아가
//	 마라탕먹으러간다 오늘으으으으르르를 ㅎ___ㅎ
//	 파이널 힘들지? 흑흑
//	 힘내애 ㅠ__ㅠ <33333
	private int g_id;
	private String g_category;
	private String g_title;
	private String g_content;
	private String g_writer;
	private String nickname;
	private int g_count;
	private Date g_enroll_date;
	private Date g_update_date;
	private int g_ref;
	private String g_status;
	private String locked;
	
	public Gesipan() {}

	public Gesipan(int g_id, String g_category, String g_title, String g_content, String g_writer, String nickname,
			int g_count, Date g_enroll_date, Date g_update_date, int g_ref, String g_status, String locked) {
		super();
		this.g_id = g_id;
		this.g_category = g_category;
		this.g_title = g_title;
		this.g_content = g_content;
		this.g_writer = g_writer;
		this.nickname = nickname;
		this.g_count = g_count;
		this.g_enroll_date = g_enroll_date;
		this.g_update_date = g_update_date;
		this.g_ref = g_ref;
		this.g_status = g_status;
		this.locked = locked;
	}

	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

	public String getG_category() {
		return g_category;
	}

	public void setG_category(String g_category) {
		this.g_category = g_category;
	}

	public String getG_title() {
		return g_title;
	}

	public void setG_title(String g_title) {
		this.g_title = g_title;
	}

	public String getG_content() {
		return g_content;
	}

	public void setG_content(String g_content) {
		this.g_content = g_content;
	}

	public String getG_writer() {
		return g_writer;
	}

	public void setG_writer(String g_writer) {
		this.g_writer = g_writer;
	}

	public String getnickname() {
		return nickname;
	}

	public void setnickname(String nickname) {
		this.nickname = nickname;
	}

	public int getG_count() {
		return g_count;
	}

	public void setG_count(int g_count) {
		this.g_count = g_count;
	}

	public Date getG_enroll_date() {
		return g_enroll_date;
	}

	public void setG_enroll_date(Date g_enroll_date) {
		this.g_enroll_date = g_enroll_date;
	}

	public Date getG_update_date() {
		return g_update_date;
	}

	public void setG_update_date(Date g_update_date) {
		this.g_update_date = g_update_date;
	}

	public int getG_ref() {
		return g_ref;
	}

	public void setG_ref(int g_ref) {
		this.g_ref = g_ref;
	}

	public String getG_status() {
		return g_status;
	}

	public void setG_status(String g_status) {
		this.g_status = g_status;
	}

	public String getLocked() {
		return locked;
	}

	public void setLocked(String locked) {
		this.locked = locked;
	}

	@Override
	public String toString() {
		return "Gesipan [g_id=" + g_id + ", g_category=" + g_category + ", g_title=" + g_title + ", g_content="
				+ g_content + ", g_writer=" + g_writer + ", nickname=" + nickname + ", g_count=" + g_count
				+ ", g_enroll_date=" + g_enroll_date + ", g_update_date=" + g_update_date + ", g_ref=" + g_ref
				+ ", g_status=" + g_status + ", locked=" + locked + "]";
	}
	
}
