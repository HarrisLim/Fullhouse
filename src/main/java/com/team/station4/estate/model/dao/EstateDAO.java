package com.team.station4.estate.model.dao;

import com.team.station4.estate.model.EstateDTO;

public interface EstateDAO {
	
	void promemberInsert(EstateDTO estate);
	EstateDTO procheck(EstateDTO dto);
	EstateDTO esselect(EstateDTO dto);
	EstateDTO lrselect(EstateDTO dto);
}
