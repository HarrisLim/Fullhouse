package com.team.station4.map.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.map.model.MapDTO;
import com.team.station4.map.vo.PagingVo;

@Repository
public class MapDAOImpl implements MapDAO {
	
	@Autowired
	SqlSessionTemplate sqlsession;
	private String ns = "com.team.station4.map";
	
	@Override
	public List<MapDTO> mapList(PagingVo pagingVo) {
		System.out.println("start: "+pagingVo.getStart()+", last: "+pagingVo.getLast());
		return sqlsession.selectList(ns+".mySelect", pagingVo);

	}
	
	@Override
	public int totalCount() {
		return sqlsession.selectOne(ns+".myCountPage");
	}
	
	@Override
	public List<MapDTO> location(){
		return sqlsession.selectList(ns+".myLocation");
	}

}
