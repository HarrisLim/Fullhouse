package com.team.station4.map.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.vo.PagingVo;
import com.team.station4.room.model.RequestDTO;
import com.team.station4.uploadroom.model.PriceDTO;

public interface MapDAO {

	List<BuildDTO> mapList(Map jsonLatLng);
	int countCluster(Map jsonLatLng);
	List<BuildDTO> location();
	List<BuildDTO>latLng(HashMap hm);
	void insertInjection(BuildDTO dto);
	void insertPrice(HashMap price);
	int count();
	
	/* jsl */
	int countBuild(Map hm);
	List<BuildDTO> selectDeleteList(Map hm);
	void deleteAddinfo(BuildDTO buildDTO);
	void deletePrice(BuildDTO buildDTO);
	void deleteRequest(BuildDTO buildDTO);
	void deleteReservation(BuildDTO buildDTO);
	void deleteBuilding(Map hm);
	void deleteStaff(Map hm);
	List<BuildDTO> selectBuildRequest(int estate_no);
	Map<String, Object> selectRequest(Map rMap);
	void deleteRequestDoneCall(int request_no);
	
	List<BuildDTO>clusterList(Map hm);
	void InsertAddInfo(HashMap addInfo);
	int myMax();
	void memHotUpdate(int buildNo);
	int memHotSelect(int buildNo);
	void memHotDelete(int buildNo);
	String myHot();
	BuildDTO hotList(int parseInt);
	String myRecent();
	BuildDTO recentList(int parseInt);
	int memRecentSelect(String buildNo);
	void memRecentUpdate(String reRecent);
	List<BuildDTO> hotListPaging(Map<String, Object> jsonLatLng);
	List<PriceDTO> priceSelect(BuildDTO dto);
	
}
