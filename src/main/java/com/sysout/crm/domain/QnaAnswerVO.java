package com.sysout.crm.domain;

public class QnaAnswerVO {
	
	private int answer_num;
	private String writer_code;
	private int qna_num;
	private String answer_content;
	
	public int getAnswer_num() {
		return answer_num;
	}
	public void setAnswer_num(int answer_num) {
		this.answer_num = answer_num;
	}
	public String getWriter_code() {
		return writer_code;
	}
	public void setWriter_code(String writer_code) {
		this.writer_code = writer_code;
	}
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}
}
