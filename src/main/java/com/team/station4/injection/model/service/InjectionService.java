package com.team.station4.injection.model.service;

import java.util.HashMap;
import java.util.List;

import com.team.station4.map.model.BuildDTO;

public interface InjectionService {
	int myMaxService();
	List<Double>randomLat(int count);
	List<Double>randomLng(int count);
	void insertInjectionService(BuildDTO dto);
	void insertPriceService(HashMap price);
	int countService();
	void InsertAddInfoService(HashMap<String, Object> addInfo);
	
}
