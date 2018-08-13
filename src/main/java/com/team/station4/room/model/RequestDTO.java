package com.team.station4.room.model;

import java.util.Date;

public class RequestDTO {
	private int request_no;
	private String req_phone;
	private String req_name;
	private Date req_rdate;
	private int build_no;
	
	RequestDTO(){}

	public RequestDTO(int request_no, String req_phone, String req_name, Date req_rdate, int build_no) {
		super();
		this.request_no = request_no;
		this.req_phone = req_phone;
		this.req_name = req_name;
		this.req_rdate = req_rdate;
		this.build_no = build_no;
	}

	public int getRequest_no() {
		return request_no;
	}

	public void setRequest_no(int request_no) {
		this.request_no = request_no;
	}

	public String getReq_phone() {
		return req_phone;
	}

	public void setReq_phone(String req_phone) {
		this.req_phone = req_phone;
	}

	public String getReq_name() {
		return req_name;
	}

	public void setReq_name(String req_name) {
		this.req_name = req_name;
	}

	public Date getReq_rdate() {
		return req_rdate;
	}

	public void setReq_rdate(Date req_rdate) {
		this.req_rdate = req_rdate;
	}

	public int getBuild_no() {
		return build_no;
	}

	public void setBuild_no(int build_no) {
		this.build_no = build_no;
	};
	
}
