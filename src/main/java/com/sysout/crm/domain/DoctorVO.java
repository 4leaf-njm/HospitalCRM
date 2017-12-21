package com.sysout.crm.domain;

import java.sql.Timestamp;

public class DoctorVO extends DepartVO{
	 private String doc_code;
	 private String doc_pwd;
	 private String doc_name;
	 private String doc_addr;
	 private String doc_phone;
	 private String doc_email;
	 private Timestamp doc_reg_date;
	 private String doc_birth;
	 private String depart_code;
	 private String doc_field;
	 private String doc_image; 
	 private char doc_use_yn;
     
	public String getDoc_code() {
		return doc_code;
	}
	public void setDoc_code(String doc_code) {
		this.doc_code = doc_code;
	}
	public String getDoc_pwd() {
		return doc_pwd;
	}
	public void setDoc_pwd(String doc_pwd) {
		this.doc_pwd = doc_pwd;
	}
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public String getDoc_addr() {
		return doc_addr;
	}
	public void setDoc_addr(String doc_addr) {
		this.doc_addr = doc_addr;
	}
	public String getDoc_phone() {
		return doc_phone;
	}
	public void setDoc_phone(String doc_phone) {
		this.doc_phone = doc_phone;
	}
	public String getDoc_email() {
		return doc_email;
	}
	public void setDoc_email(String doc_email) {
		this.doc_email = doc_email;
	}
	public Timestamp getDoc_reg_date() {
		return doc_reg_date;
	}
	public void setDoc_reg_date(Timestamp doc_reg_date) {
		this.doc_reg_date = doc_reg_date;
	}
	public String getDoc_birth() {
		return doc_birth;
	}
	public void setDoc_birth(String doc_birth) {
		this.doc_birth = doc_birth;
	}
	public String getDepart_code() {
		return depart_code;
	}
	public void setDepart_code(String depart_code) {
		this.depart_code = depart_code;
	}
	public String getDoc_field() {
		return doc_field;
	}
	public void setDoc_field(String doc_field) {
		this.doc_field = doc_field;
	}
	public String getDoc_image() {
		return doc_image;
	}
	public void setDoc_image(String doc_image) {
		this.doc_image = doc_image;
	}
	public char getDoc_use_yn() {
		return doc_use_yn;
	}
	public void setDoc_use_yn(char doc_use_yn) {
		this.doc_use_yn = doc_use_yn;
	}
	@Override
	public String toString() {
		return "DoctorVO [doc_code=" + doc_code + ", doc_pwd=" + doc_pwd + ", doc_name=" + doc_name + ", doc_addr="
				+ doc_addr + ", doc_phone=" + doc_phone + ", doc_email=" + doc_email + ", doc_reg_date=" + doc_reg_date
				+ ", doc_birth=" + doc_birth + ", depart_code=" + depart_code + ", doc_field=" + doc_field
				+ ", doc_image=" + doc_image + ", doc_use_yn=" + doc_use_yn + "]";
	}
}
