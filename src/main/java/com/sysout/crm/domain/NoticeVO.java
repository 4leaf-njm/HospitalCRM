package com.sysout.crm.domain;

import java.sql.Timestamp;

public class NoticeVO {

	private int notice_num;
	private String admin_code;
	private String notice_title;
	private String notice_content;
	private Timestamp notice_reg_date;
	private int notice_hit;
	private String notice_file;
    
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getAdmin_code() {
		return admin_code;
	}
	public void setAdmin_code(String admin_code) {
		this.admin_code = admin_code;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Timestamp getNotice_reg_date() {
		return notice_reg_date;
	}
	public void setNotice_reg_date(Timestamp notice_reg_date) {
		this.notice_reg_date = notice_reg_date;
	}
	public int getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
}
