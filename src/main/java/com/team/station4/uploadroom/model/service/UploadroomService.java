package com.team.station4.uploadroom.model.service;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.CostOptionDTO;
import com.team.station4.uploadroom.model.ExplainDTO;
import com.team.station4.uploadroom.model.MonthlyDTO;
import com.team.station4.uploadroom.model.OptionsDTO;
import com.team.station4.uploadroom.model.PriceDTO;

public interface UploadroomService{
	void optionsInsertService(OptionsDTO optionsDTO);
	int optionsSelectService();
	void costOPtionInsertService(CostOptionDTO costOptionDTO);
	int costOptionSelectService();
	void addInfoInsertService(AddInfoDTO addInfoDTO);
	int addInfoSelectService();
	void explainInsertService(ExplainDTO explainDTO);
	int explainSelectService();
	void buildingInsertService(BuildDTO buildDTO);
	int buildingSelectService();
	void priceInsertService(PriceDTO priceDTO);
	int priceSelectService();
	void monthlyInsertService(MonthlyDTO monthlyDTO);
	int monthlySelectService();
}