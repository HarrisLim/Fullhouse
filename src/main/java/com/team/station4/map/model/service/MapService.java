package com.team.station4.map.model.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.team.station4.estate.model.EstateDTO;
import com.team.station4.main.model.MainDTO;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.vo.PagingVo;
import com.team.station4.room.model.RequestDTO;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;

public interface MapService {
	
	List<BuildDTO> mapListService(Map jsonLatLng);
	int countClusterService(Map jsonLatLng);
	List<BuildDTO> locationService();
	List<BuildDTO> latLngService(HashMap hm);
	void makeImage(int count);
	
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
	
	void memHotUpdateService(HashMap<String, Object> hm);
	int memHotSelectService(HashMap<String, Object> hm);
	void memHotDeleteService(HashMap<String, Object> hm);
	String myHotService(String email);
	BuildDTO hotListService(int parseInt);
	String myRecentService(String email);
	BuildDTO recentListService(int parseInt);
	int memRecentSelectService(HashMap<String, Object> hm);
	void memRecentUpdateService(HashMap<String, Object> hm);
	List<BuildDTO> hotListServicePaging(Map<String, Object> jsonLatLng);
	List<PriceDTO> priceSelectService(BuildDTO dto);
	
	
}
