package com.team.station4.staff.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.staff.model.StaffDTO;

@Repository
public class StaffDAOImpl implements StaffDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	String ns = "com.team.station4.Staff";
	
	@Override
	public void StaffInsert(StaffDTO dto2) {
		// TODO Auto-generated method stub
		sqlSession.insert(ns + ".staffInsert", dto2);

	}

}
