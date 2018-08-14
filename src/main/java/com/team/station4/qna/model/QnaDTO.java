package com.team.station4.qna.model;

import java.util.Date;

public class QnaDTO {
	private int qna_no;
	private String subject;
	private String content;
	private Date qna_rdate;
	private String reply;
	private String questioner;
	
	QnaDTO(){}

	public QnaDTO(int qna_no, String subject, String content, Date qna_rdate, String reply, String questioner) {
		super();
		this.qna_no = qna_no;
		this.subject = subject;
		this.content = content;
		this.qna_rdate = qna_rdate;
		this.reply = reply;
		this.questioner = questioner;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getQna_rdate() {
		return qna_rdate;
	}

	public void setQna_rdate(Date qna_rdate) {
		this.qna_rdate = qna_rdate;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getQuestioner() {
		return questioner;
	}

	public void setQuestioner(String questioner) {
		this.questioner = questioner;
	};
	
	
}
