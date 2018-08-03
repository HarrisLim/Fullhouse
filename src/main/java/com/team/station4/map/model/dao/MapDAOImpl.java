package com.team.station4.map.model.dao;

import java.util.HashMap;
import java.util.List;

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
	public List<BuildDTO> mapList(PagingVo pagingVo) {
		System.out.println("start: "+pagingVo.getStart()+", last: "+pagingVo.getLast());
		return sqlsession.selectList(ns+".mySelect", pagingVo);

	}
	
	@Override
	public int totalCount() {
		return sqlsession.selectOne(ns+".myCountPage");
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
	public List<BuildDTO> clickClusterer(HashMap hm){
		return sqlsession.selectList(ns+".myCluster", hm);
	}
	
	@Override
	public int countCluster(HashMap hm) {
		return sqlsession.selectOne(ns+".myCountCluster", hm);
	}

}
