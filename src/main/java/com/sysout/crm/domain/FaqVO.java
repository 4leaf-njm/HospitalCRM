package com.sysout.crm.domain;

import java.sql.Timestamp;

public class FaqVO {
	
	private int faq_num;
	private String faq_title;
	private String faq_answer;
	private Timestamp faq_reg_date;
	private String admin_code;
	
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_answer() {
		return faq_answer;
	}
	public void setFaq_answer(String faq_answer) {
		this.faq_answer = faq_answer;
	}
	public Timestamp getFaq_reg_date() {
		return faq_reg_date;
	}
	public void setFaq_reg_date(Timestamp faq_reg_date) {
		this.faq_reg_date = faq_reg_date;
	}
	public String getAdmin_code() {
		return admin_code;
	}
	public void setAdmin_code(String admin_code) {
		this.admin_code = admin_code;
	}
}
