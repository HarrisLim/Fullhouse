package com.team.station4.map.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.vo.PagingVo;

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

}
