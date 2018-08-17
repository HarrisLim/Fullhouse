package com.team.station4.map.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.estate.model.EstateDTO;
import com.team.station4.main.model.MainDTO;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.vo.PagingVo;
import com.team.station4.room.model.RequestDTO;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;

@Repository
public class MapDAOImpl implements MapDAO {
	
	@Autowired
	SqlSessionTemplate sqlsession;
	private String ns = "com.team.station4.map";
	private String bp = "com.team.station4.bp";
	
	@Override
	public List<BuildDTO> mapList(Map jsonLatLng){
		return sqlsession.selectList(bp+".mySelect", jsonLatLng);
	}
	
	
	@Override
	public int countCluster(Map jsonLatLng) {
		return sqlsession.selectOne(ns+".myCountCluster", jsonLatLng);
	}

	@Override
	public List<BuildDTO> location(){
		return sqlsession.selectList(ns+".myLocation");
	}
	
	@Override
	public List<BuildDTO>latLng(HashMap hm){
		return sqlsession.selectList(ns+".myLatLng", hm);
	}
	
	@Override
	public List<BuildDTO>clusterList(Map hm){
		return sqlsession.selectList(ns+".myClusterList", hm);
	}

	///// 아래부터 찜 관련 ///////////
	@Override
	public void memHotUpdate(HashMap<String, Object> hm) {
		sqlsession.update(ns+".myMemHotUpdate", hm);
	}


	@Override
	public int memHotSelect(HashMap<String, Object> hm) {
		return sqlsession.selectOne(ns+".myHotSelect", hm);
	}


	@Override
	public void memHotDelete(HashMap<String, Object> hm) {
		sqlsession.update(ns+".myMemHotDelete", hm);	
	}


	@Override
	public String myHot(String email) {
		return sqlsession.selectOne(ns+".myHot", email);
	}


	@Override
	public BuildDTO hotList(int parseInt) {
		return sqlsession.selectOne(ns+".myHotList", parseInt);
	}

	@Override
	public String myRecent(String email) {
		return sqlsession.selectOne(ns+".myRecent", email);
	}


	@Override
	public BuildDTO recentList(int parseInt) {
		return sqlsession.selectOne(ns+".myRecentList", parseInt);
	}


	@Override
	public int memRecentSelect(HashMap<String, Object> hm) {
		return sqlsession.selectOne(ns+".myRecentSelect", hm);
	}


	@Override
	public void memRecentUpdate(HashMap<String, Object> hm) {
		sqlsession.update(ns+".myMemRecentUpdate", hm);
	}


	@Override
	public List<BuildDTO> hotListPaging(Map<String, Object> jsonLatLng) {
		return sqlsession.selectList(ns+".myHotListPaging", jsonLatLng);
	}


	/* jsl */
	@Override
	public int countBuild(Map hm) {
		return sqlsession.selectOne(ns+".myCountBuild", hm);
	}


	@Override
	public List<BuildDTO> selectDeleteList(Map hm) {
		return sqlsession.selectList(ns+".selectDeleteList", hm);
	}


	@Override
	public void deleteAddinfo(BuildDTO buildDTO) {
		sqlsession.delete(ns+".deleteAddinfo", buildDTO);
	}


	@Override
	public void deletePrice(BuildDTO buildDTO) {
		sqlsession.delete(ns+".deletePrice", buildDTO);
	}


	@Override
	public void deleteRequest(BuildDTO buildDTO) {
		sqlsession.delete(ns+".deleteRequest", buildDTO);
	}


	@Override
	public void deleteReservation(BuildDTO buildDTO) {
		sqlsession.delete(ns+".deleteReservation", buildDTO);
	}


	@Override
	public void deleteBuilding(Map hm) {
		sqlsession.delete(ns+".deleteBuilding", hm);
	}


	@Override
	public void deleteStaff(Map hm) {
		sqlsession.delete(ns+".deleteStaff", hm);
	}


	@Override
	public List<BuildDTO> selectBuildRequest(int estate_no) {
		return sqlsession.selectList(ns+".selectBuildRequest", estate_no);
	}

	@Override
	public Map<String, Object> selectRequest(Map rMap) {
		return sqlsession.selectOne("com.team.station4.request.selectRequest", rMap);
	}

	@Override
	public void deleteRequestDoneCall(int request_no) {
		sqlsession.delete("com.team.station4.request.myDeleteDoneCall", request_no);
	}
	
	public List<PriceDTO> priceSelect(BuildDTO BuildDTO) {
		return sqlsession.selectList(ns+".myPriceSelect", BuildDTO);
	}

}
