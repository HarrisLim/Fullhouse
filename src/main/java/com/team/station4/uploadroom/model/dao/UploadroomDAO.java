package com.team.station4.uploadroom.model.dao;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.CostOptionDTO;
import com.team.station4.uploadroom.model.ExplainDTO;
import com.team.station4.uploadroom.model.MonthlyDTO;
import com.team.station4.uploadroom.model.OptionsDTO;
import com.team.station4.uploadroom.model.PriceDTO;

public interface UploadroomDAO {
	void optionsInsert(OptionsDTO optionsDTO);
	int optionsSelect();
	void costOPtionInsert(CostOptionDTO costOptionDTO);
	int costOptionSelect();
	void addInfoInsert(AddInfoDTO addInfoDTO);
	int addInfoSelect();
	void explainInsert(ExplainDTO explainDTO);
	int explainSelect();
	void buildingInsert(BuildDTO buildDTO);
	int buildingSelect();
	void priceInsert(PriceDTO priceDTO);
	int priceSelect();
	void monthlyInsert(MonthlyDTO monthlyDTO);
	int monthlySelect();
}
