package com.team.station4.map.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.vo.PagingVo;
import com.team.station4.room.model.RequestDTO;

@Repository
public class MapDAOImpl implements MapDAO {
	
	@Autowired
	SqlSessionTemplate sqlsession;
	private String ns = "com.team.station4.map";
	
	@Override
	public List<BuildDTO> mapList(Map jsonLatLng){
		return sqlsession.selectList(ns+".mySelect", jsonLatLng);
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
	public void insertInjection(BuildDTO dto) {
		sqlsession.insert(ns+".myInjection", dto);
	}
	
	@Override
	public void insertPrice(HashMap price) {
		sqlsession.insert(ns+".myInsertPrice", price);
	}
	
	@Override
	public int count() {
		return sqlsession.selectOne(ns+".myCount");
	}
	
	@Override
	public List<BuildDTO>clusterList(Map hm){
		return sqlsession.selectList(ns+".myClusterList", hm);
	}
	
	@Override
	public void InsertAddInfo(HashMap addInfo) {
		sqlsession.insert(ns+".myInsertAddInfo", addInfo);
	}


	@Override
	public int myMax() {
		return sqlsession.selectOne(ns+".myMax");
	}

	///// 아래부터 찜 관련 ///////////
	@Override
	public void memHotUpdate(int buildNo) {
		sqlsession.update(ns+".myMemHotUpdate", buildNo);
	}


	@Override
	public int memHotSelect(int buildNo) {
		return sqlsession.selectOne(ns+".myHotSelect", buildNo);
	}


	@Override
	public void memHotDelete(int buildNo) {
		sqlsession.update(ns+".myMemHotDelete", buildNo);	
	}


	@Override
	public String myHot() {
		return sqlsession.selectOne(ns+".myHot");
	}


	@Override
	public BuildDTO hotList(int parseInt) {
		return sqlsession.selectOne(ns+".myHotList", parseInt);
	}

	@Override
	public String myRecent() {
		return sqlsession.selectOne(ns+".myRecent");
	}


	@Override
	public BuildDTO recentList(int parseInt) {
		return sqlsession.selectOne(ns+".myRecentList", parseInt);
	}


	@Override
	public int memRecentSelect(String buildNo) {
		return sqlsession.selectOne(ns+".myRecentSelect", buildNo);
	}


	@Override
	public void memRecentUpdate(String reRecent) {
		sqlsession.update(ns+".myMemRecentUpdate", reRecent);
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

	
	
}
