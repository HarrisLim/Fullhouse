package com.team.station4.injection.model.dao;

import java.util.HashMap;

import com.team.station4.map.model.BuildDTO;

public interface InjectionDAO {

	int myMax();
	void insertInjection(BuildDTO dto);
	int count();
	void insertPrice(HashMap price);
	void InsertAddInfo(HashMap addInfo);

}
