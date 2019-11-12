package com.kh.evening.gesipan.model.vo;

import java.sql.Date;

public class Gesipan_File {
	private int file_id;
	private int g_id;
	private String originFileName;
	private String renameFileName;
	private Date file_enroll_date;
	private Date file_update_date;
	private String file_status;
	
	public Gesipan_File() {}

	public Gesipan_File(int file_id, int g_id, String originFileName, String renameFileName, Date file_enroll_date,
			Date file_update_date, String file_status) {
		super();
		this.file_id = file_id;
		this.g_id = g_id;
		this.originFileName = originFileName;
		this.renameFileName = renameFileName;
		this.file_enroll_date = file_enroll_date;
		this.file_update_date = file_update_date;
		this.file_status = file_status;
	}

	public int getFile_id() {
		return file_id;
	}

	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}

	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public Date getFile_enroll_date() {
		return file_enroll_date;
	}

	public void setFile_enroll_date(Date file_enroll_date) {
		this.file_enroll_date = file_enroll_date;
	}

	public Date getFile_update_date() {
		return file_update_date;
	}

	public void setFile_update_date(Date file_update_date) {
		this.file_update_date = file_update_date;
	}

	public String getFile_status() {
		return file_status;
	}

	public void setFile_status(String file_status) {
		this.file_status = file_status;
	}

	@Override
	public String toString() {
		return "Gesipan_File [file_id=" + file_id + ", g_id=" + g_id + ", originFileName=" + originFileName
				+ ", renameFileName=" + renameFileName + ", file_enroll_date=" + file_enroll_date
				+ ", file_update_date=" + file_update_date + ", file_status=" + file_status + "]";
	}
	
}
