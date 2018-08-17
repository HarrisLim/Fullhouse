package com.team.station4.estate.model.service;

import com.team.station4.estate.model.EstateDTO;
import com.team.station4.staff.model.StaffDTO;

public interface EstateService {
	
	void promemberInsertS(EstateDTO estate);
	EstateDTO proCheckS(EstateDTO dto);
	EstateDTO esSelectS(EstateDTO dto);
	EstateDTO lrSelectS(EstateDTO dto);
	EstateDTO proOutputS(int eno);
	void addrChangeS(EstateDTO change1);
}
