package com.team.station4.map.model.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.vo.PagingVo;
import com.team.station4.room.model.RequestDTO;
import com.team.station4.uploadroom.model.PriceDTO;

public interface MapService {
	
	List<BuildDTO> mapListService(Map jsonLatLng);
	int countClusterService(Map jsonLatLng);
	List<BuildDTO> locationService();
	List<BuildDTO> latLngService(HashMap hm);
	void makeImage(int count);
	List<Double>randomLat(int count);
	List<Double>randomLng(int count);
	void insertInjectionService(BuildDTO dto);
	void insertPriceService(HashMap price);
	int countService();
	
	/* jsl */
	int countBuildService(Map hm);
	List<BuildDTO> selectDeleteListService(Map hm);
	void deleteAddinfoService(BuildDTO buildDTO);
	void deletePriceService(BuildDTO buildDTO);
	void deleteRequestService(BuildDTO buildDTO);
	void deleteReservationService(BuildDTO buildDTO);
	void deleteBuildingService(Map hm);
	void deleteStaffService(Map hm);
	List<BuildDTO> selectBuildRequestService(int estate_no);
	Map<String, Object> selectRequestService(Map rMap);
	void deleteRequestDoneCallService(int request_no);
	
	List<BuildDTO>clusterListService(Map map);
	void InsertAddInfoService(HashMap addInfo);
	int myMaxService();
	void memHotUpdateService(int buildNo);
	int memHotSelectService(int buildNo);
	void memHotDeleteService(int buildNo);
	String myHotService();
	BuildDTO hotListService(int parseInt);
	String myRecentService();
	BuildDTO recentListService(int parseInt);
	int memRecentSelectService(String buildNo);
	void memRecentUpdateService(String reRecent);
	List<BuildDTO> hotListServicePaging(Map<String, Object> jsonLatLng);
	List<PriceDTO> priceSelectService(BuildDTO dto);
	
}
