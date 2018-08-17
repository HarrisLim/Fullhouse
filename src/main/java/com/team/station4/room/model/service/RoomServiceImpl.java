package com.team.station4.room.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.station4.estate.model.EstateDTO;
import com.team.station4.main.model.MainDTO;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.room.model.dao.RoomDAO;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	RoomDAO dao;

	@Override
	public void requestInsertService(HashMap<String, Object> hm) {
		dao.requestInsert(hm);		
	}

	@Override
	public BuildDTO recentListService(int parseInt) {
		return dao.recentList(parseInt);
	}

	@Override
	public AddInfoDTO addInfoSelectService(int buildNo) {
		return dao.addInfoSelect(buildNo);
	}
	
	@Override
	public MainDTO memInfoService(int mem_no) {
		return dao.memInfo(mem_no);
	}

	@Override
	public StaffDTO staffInfoService(int st_no) {
		return dao.staffInfo(st_no);
	}

	@Override
	public EstateDTO estateInfoService(int estate_no) {
		return dao.estateInfo(estate_no);
	}

	@Override
	public void viewCountInsertService(HashMap hm) {
		dao.viewCountInsert(hm);
		
	}

	@Override
	public int viewCountCheckService(int build_no) {
		return dao.viewCountCheck(build_no);
	}
	
	@Override
	public List<PriceDTO> priceSelectService(BuildDTO dto) {
		return dao.priceSelect(dto);
	}

	@Override
	public int myRequestCountCheckService(HashMap<String, Object> hm) {
		return dao.myRequestCountCheck(hm);
	}

	@Override
	public String myHeartCountCheckService(HashMap<String, Object> hm) {
		return dao.myHeartCountCheck(hm);
	}

	@Override
	public int myCountViewCountCheckService(HashMap<String, Object> hm) {
		return dao.myCountViewCountCheck(hm);
	}
	


}
