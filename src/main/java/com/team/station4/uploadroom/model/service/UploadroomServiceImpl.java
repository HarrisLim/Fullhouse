package com.team.station4.uploadroom.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.CostOptionDTO;
import com.team.station4.uploadroom.model.ExplainDTO;
import com.team.station4.uploadroom.model.MonthlyDTO;
import com.team.station4.uploadroom.model.OptionsDTO;
import com.team.station4.uploadroom.model.PriceDTO;
import com.team.station4.uploadroom.model.dao.UploadroomDAO;

@Service
public class UploadroomServiceImpl implements UploadroomService {
	@Autowired
	private UploadroomDAO urDAO;
	
	@Override
	public void optionsInsertService(OptionsDTO optionsDTO) {
		urDAO.optionsInsert(optionsDTO);
	}

	@Override
	public int optionsSelectService() {
		return urDAO.optionsSelect();
	}

	@Override
	public void costOPtionInsertService(CostOptionDTO costOptionDTO) {
		urDAO.costOPtionInsert(costOptionDTO);
	}

	@Override
	public int costOptionSelectService() {
		return urDAO.costOptionSelect();
	}

	@Override
	public void addInfoInsertService(AddInfoDTO addInfoDTO) {
		urDAO.addInfoInsert(addInfoDTO);
	}

	@Override
	public int addInfoSelectService() {
		return urDAO.addInfoSelect();
	}

	@Override
	public void explainInsertService(ExplainDTO explainDTO) {
		urDAO.explainInsert(explainDTO);
	}

	@Override
	public int explainSelectService() {
		return urDAO.explainSelect();
	}

	@Override
	public void buildingInsertService(BuildDTO buildDTO) {
		urDAO.buildingInsert(buildDTO);
	}

	@Override
	public int buildingSelectService() {
		return urDAO.buildingSelect();
	}

	@Override
	public void priceInsertService(PriceDTO priceDTO) {
		urDAO.priceInsert(priceDTO);
	}

	@Override
	public int priceSelectService() {
		return urDAO.priceSelect();
	}

	@Override
	public void monthlyInsertService(MonthlyDTO monthlyDTO) {
		urDAO.monthlyInsert(monthlyDTO);
	}

	@Override
	public int monthlySelectService() {
		return urDAO.monthlySelect();
	}

}
