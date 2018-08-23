package com.team.station4.map.model.dao;

import java.util.Date;
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

public interface MapDAO {
	List<HashMap<String, Object>> selectMap(Map<String, Object> jsonLatLng);
	List<BuildDTO> mapList(Map jsonLatLng);
	int countCluster(Map jsonLatLng);
	List<BuildDTO> location();
	List<BuildDTO>latLng(HashMap hm);
	
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
	List<BuildDTO> selectBuildAll(Map<String, Object> hm);
	int countBuildAll();
	
	List<BuildDTO>clusterList(Map hm);

	void memHotUpdate(HashMap<String, Object> hm);
	int memHotSelect(HashMap<String, Object> hm);
	void memHotDelete(HashMap<String, Object> hm);
	String myHot(String email);
	BuildDTO hotList(int parseInt);
	String myRecent(String email);
	BuildDTO recentList(int parseInt);
	int memRecentSelect(HashMap<String, Object> hm);
	void memRecentUpdate(HashMap<String, Object> hm);
	List<BuildDTO> hotListPaging(Map<String, Object> jsonLatLng);
	List<PriceDTO> priceSelect(BuildDTO dto);
	
	/* admin 그래프 */
		/* 매물현황 */
	int selectBuildPie(Map<String, Object> buildPieMap);
	int selectBuildBar(Map<String, Object> buildBarMap);
	int selectBuildLine(Map<String, Object> buildLineMap);
		/* 매출현황 */
	int selectBuildBarYear(Map<String, Object> buildBarYearMap);
	int selectBuildBarMonth(Map<String, Object> buildBarMonthMap);
	int selectBuildLineYear(Map<String, Object> buildLineYearMap);
	int selectBuildLineDay(Map<String, Object> buildLineDayMap);
	List<HashMap<String, Object>> recentListPrint(HashMap<String, Object> hm);
	List<BuildDTO> mySerchAuto(String address);
	List<BuildDTO> mySearchAddress(String address);
	List<BuildDTO> mySearchArea(String address);
	
}
