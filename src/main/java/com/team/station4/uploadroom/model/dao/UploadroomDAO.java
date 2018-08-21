package com.team.station4.uploadroom.model.dao;

import java.util.Map;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;

public interface UploadroomDAO {
	void addInfoInsert(AddInfoDTO addInfoDTO);
	int addInfoSelect();
	void buildingInsert(Map<String, Object> Hmap);
	int buildingSelect();
	void priceInsert(PriceDTO priceDTO);
	void priceMonthlyInsert(PriceDTO priceDTO);
}
