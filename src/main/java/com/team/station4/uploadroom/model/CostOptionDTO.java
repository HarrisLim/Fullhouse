package com.team.station4.uploadroom.model;

public class CostOptionDTO {
	int cost_no;
	int internet;
	int cost_tv;
	int cleanFee;
	int waterFee;
	int gas;
	int electicity;
	
	public CostOptionDTO(){}

	public CostOptionDTO(int cost_no, int internet, int cost_tv, int cleanFee, int waterFee, int gas, int electicity) {
		super();
		this.cost_no = cost_no;
		this.internet = internet;
		this.cost_tv = cost_tv;
		this.cleanFee = cleanFee;
		this.waterFee = waterFee;
		this.gas = gas;
		this.electicity = electicity;
	}

	public int getCost_no() {
		return cost_no;
	}

	public void setCost_no(int cost_no) {
		this.cost_no = cost_no;
	}

	public int getInternet() {
		return internet;
	}

	public void setInternet(int internet) {
		this.internet = internet;
	}

	public int getCost_tv() {
		return cost_tv;
	}

	public void setCost_tv(int cost_tv) {
		this.cost_tv = cost_tv;
	}

	public int getCleanFee() {
		return cleanFee;
	}

	public void setCleanFee(int cleanFee) {
		this.cleanFee = cleanFee;
	}

	public int getWaterFee() {
		return waterFee;
	}

	public void setWaterFee(int waterFee) {
		this.waterFee = waterFee;
	}

	public int getGas() {
		return gas;
	}

	public void setGas(int gas) {
		this.gas = gas;
	}

	public int getElecticity() {
		return electicity;
	}

	public void setElecticity(int electicity) {
		this.electicity = electicity;
	}
	
	
}
