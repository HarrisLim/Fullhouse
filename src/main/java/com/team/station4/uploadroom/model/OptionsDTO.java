package com.team.station4.uploadroom.model;

public class OptionsDTO {
	int option_no;
	int aircon;
	int washing;
	int bed;
	int desk;
	int closet;
	int option_tv;
	int shoerack;
	int fridge;
	int gasstove;
	int induction;
	int microwave;
	int doorlock;
	int bidet;
	
	public OptionsDTO() {}
	public OptionsDTO(int option_no, int aircon, int washing, int bed, int desk, int closet, int option_tv,
			int shoerack, int fridge, int gasstove, int induction, int microwave, int doorlock, int bidet) {
		super();
		this.option_no = option_no;
		this.aircon = aircon;
		this.washing = washing;
		this.bed = bed;
		this.desk = desk;
		this.closet = closet;
		this.option_tv = option_tv;
		this.shoerack = shoerack;
		this.fridge = fridge;
		this.gasstove = gasstove;
		this.induction = induction;
		this.microwave = microwave;
		this.doorlock = doorlock;
		this.bidet = bidet;
	}
	
	public int getOption_no() {
		return option_no;
	}
	public void setOption_no(int option_no) {
		this.option_no = option_no;
	}
	public int getAircon() {
		return aircon;
	}
	public void setAircon(int aircon) {
		this.aircon = aircon;
	}
	public int getWashing() {
		return washing;
	}
	public void setWashing(int washing) {
		this.washing = washing;
	}
	public int getBed() {
		return bed;
	}
	public void setBed(int bed) {
		this.bed = bed;
	}
	public int getDesk() {
		return desk;
	}
	public void setDesk(int desk) {
		this.desk = desk;
	}
	public int getCloset() {
		return closet;
	}
	public void setCloset(int closet) {
		this.closet = closet;
	}
	public int getOption_tv() {
		return option_tv;
	}
	public void setOption_tv(int option_tv) {
		this.option_tv = option_tv;
	}
	public int getShoerack() {
		return shoerack;
	}
	public void setShoerack(int shoerack) {
		this.shoerack = shoerack;
	}
	public int getFridge() {
		return fridge;
	}
	public void setFridge(int fridge) {
		this.fridge = fridge;
	}
	public int getGasstove() {
		return gasstove;
	}
	public void setGasstove(int gasstove) {
		this.gasstove = gasstove;
	}
	public int getInduction() {
		return induction;
	}
	public void setInduction(int induction) {
		this.induction = induction;
	}
	public int getMicrowave() {
		return microwave;
	}
	public void setMicrowave(int microwave) {
		this.microwave = microwave;
	}
	public int getDoorlock() {
		return doorlock;
	}
	public void setDoorlock(int doorlock) {
		this.doorlock = doorlock;
	}
	public int getBidet() {
		return bidet;
	}
	public void setBidet(int bidet) {
		this.bidet = bidet;
	}
	
	
}
