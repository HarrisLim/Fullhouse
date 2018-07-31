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
}
