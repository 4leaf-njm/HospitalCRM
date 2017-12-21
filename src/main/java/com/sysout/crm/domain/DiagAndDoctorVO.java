package com.sysout.crm.domain;

import java.sql.Timestamp;

public class DiagAndDoctorVO extends DoctorVO{
	private int diag_num;
	private String mem_pcode;
	private String mem_name;
	private String doc_code;
	private String diag_disease;
	private String diag_content;
	private Timestamp diag_date;
	private int reserv_num;
	
	public int getDiag_num() {
		return diag_num;
	}
	public void setDiag_num(int diag_num) {
		this.diag_num = diag_num;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_pcode() {
		return mem_pcode;
	}
	public void setMem_pcode(String mem_pcode) {
		this.mem_pcode = mem_pcode;
	}
	public String getDoc_code() {
		return doc_code;
	}
	public void setDoc_code(String doc_code) {
		this.doc_code = doc_code;
	}
	public String getDiag_disease() {
		return diag_disease;
	}
	public void setDiag_disease(String diag_disease) {
		this.diag_disease = diag_disease;
	}
	public String getDiag_content() {
		return diag_content;
	}
	public void setDiag_content(String diag_content) {
		this.diag_content = diag_content;
	}
	public Timestamp getDiag_date() {
		return diag_date;
	}
	public void setDiag_date(Timestamp diag_date) {
		this.diag_date = diag_date;
	}
	public int getReserv_num() {
		return reserv_num;
	}
	public void setReserv_num(int reserv_num) {
		this.reserv_num = reserv_num;
	}
}
