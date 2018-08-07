package com.team.station4.uploadroom.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;
import com.team.station4.uploadroom.model.dao.UploadroomDAO;

@Service
public class UploadroomServiceImpl implements UploadroomService {
	@Autowired
	private UploadroomDAO urDAO;

	@Override
	public void addInfoInsertService(AddInfoDTO addInfoDTO) {
		urDAO.addInfoInsert(addInfoDTO);
	}

	@Override
	public int addInfoSelectService() {
		return urDAO.addInfoSelect();
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
	public void priceMonthlyInsertService(PriceDTO priceDTO) {
		urDAO.priceMonthlyInsert(priceDTO);
	}
}
