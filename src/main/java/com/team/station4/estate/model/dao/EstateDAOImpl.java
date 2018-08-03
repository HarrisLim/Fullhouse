package com.team.station4.estate.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.estate.model.EstateDTO;

@Repository
public class EstateDAOImpl implements EstateDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	String ns = "com.team.station4.estate";
	
	@Override
	public void promemberInsert(EstateDTO estate) {
		// TODO Auto-generated method stub
		sqlSession.insert(ns + ".proInsert", estate);
	}
	@Override
	public EstateDTO procheck(EstateDTO dto) {
		// TODO Auto-generated method stub
		EstateDTO dto2= sqlSession.selectOne(ns+".lrnoCheck", dto);
		return dto2;
	}
	@Override
	public EstateDTO esselect(EstateDTO dto) {
		// TODO Auto-generated method stub
		EstateDTO estateno = sqlSession.selectOne(ns+".esSelect", dto);
		return estateno;
	}
	@Override
	public EstateDTO lrselect(EstateDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("erno : " + dto.getLrno());
		EstateDTO erno = sqlSession.selectOne(ns+".esSelect2", dto);
		return erno;
	}
}
