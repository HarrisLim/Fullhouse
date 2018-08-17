package com.team.station4.injection.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.map.model.BuildDTO;

@Repository
public class InjectionDAOImpl implements InjectionDAO {
	@Autowired
	SqlSessionTemplate sqlsession;
	String ns = "com.team.station4.injection";
	


	@Override
	public void insertInjection(BuildDTO dto) {
		sqlsession.insert(ns+".myInjection", dto);
	}
	

	@Override
	public int count() {
		return sqlsession.selectOne(ns+".myCount");
	}

	@Override
	public void insertPrice(HashMap price) {
		sqlsession.insert(ns+".myInsertPrice", price);
	}
	
	@Override
	public int myMax() {
		return sqlsession.selectOne(ns+".myMax");
	}


	@Override
	public void InsertAddInfo(HashMap addInfo) {
		sqlsession.insert(ns+".myInsertAddInfo", addInfo);
	}

}
