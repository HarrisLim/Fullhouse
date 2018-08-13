package com.team.station4.uploadroom.model;

import java.sql.Date;

public class AddInfoDTO {
	private int addInfo_no;
	private int costFee;
	private int internet;
	private int cost_tv;
	private int cleanFee;
	private int waterFee;
	private int gas;
	private int electricity;
	private int parking;
	private int elevator;
	private String heat;
	private int animal;
	private Date moveDate;
	private int aircon;
	private int washing;
	private int bed;
	private int desk;
	private int closet;
	private int option_tv;
	private int shoerack;
	private int fridge;
	private int gasstove;
	private int induction;
	private int microwave;
	private int doorlock;
	private int bidet;
	
	public AddInfoDTO() {}

	public AddInfoDTO(int addInfo_no, int costFee, int internet, int cost_tv, int cleanFee, int waterFee, int gas,
			int electricity, int parking, int elevator, String heat, int animal, Date moveDate, int aircon, int washing,
			int bed, int desk, int closet, int option_tv, int shoerack, int fridge, int gasstove, int induction,
			int microwave, int doorlock, int bidet) {
		super();
		this.addInfo_no = addInfo_no;
		this.costFee = costFee;
		this.internet = internet;
		this.cost_tv = cost_tv;
		this.cleanFee = cleanFee;
		this.waterFee = waterFee;
		this.gas = gas;
		this.electricity = electricity;
		this.parking = parking;
		this.elevator = elevator;
		this.heat = heat;
		this.animal = animal;
		this.moveDate = moveDate;
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

	public int getAddInfo_no() {
		return addInfo_no;
	}

	public void setAddInfo_no(int addInfo_no) {
		this.addInfo_no = addInfo_no;
	}

	public int getCostFee() {
		return costFee;
	}

	public void setCostFee(int costFee) {
		this.costFee = costFee;
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

	public int getElectricity() {
		return electricity;
	}

	public void setElectricity(int electricity) {
		this.electricity = electricity;
	}

	public int getParking() {
		return parking;
	}

	public void setParking(int parking) {
		this.parking = parking;
	}

	public int getElevator() {
		return elevator;
	}

	public void setElevator(int elevator) {
		this.elevator = elevator;
	}

	public String getHeat() {
		return heat;
	}

	public void setHeat(String heat) {
		this.heat = heat;
	}

	public int getAnimal() {
		return animal;
	}

	public void setAnimal(int animal) {
		this.animal = animal;
	}

	public Date getMoveDate() {
		return moveDate;
	}

	public void setMoveDate(Date moveDate) {
		this.moveDate = moveDate;
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
