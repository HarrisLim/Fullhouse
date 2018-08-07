package com.team.station4.uploadroom.model.service;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;

public interface UploadroomService{
	void addInfoInsertService(AddInfoDTO addInfoDTO);
	int addInfoSelectService();
	void buildingInsertService(BuildDTO buildDTO);
	int buildingSelectService();
	void priceInsertService(PriceDTO priceDTO);
	void priceMonthlyInsertService(PriceDTO priceDTO);
}