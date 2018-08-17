package com.team.station4.room.model.dao;

import java.util.HashMap;
import java.util.List;

import com.team.station4.estate.model.EstateDTO;
import com.team.station4.main.model.MainDTO;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;

public interface RoomDAO {
	void requestInsert(HashMap<String, Object> hm);
	BuildDTO recentList(int parseInt);
	AddInfoDTO addInfoSelect(int buildNo);
	void viewCountInsert(HashMap hm);
	EstateDTO estateInfo(int estate_no);
	StaffDTO staffInfo(int st_no);
	MainDTO memInfo(int mem_no);
	int viewCountCheck(int build_no);
	List<PriceDTO> priceSelect(BuildDTO dto);
	int myRequestCountCheck(HashMap<String, Object> hm);
	String myHeartCountCheck(HashMap<String, Object> hm);
	int myCountViewCountCheck(HashMap<String, Object> hm);

}
