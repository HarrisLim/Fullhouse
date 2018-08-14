package com.team.station4.manageroom.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.station4.manageroom.dao.ManageroomDAO;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.uploadroom.model.PriceDTO;

@Service
public class ManageroomServiceImpl implements ManageroomService {
	@Autowired
	private ManageroomDAO mrDAO;
	
	@Override
	public int mrEstateNoSelectService(String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BuildDTO> mrBuildSelectService(Map hm) {
		return mrDAO.mrBuildSelect(hm);
	}

	@Override
	public List<StaffDTO> mrStaffSelectService(int estateNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PriceDTO> mrPriceSelectService(BuildDTO buildDTO) {
		return mrDAO.mrPriceSelect(buildDTO);
	}

	@Override
	public void mrPrivateMemoUpdateService(Map<String, Object> map) {
		mrDAO.mrPrivateMemoUpdate(map);
	}

	@Override
	public void mrDeleteReservationService(int build_no) {
		mrDAO.mrDeleteReservation(build_no);
	}

	@Override
	public void mrDeletePriceService(int build_no) {
		mrDAO.mrDeletePrice(build_no);		
	}

	@Override
	public void mrDeleteRequestService(int build_no) {
		mrDAO.mrDeleteRequest(build_no);
	}
	
	@Override
	public void mrDeleteAddinfoService(int build_no) {
		mrDAO.mrDeleteAddinfo(build_no);
	}

	@Override
	public void mrDeleteBuildService(int build_no) {
		mrDAO.mrDeleteBuild(build_no);
	}

	@Override
	public List<BuildDTO> mrSearchBuildNoSelectService(Map<String, Object> hm) {
		return mrDAO.mrSearchBuildNoSelect(hm);
	}

	@Override
	public List<BuildDTO> mrSearchBuildTitleSelectService(Map<String, Object> hm) {
		return mrDAO.mrSearchBuildTitleSelect(hm);
	}

	@Override
	public List<BuildDTO> mrSearchBuildMemoSelectService(Map<String, Object> hm) {
		return mrDAO.mrSearchBuildMemoSelect(hm);
	}
	
	
}
