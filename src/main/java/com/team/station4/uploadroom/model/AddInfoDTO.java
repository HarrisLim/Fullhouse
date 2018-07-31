package com.team.station4.uploadroom.model;

import java.sql.Date;

public class AddInfoDTO {
	int addInfo_no;
	int costFee;
	int parking;
	int elevator;
	String heat;
	int animal;
	Date moveDate;
	int option_no;
	int cost_no;
	
	public AddInfoDTO() {}
	
	public AddInfoDTO(int addInfo_no, int costFee, int parking, int elevator, String heat, int animal, Date moveDate,
			int option_no, int cost_no) {
		super();
		this.addInfo_no = addInfo_no;
		this.costFee = costFee;
		this.parking = parking;
		this.elevator = elevator;
		this.heat = heat;
		this.animal = animal;
		this.moveDate = moveDate;
		this.option_no = option_no;
		this.cost_no = cost_no;
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
	public int getOption_no() {
		return option_no;
	}
	public void setOption_no(int option_no) {
		this.option_no = option_no;
	}
	public int getCost_no() {
		return cost_no;
	}
	public void setCost_no(int cost_no) {
		this.cost_no = cost_no;
	}
	
	
}
