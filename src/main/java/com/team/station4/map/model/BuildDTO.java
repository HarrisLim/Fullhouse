package com.team.station4.map.model;

import java.sql.Date;

public class BuildDTO {

	
	private int build_no;
	private String address;
	private int buildType;
	private String proType;
	private int wholeFloor;
	private int floor;
	private double jArea;
	private double gArea;
	private int view_count;
	private String picPath;
	private String reservation_time;
	private double lat;
	private double lng;
	private String roomTitle;
	private String explainText;
	private String privateMemo;
	private String buildState;
	private Date bu_rdate;
	private int st_no;
	private int estate_no;
	private int mem_no;
	private int addInfo_no;
	
	public BuildDTO() {}

	public BuildDTO(int build_no, String address, int buildType, String proType, int wholeFloor, int floor,
			double jArea, double gArea, int view_count, String picPath, String reservation_time, double lat, double lng,
			String roomTitle, String explainText, String privateMemo, String buildState, Date bu_rdate, int st_no,
			int estate_no, int mem_no, int addInfo_no) {
		super();
		this.build_no = build_no;
		this.address = address;
		this.buildType = buildType;
		this.proType = proType;
		this.wholeFloor = wholeFloor;
		this.floor = floor;
		this.jArea = jArea;
		this.gArea = gArea;
		this.view_count = view_count;
		this.picPath = picPath;
		this.reservation_time = reservation_time;
		this.lat = lat;
		this.lng = lng;
		this.roomTitle = roomTitle;
		this.explainText = explainText;
		this.privateMemo = privateMemo;
		this.buildState = buildState;
		this.bu_rdate = bu_rdate;
		this.st_no = st_no;
		this.estate_no = estate_no;
		this.mem_no = mem_no;
		this.addInfo_no = addInfo_no;
	}

	public BuildDTO(int build_no, String address, String proType, int wholeFloor, int floor, double jArea,
			double gArea, int view_count, String picPath, String reservation_time, double lat, double lng,
			Date bu_rdate, int st_no, int estate_no, int mem_no, int addInfo_no) {
		super();
		this.build_no = build_no;
		this.address = address;
		this.proType = proType;
		this.wholeFloor = wholeFloor;
		this.floor = floor;
		this.jArea = jArea;
		this.gArea = gArea;
		this.view_count = view_count;
		this.picPath = picPath;
		this.reservation_time = reservation_time;
		this.lat = lat;
		this.lng = lng;
		this.bu_rdate = bu_rdate;
		this.st_no = st_no;
		this.estate_no = estate_no;
		this.mem_no = mem_no;
		this.addInfo_no = addInfo_no;
	}
	
	public BuildDTO(String address, String proType, int wholeFloor, int floor, double jArea, double gArea,
			int view_count, String picPath, String reservation_time, double lat, double lng, Date bu_rdate, int st_no,
			int estate_no, int mem_no, int addInfo_no) {
		super();
		this.address = address;
		this.proType = proType;
		this.wholeFloor = wholeFloor;
		this.floor = floor;
		this.jArea = jArea;
		this.gArea = gArea;
		this.view_count = view_count;
		this.picPath = picPath;
		this.reservation_time = reservation_time;
		this.lat = lat;
		this.lng = lng;
		this.bu_rdate = bu_rdate;
		this.st_no = st_no;
		this.estate_no = estate_no;
		this.mem_no = mem_no;
		this.addInfo_no = addInfo_no;
	}

	public int getBuild_no() {
		return build_no;
	}

	public void setBuild_no(int build_no) {
		this.build_no = build_no;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getBuildType() {
		return buildType;
	}

	public void setBuildType(int buildType) {
		this.buildType = buildType;
	}

	public String getProType() {
		return proType;
	}

	public void setProType(String proType) {
		this.proType = proType;
	}

	public int getWholeFloor() {
		return wholeFloor;
	}

	public void setWholeFloor(int wholeFloor) {
		this.wholeFloor = wholeFloor;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public double getjArea() {
		return jArea;
	}

	public void setjArea(double jArea) {
		this.jArea = jArea;
	}

	public double getgArea() {
		return gArea;
	}

	public void setgArea(double gArea) {
		this.gArea = gArea;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public String getReservation_time() {
		return reservation_time;
	}

	public void setReservation_time(String reservation_time) {
		this.reservation_time = reservation_time;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getRoomTitle() {
		return roomTitle;
	}

	public void setRoomTitle(String roomTitle) {
		this.roomTitle = roomTitle;
	}

	public String getExplainText() {
		return explainText;
	}

	public void setExplainText(String explainText) {
		this.explainText = explainText;
	}

	public String getPrivateMemo() {
		return privateMemo;
	}

	public void setPrivateMemo(String privateMemo) {
		this.privateMemo = privateMemo;
	}

	public String getBuildState() {
		return buildState;
	}

	public void setBuildState(String buildState) {
		this.buildState = buildState;
	}

	public Date getBu_rdate() {
		return bu_rdate;
	}

	public void setBu_rdate(Date bu_rdate) {
		this.bu_rdate = bu_rdate;
	}

	public int getSt_no() {
		return st_no;
	}

	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}

	public int getEstate_no() {
		return estate_no;
	}

	public void setEstate_no(int estate_no) {
		this.estate_no = estate_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getAddInfo_no() {
		return addInfo_no;
	}

	public void setAddInfo_no(int addInfo_no) {
		this.addInfo_no = addInfo_no;
	}

	
	
	
}
