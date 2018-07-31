package com.team.station4.estate.model.dao;

import java.util.List;

import com.team.station4.estate.model.EstateDTO;

public interface EstateDAO {
	
	void promemberInsert(EstateDTO estate);
	int procheck(String lrno);
}
