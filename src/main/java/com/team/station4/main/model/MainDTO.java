package com.team.station4.main.model;

import java.sql.Date;

public class MainDTO {
	
	private int mem_no;
	private String mem_name;
	private String mem_email;
	private String mem_pw;
	private String mem_phone;
	private String hot;
	private Date mem_rdate;
	private String recentList;
	
	public MainDTO() {}

	public MainDTO(int mem_no, String mem_name, String mem_email, String mem_pw, String mem_phone, String hot,
			Date mem_rdate, String recentList) {
		super();
		this.mem_no = mem_no;
		this.mem_name = mem_name;
		this.mem_email = mem_email;
		this.mem_pw = mem_pw;
		this.mem_phone = mem_phone;
		this.hot = hot;
		this.mem_rdate = mem_rdate;
		this.recentList = recentList;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getHot() {
		return hot;
	}

	public void setHot(String hot) {
		this.hot = hot;
	}

	public Date getMem_rdate() {
		return mem_rdate;
	}

	public void setMem_rdate(Date mem_rdate) {
		this.mem_rdate = mem_rdate;
	}

	public String getRecentList() {
		return recentList;
	}

	public void setRecentList(String recentList) {
		this.recentList = recentList;
	}

	
}
