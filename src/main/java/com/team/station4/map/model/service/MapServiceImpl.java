package com.team.station4.map.model.service;

import java.awt.Color;

import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.station4.estate.model.EstateDTO;
import com.team.station4.main.model.MainDTO;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.model.dao.MapDAO;
import com.team.station4.map.vo.PagingVo;
import com.team.station4.room.model.RequestDTO;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;

@Service
public class MapServiceImpl implements MapService {
	@Autowired
	MapDAO dao;
	

	@Override
	public List<HashMap<String, Object>> selectMapService(Map<String, Object> jsonLatLng) {
		return dao.selectMap(jsonLatLng);
	}
	
	@Override
	public List<BuildDTO> mapListService(Map jsonLatLng){
		return dao.mapList(jsonLatLng);
	}
	
	 @Override
	 public int countClusterService(Map jsonLatLng) {
		 return dao.countCluster(jsonLatLng);
	 }

	@Override
	public List<BuildDTO> locationService(){
		return dao.location();
	}
	
	@Override
	public List<BuildDTO> latLngService(HashMap hm){
		return dao.latLng(hm);
	}
	 
	/* jsl */
	@Override
	public int countBuildService(Map hm) {
		return dao.countBuild(hm);
	}
	
	 
	 @Override
	 public List<BuildDTO>clusterListService(Map map){
		 return dao.clusterList(map);
	 }
	 

	@Override
	public void memHotUpdateService(HashMap<String, Object> hm) {
		dao.memHotUpdate(hm);
	}

	@Override
	public int memHotSelectService(HashMap<String, Object> hm) {
		return dao.memHotSelect(hm);
	}

	@Override
	public void memHotDeleteService(HashMap<String, Object> hm) {
		dao.memHotDelete(hm);
		
	}

	@Override
	public String myHotService(String email) {
		return dao.myHot(email);
	}

	@Override
	public BuildDTO hotListService(int parseInt) {
		return dao.hotList(parseInt);
		
	}

	@Override
	public String myRecentService(String email) {
		return dao.myRecent(email);
	}

	@Override
	public BuildDTO recentListService(int parseInt) {
		// TODO Auto-generated method stub
		return dao.recentList(parseInt);
	}

	@Override
	public int memRecentSelectService(HashMap<String, Object> hm) {
		return dao.memRecentSelect(hm);
	}

	@Override
	public void memRecentUpdateService(HashMap<String, Object> hm) {
		dao.memRecentUpdate(hm);	
	}

	@Override
	public List<BuildDTO> hotListServicePaging(Map<String, Object> jsonLatLng) {
		return dao.hotListPaging(jsonLatLng);
	}

	@Override
	public List<BuildDTO> selectDeleteListService(Map hm) {
		return dao.selectDeleteList(hm);
	}

	@Override
	public void deleteAddinfoService(BuildDTO buildDTO) {
		dao.deleteAddinfo(buildDTO);
	}

	@Override
	public void deletePriceService(BuildDTO buildDTO) {
		dao.deletePrice(buildDTO);
	}

	@Override
	public void deleteRequestService(BuildDTO buildDTO) {
		dao.deleteRequest(buildDTO);
	}

	@Override
	public void deleteReservationService(BuildDTO buildDTO) {
		dao.deleteReservation(buildDTO);
	}

	@Override
	public void deleteBuildingService(Map hm) {
		dao.deleteBuilding(hm);
	}

	@Override
	public void deleteStaffService(Map hm) {
		dao.deleteStaff(hm);
	}

	@Override
	public List<BuildDTO> selectBuildRequestService(int estate_no) {
		return dao.selectBuildRequest(estate_no);
	}

	@Override
	public Map<String, Object> selectRequestService(Map rMap) {
		return dao.selectRequest(rMap);
	}

	@Override
	public void deleteRequestDoneCallService(int request_no) {
		dao.deleteRequestDoneCall(request_no);
	}
	
	public List<PriceDTO> priceSelectService(BuildDTO dto) {
		return dao.priceSelect(dto);
	}

	
	/* admin 그래프 */
		/* 매물현황 */
	@Override
	public int selectBuildPieService(Map<String, Object> buildPieMap) {
		return dao.selectBuildPie(buildPieMap);
	}

	@Override
	public int selectBuildBarService(Map<String, Object> buildBarMap) {
		return dao.selectBuildBar(buildBarMap);
	}

	@Override
	public int selectBuildLineService(Map<String, Object> buildLineMap) {
		return dao.selectBuildLine(buildLineMap);
	}

		/* 매출현황 */
	@Override
	public int selectBuildBarYearService(Map<String, Object> buildBarYearMap) {
		return dao.selectBuildBarYear(buildBarYearMap);
	}

	@Override
	public int selectBuildBarMonthService(Map<String, Object> buildBarMonthMap) {
		return dao.selectBuildBarMonth(buildBarMonthMap);
	}

	@Override
	public int selectBuildLineYearService(Map<String, Object> buildLineYearMap) {
		return dao.selectBuildLineYear(buildLineYearMap);
	}

	@Override
	public int selectBuildLineDayService(Map<String, Object> buildLineDayMap) {
		return dao.selectBuildLineDay(buildLineDayMap);
	}
	@Override
	public List<BuildDTO> selectBuildAllService(Map<String, Object> hm) {
		return dao.selectBuildAll(hm);
	}

	@Override
	public int countBuildAllService() {
		return dao.countBuildAll();
	}

	@Override
	public List<HashMap<String, Object>> recentListPrintService(HashMap<String, Object> hm) {

		return dao.recentListPrint(hm);
	}

	@Override
	public List<BuildDTO> mySerchAutoService(String address) {
		return dao.mySerchAuto(address);
	}

	@Override
	public List<BuildDTO> mySearchAddressService(String address) {
		return dao.mySearchAddress(address);
	}

	@Override
	public List<BuildDTO> mySearchAreaService(String address) {
		return dao.mySearchArea(address);
	}


}
