package com.team.station4.room.model.service;

import java.util.HashMap;
import java.util.List;

import com.team.station4.estate.model.EstateDTO;
import com.team.station4.main.model.MainDTO;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;

public interface RoomService {

	void requestInsertService(HashMap<String, Object> hm);
	BuildDTO recentListService(int parseInt);
	AddInfoDTO addInfoSelectService(int buildNo);
	MainDTO memInfoService(int mem_no);
	StaffDTO staffInfoService(int st_no);
	EstateDTO estateInfoService(int estate_no);
	void viewCountInsertService(HashMap hm);
	int viewCountCheckService(int build_no);
	List<PriceDTO> priceSelectService(BuildDTO dto);
	int myRequestCountCheckService(HashMap<String, Object> hm);
	String myHeartCountCheckService(HashMap<String, Object> hm);
	int myCountViewCountCheckService(HashMap<String, Object> hm);
}
