package com.team.station4.uploadroom.model;

import java.util.ArrayList;

public class PriceDTO {
	private int priceNo;
	private int lease;
	private int salePrice;
	private int monthly;
	private int deposit;
	private int build_no;
		

	public PriceDTO(){}

	public PriceDTO(int priceNo, int lease, int salePrice, int monthly, int deposit, int build_no) {
		super();
		this.priceNo = priceNo;
		this.lease = lease;
		this.salePrice = salePrice;
		this.monthly = monthly;
		this.deposit = deposit;
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

	public int getMonthly() {
		return monthly;
	}

	public void setMonthly(int monthly) {
		this.monthly = monthly;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public int getBuild_no() {
		return build_no;
	}

	public void setBuild_no(int build_no) {
		this.build_no = build_no;
	}
}
