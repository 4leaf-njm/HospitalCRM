package com.sysout.crm.domain;

import java.util.Date;

public class ScheduleVO extends DoctorVO{
	private int schedule_num;
	private Date schedule_reg_date;
	private Date schedule_start_date;
	private Date  schedule_end_date;
	private String schedule_reason;
	private String doc_code;
	private char schedule_permit_yn;
	private char schedule_del_yn;
	
	public int getSchedule_num() {
		return schedule_num;
	}
	public void setSchedule_num(int schedule_num) {
		this.schedule_num = schedule_num;
	}
	public Date getSchedule_reg_date() {
		return schedule_reg_date;
	}
	public void setSchedule_reg_date(Date schedule_reg_date) {
		this.schedule_reg_date = schedule_reg_date;
	}
	public Date getSchedule_start_date() {
		return schedule_start_date;
	}
	public void setSchedule_start_date(Date schedule_start_date) {
		this.schedule_start_date = schedule_start_date;
	}
	public Date getSchedule_end_date() {
		return schedule_end_date;
	}
	public void setSchedule_end_date(Date schedule_end_date) {
		this.schedule_end_date = schedule_end_date;
	}
	public String getSchedule_reason() {
		return schedule_reason;
	}
	public void setSchedule_reason(String schedule_reason) {
		this.schedule_reason = schedule_reason;
	}
	public String getDoc_code() {
		return doc_code;
	}
	public void setDoc_code(String doc_code) {
		this.doc_code = doc_code;
	}
	public char getSchedule_permit_yn() {
		return schedule_permit_yn;
	}
	public void setSchedule_permit_yn(char schedule_permit_yn) {
		this.schedule_permit_yn = schedule_permit_yn;
	}
	public char getSchedule_del_yn() {
		return schedule_del_yn;
	}
	public void setSchedule_del_yn(char schedule_del_yn) {
		this.schedule_del_yn = schedule_del_yn;
	}
	@Override
	public String toString() {
		return "ScheduleVO [schedule_num=" + schedule_num + ", schedule_reason=" + schedule_reason + ", doc_code="
				+ doc_code + ", schedule_permit_yn=" + schedule_permit_yn + ", schedule_del_yn=" + schedule_del_yn
				+ "]";
	}
}
