package com.team.station4.manageroom.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.staff.model.StaffDTO;

@Repository
public class ManageroomDAOImpl implements ManageroomDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String ns = "com.team.station4";

	@Override
	public int mrEstateNoSelect(String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BuildDTO> mrBuildSelect(int estateNo) {
		return sqlSession.selectList(ns+".map.mySelectEstate", estateNo);
	}

	@Override
	public List<StaffDTO> mrStaffSelect(int estateNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
