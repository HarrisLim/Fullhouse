package com.team.station4.room.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.estate.model.EstateDTO;
import com.team.station4.main.model.MainDTO;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;

@Repository
public class RoomDAOImpl implements RoomDAO {
	@Autowired
	SqlSessionTemplate sqlsession;
	String ns = "com.team.station4.request";
	String bd = "com.team.station4.map";
	
	@Override
	public void requestInsert(HashMap<String, Object> hm) {
		sqlsession.insert(ns+".myRequestInsert", hm);
	}
	
	@Override
	public List<PriceDTO> priceSelect(BuildDTO BuildDTO) {
		return sqlsession.selectList(bd+".myPriceSelect", BuildDTO);
	}

	@Override
	public BuildDTO recentList(int parseInt) {
		return sqlsession.selectOne(bd+".myRecentList", parseInt);
	}

	@Override
	public AddInfoDTO addInfoSelect(int buildNo) {
		return sqlsession.selectOne(ns+".myAddInfoSelect", buildNo);
	}

	@Override
	public MainDTO memInfo(int mem_no) {
		return sqlsession.selectOne(ns+".myMemInfo", mem_no);
	}


	@Override
	public StaffDTO staffInfo(int st_no) {
		return sqlsession.selectOne(ns+".myStaffInfo", st_no);
	}


	@Override
	public EstateDTO estateInfo(int estate_no) {
		return sqlsession.selectOne(ns+".myEstateInfo", estate_no);
	}


	@Override
	public void viewCountInsert(HashMap hm) {
		sqlsession.insert(ns+".myViewCountInsert", hm);
	}


	@Override
	public int viewCountCheck(int build_no) {
		return sqlsession.selectOne(ns+".myViewCountCheck", build_no);
	}

	@Override
	public int myRequestCountCheck(HashMap<String, Object> hm) {
		return sqlsession.selectOne(ns+".myRequestCountCheck", hm);
	}

	@Override
	public String myHeartCountCheck(HashMap<String, Object> hm) {
		return sqlsession.selectOne(ns+".myHeartCountCheck", hm);
	}

	@Override
	public int myCountViewCountCheck(HashMap<String, Object> hm) {
		return sqlsession.selectOne(ns+".myCountViewCountCheck", hm);
	}
}
