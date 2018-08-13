package com.team.station4.main.model.dao;

import com.team.station4.main.model.MainDTO;

public interface MainDAO {
	
	void memberInsert(MainDTO member);
	String emCheck(MainDTO dto);
	int log1Check(MainDTO dto);
	int log2Check(MainDTO dto);
	MainDTO securitygetUsersByID(String mem_email);
}
