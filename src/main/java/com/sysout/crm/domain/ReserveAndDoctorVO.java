package com.sysout.crm.domain;

import java.sql.Timestamp;

public class ReserveAndDoctorVO extends DoctorVO{
	private int reserv_num;
	private Timestamp reserv_date;
	private String doc_code;
	private String mem_pcode;
	private String reserv_symptom;
	private String reserv_status;
	private String mem_name;
	private String mem_phone;
	
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getReserv_num() {
		return reserv_num;
	}
	public void setReserv_num(int reserv_num) {
		this.reserv_num = reserv_num;
	}
	public Timestamp getReserv_date() {
		return reserv_date;
	}
	public void setReserv_date(Timestamp reserv_date) {
		this.reserv_date = reserv_date;
	}
	public String getDoc_code() {
		return doc_code;
	}
	public void setDoc_code(String doc_code) {
		this.doc_code = doc_code;
	}
	public String getMem_pcode() {
		return mem_pcode;
	}
	public void setMem_pcode(String mem_pcode) {
		this.mem_pcode = mem_pcode;
	}
	public String getReserv_symptom() {
		return reserv_symptom;
	}
	public void setReserv_symptom(String reserv_symptom) {
		this.reserv_symptom = reserv_symptom;
	}
	public String getReserv_status() {
		return reserv_status;
	}
	public void setReserv_status(String reserv_status) {
		this.reserv_status = reserv_status;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	@Override
	public String toString() {
		return "ReserveAndDoctorVO [reserv_num=" + reserv_num + ", reserv_date=" + reserv_date + ", doc_code="
				+ doc_code + ", mem_pcode=" + mem_pcode + ", reserv_symptom=" + reserv_symptom + ", reserv_status="
				+ reserv_status + ", mem_name=" + mem_name + "]";
	}
}
