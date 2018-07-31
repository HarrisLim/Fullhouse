package com.team.station4.estate.model.dao;

import java.util.List;

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
	public int procheck(String lrno) {
		// TODO Auto-generated method stub
		int count = sqlSession.selectOne(ns+".lrnoCheck", lrno);
		System.out.println("dto : " + count);
		return count;
	}
}
