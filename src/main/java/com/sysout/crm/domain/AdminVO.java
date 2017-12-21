package com.sysout.crm.domain;

import java.sql.Timestamp;

public class AdminVO {
	private String admin_code;
	private String admin_pwd;
	private String admin_name;
	private String admin_addr;
	private String admin_phone;
	private String admin_email;
	private Timestamp admin_reg_date;
	private String admin_birth;
	private String admin_use_yn;
	
	public String getAdmin_code() {
		return admin_code;
	}
	public void setAdmin_code(String admin_code) {
		this.admin_code = admin_code;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_addr() {
		return admin_addr;
	}
	public void setAdmin_addr(String admin_addr) {
		this.admin_addr = admin_addr;
	}
	public String getAdmin_phone() {
		return admin_phone;
	}
	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}
	public String getAdmin_email() {
		return admin_email;
	}
	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}
	public Timestamp getAdmin_reg_date() {
		return admin_reg_date;
	}
	public void setAdmin_reg_date(Timestamp admin_reg_date) {
		this.admin_reg_date = admin_reg_date;
	}
	public String getAdmin_birth() {
		return admin_birth;
	}
	public void setAdmin_birth(String admin_birth) {
		this.admin_birth = admin_birth;
	}
	public String getAdmin_use_yn() {
		return admin_use_yn;
	}
	public void setAdmin_use_yn(String admin_use_yn) {
		this.admin_use_yn = admin_use_yn;
	}
}
