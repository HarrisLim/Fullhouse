package com.team.station4.estate.model;

public class EstateDTO {
	
	private int estate_no;
	private int pay_count;
	private String estate_name;
	private String erno;
	private String lrno;
	private String estateaddr;
	private String owner_name;
	
	public EstateDTO() {}

	public EstateDTO(int estate_no, int pay_count, String estate_name, String erno, String lrno, String estateaddr,
			String owner_name) {
		super();
		this.estate_no = estate_no;
		this.pay_count = pay_count;
		this.estate_name = estate_name;
		this.erno = erno;
		this.lrno = lrno;
		this.estateaddr = estateaddr;
		this.owner_name = owner_name;
	}

	public int getEstate_no() {
		return estate_no;
	}

	public void setEstate_no(int estate_no) {
		this.estate_no = estate_no;
	}

	public int getPay_count() {
		return pay_count;
	}

	public void setPay_count(int pay_count) {
		this.pay_count = pay_count;
	}

	public String getEstate_name() {
		return estate_name;
	}

	public void setEstate_name(String estate_name) {
		this.estate_name = estate_name;
	}

	public String getErno() {
		return erno;
	}

	public void setErno(String erno) {
		this.erno = erno;
	}

	public String getLrno() {
		return lrno;
	}

	public void setLrno(String lrno) {
		this.lrno = lrno;
	}

	public String getEstateaddr() {
		return estateaddr;
	}

	public void setEstateaddr(String estateaddr) {
		this.estateaddr = estateaddr;
	}

	public String getOwner_name() {
		return owner_name;
	}

	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	};
	
	
}
