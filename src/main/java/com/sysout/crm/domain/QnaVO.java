package com.sysout.crm.domain;

import java.sql.Timestamp;

public class QnaVO extends QnaAnswerVO {

	private int qna_num;
	private String qna_title;
	private String qna_content;
	private Timestamp qna_reg_date;
	private String qna_status;
	private char qna_open_yn;
	private int qna_hit;
	private String mem_id;
	private String mem_name;
	
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Timestamp getQna_reg_date() {
		return qna_reg_date;
	}
	public void setQna_reg_date(Timestamp qna_reg_date) {
		this.qna_reg_date = qna_reg_date;
	}
	public String getQna_status() {
		return qna_status;
	}
	public void setQna_status(String qna_status) {
		this.qna_status = qna_status;
	}
	public char getQna_open_yn() {
		return qna_open_yn;
	}
	public void setQna_open_yn(char qna_open_yn) {
		this.qna_open_yn = qna_open_yn;
	}
	public int getQna_hit() {
		return qna_hit;
	}
	public void setQna_hit(int qna_hit) {
		this.qna_hit = qna_hit;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	@Override
	public String toString() {
		return "QnaVO [qna_num=" + qna_num + ", qna_title=" + qna_title + ", qna_content=" + qna_content
				+ ", qna_reg_date=" + qna_reg_date + ", qna_status=" + qna_status + ", qna_open_yn=" + qna_open_yn
				+ ", qna_hit=" + qna_hit + ", mem_id=" + mem_id + ", mem_name=" + mem_name + "]";
	}
}
