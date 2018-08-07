package com.team.station4.main.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.main.model.MainDTO;

@Repository
public class MainDAOImpl implements MainDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	String ns = "com.team.station4.main";
	
	@Override
	public void memberInsert(MainDTO member) {
		// TODO Auto-generated method stub
			sqlSession.insert(ns + ".memInsert", member);
			
		}
	
	@Override
	public String emCheck(MainDTO dto) {
		// TODO Auto-generated method stub
		String email = sqlSession.selectOne(ns +".emCheck", dto);
		
		return email;
	}
	@Override
	public int log1Check(MainDTO dto) {
		// TODO Auto-generated method stub
		int emCount = sqlSession.selectOne(ns + ".log1Check", dto);
		return emCount;
	}
	
	@Override
	public int log2Check(MainDTO dto) {
		// TODO Auto-generated method stub
		int pwCount = sqlSession.selectOne(ns + ".log2Check", dto);
		
		return pwCount;
	}
	
}
