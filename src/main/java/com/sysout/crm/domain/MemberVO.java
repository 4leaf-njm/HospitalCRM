package com.sysout.crm.domain;

import java.sql.Timestamp;

public class MemberVO {
	
	private String mem_id;
	private String mem_pwd;
	private String mem_name;
	private String mem_addr;
	private String mem_phone;
	private String mem_email;
	private Timestamp mem_reg_date;
	private String mem_birth;
	private char mem_use_yn;
	private String mem_pcode;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public Timestamp getMem_reg_date() {
		return mem_reg_date;
	}
	public void setMem_reg_date(Timestamp mem_reg_date) {
		this.mem_reg_date = mem_reg_date;
	}
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public char getMem_use_yn() {
		return mem_use_yn;
	}
	public void setMem_use_yn(char mem_use_yn) {
		this.mem_use_yn = mem_use_yn;
	}
	public String getMem_pcode() {
		return mem_pcode;
	}
	public void setMem_pcode(String mem_pcode) {
		this.mem_pcode = mem_pcode;
	}
	@Override
	public String toString() {
		return "MemberVO [mem_id=" + mem_id + ", mem_pwd=" + mem_pwd + ", mem_name=" + mem_name + ", mem_addr="
				+ mem_addr + ", mem_phone=" + mem_phone + ", mem_email=" + mem_email + ", mem_reg_date=" + mem_reg_date
				+ ", mem_birth=" + mem_birth + ", mem_use_yn=" + mem_use_yn + ", mem_pcode=" + mem_pcode + "]";
	}
}
