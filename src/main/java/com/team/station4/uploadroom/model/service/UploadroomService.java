package com.team.station4.uploadroom.model.service;

import java.util.Map;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;

public interface UploadroomService{
	void addInfoInsertService(AddInfoDTO addInfoDTO);
	int addInfoSelectService();
	void buildingInsertService(Map<String, Object> Hmap);
	int buildingSelectService();
	void priceInsertService(PriceDTO priceDTO);
	void priceMonthlyInsertService(PriceDTO priceDTO);
}