package com.team.station4.staff.model;

import java.util.Date;

public class StaffDTO {
	
	private int st_no;
	private int estate_no;
	private String st_pic;
	private String st_name;
	private String st_position;
	private String st_qual;
	private String st_phone;
	private String st_homephone;
	private String st_email;
	private String st_pw;
	private String st_joinpath;
	private String st_media;
	private int verify;
	private Date st_rdate;
	
	public StaffDTO() {}

	public StaffDTO(int st_no, int estate_no, String st_pic, String st_name, String st_position, String st_qual,
			String st_phone, String st_homephone, String st_email, String st_pw, String st_joinpath, String st_media,
			int verify, Date st_rdate) {
		super();
		this.st_no = st_no;
		this.estate_no = estate_no;
		this.st_pic = st_pic;
		this.st_name = st_name;
		this.st_position = st_position;
		this.st_qual = st_qual;
		this.st_phone = st_phone;
		this.st_homephone = st_homephone;
		this.st_email = st_email;
		this.st_pw = st_pw;
		this.st_joinpath = st_joinpath;
		this.st_media = st_media;
		this.verify = verify;
		this.st_rdate = st_rdate;
	}

	public int getSt_no() {
		return st_no;
	}

	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}

	public int getEstate_no() {
		return estate_no;
	}

	public void setEstate_no(int estate_no) {
		this.estate_no = estate_no;
	}

	public String getSt_pic() {
		return st_pic;
	}

	public void setSt_pic(String st_pic) {
		this.st_pic = st_pic;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public String getSt_position() {
		return st_position;
	}

	public void setSt_position(String st_position) {
		this.st_position = st_position;
	}

	public String getSt_qual() {
		return st_qual;
	}

	public void setSt_qual(String st_qual) {
		this.st_qual = st_qual;
	}

	public String getSt_phone() {
		return st_phone;
	}

	public void setSt_phone(String st_phone) {
		this.st_phone = st_phone;
	}

	public String getSt_homephone() {
		return st_homephone;
	}

	public void setSt_homephone(String st_homephone) {
		this.st_homephone = st_homephone;
	}

	public String getSt_email() {
		return st_email;
	}

	public void setSt_email(String st_email) {
		this.st_email = st_email;
	}

	public String getSt_pw() {
		return st_pw;
	}

	public void setSt_pw(String st_pw) {
		this.st_pw = st_pw;
	}

	public String getSt_joinpath() {
		return st_joinpath;
	}

	public void setSt_joinpath(String st_joinpath) {
		this.st_joinpath = st_joinpath;
	}

	public String getSt_media() {
		return st_media;
	}

	public void setSt_media(String st_media) {
		this.st_media = st_media;
	}
	
	public int getVerify() {
		return verify;
	}

	public void setVerify(int verify) {
		this.verify = verify;
	}

	public Date getSt_rdate() {
		return st_rdate;
	}

	public void setSt_rdate(Date st_rdate) {
		this.st_rdate = st_rdate;
	}

	
	
}
