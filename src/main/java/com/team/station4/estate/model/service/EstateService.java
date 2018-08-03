package com.team.station4.estate.model.service;

import com.team.station4.estate.model.EstateDTO;

public interface EstateService {
	
	void promemberInsertS(EstateDTO estate);
	EstateDTO proCheckS(EstateDTO dto);
	EstateDTO esSelectS(EstateDTO dto);
	EstateDTO lrSelectS(EstateDTO dto);
}
