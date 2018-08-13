package com.team.station4.room.model;

import java.util.Date;

public class ReservationDTO {
	private int res_no;
	private String res_mem;
	private Date res_rdate;
	private int build_no;
	
	ReservationDTO(){}

	public ReservationDTO(int res_no, String res_mem, Date res_rdate, int build_no) {
		super();
		this.res_no = res_no;
		this.res_mem = res_mem;
		this.res_rdate = res_rdate;
		this.build_no = build_no;
	}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public String getRes_mem() {
		return res_mem;
	}

	public void setRes_mem(String res_mem) {
		this.res_mem = res_mem;
	}

	public Date getRes_rdate() {
		return res_rdate;
	}

	public void setRes_rdate(Date res_rdate) {
		this.res_rdate = res_rdate;
	}

	public int getBuild_no() {
		return build_no;
	}

	public void setBuild_no(int build_no) {
		this.build_no = build_no;
	}
	
	
}
