package com.team.station4.uploadroom.model;

public class MonthlyDTO {
	int monthly_no;
	int monthly;
	int deposit;
	int bulid_no;
	
	public MonthlyDTO() {}

	public MonthlyDTO(int monthly_no, int monthly, int deposit, int bulid_no) {
		super();
		this.monthly_no = monthly_no;
		this.monthly = monthly;
		this.deposit = deposit;
		this.bulid_no = bulid_no;
	}

	public int getMonthly_no() {
		return monthly_no;
	}

	public void setMonthly_no(int monthly_no) {
		this.monthly_no = monthly_no;
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

	public int getBulid_no() {
		return bulid_no;
	}

	public void setBulid_no(int bulid_no) {
		this.bulid_no = bulid_no;
	};
}
