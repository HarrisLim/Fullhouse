package com.team.station4.uploadroom.model;

public class ExplainDTO {
	int explain_no;
	String roomTitle;
	String explainText;
	String privateMemo;
	
	public ExplainDTO(){}

	public ExplainDTO(int explain_no, String roomTitle, String explainText, String privateMemo) {
		super();
		this.explain_no = explain_no;
		this.roomTitle = roomTitle;
		this.explainText = explainText;
		this.privateMemo = privateMemo;
	}

	public int getExplain_no() {
		return explain_no;
	}

	public void setExplain_no(int explain_no) {
		this.explain_no = explain_no;
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
	
}
