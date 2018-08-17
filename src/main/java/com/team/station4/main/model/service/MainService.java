package com.team.station4.main.model.service;

import com.team.station4.main.model.MainDTO;

public interface MainService {
	
	void memberInsertS(MainDTO member);
	String emCheckS(MainDTO dto);
	int log1CheckS(MainDTO dto);
	int log2CheckS(MainDTO dto);
	String memNameS(MainDTO dto);
	MainDTO getUsersByID(String mem_email);
	int chkPwS(MainDTO dto);
	void changeInfoS(MainDTO dto);
	
}
