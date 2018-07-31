package com.team.station4.uploadroom.model;

public class PriceDTO {
	int priceNo;
	int lease;
	int salePrice;
	int build_no;
	
	public PriceDTO(){}

	public PriceDTO(int priceNo, int lease, int salePrice, int build_no) {
		super();
		this.priceNo = priceNo;
		this.lease = lease;
		this.salePrice = salePrice;
		this.build_no = build_no;
	}

	public int getPriceNo() {
		return priceNo;
	}

	public void setPriceNo(int priceNo) {
		this.priceNo = priceNo;
	}

	public int getLease() {
		return lease;
	}

	public void setLease(int lease) {
		this.lease = lease;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getBuild_no() {
		return build_no;
	}

	public void setBuild_no(int build_no) {
		this.build_no = build_no;
	}
	
}
