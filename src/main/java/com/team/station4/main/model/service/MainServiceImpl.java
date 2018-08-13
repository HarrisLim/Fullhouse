package com.team.station4.main.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.station4.main.model.MainDTO;
import com.team.station4.main.model.dao.MainDAO;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	MainDAO maindao;
	
	@Override
	public void memberInsertS(MainDTO member) {
		// TODO Auto-generated method stub
		maindao.memberInsert(member);	
	}
	@Override
	public String emCheckS(MainDTO dto) {
		// TODO Auto-generated method stub
		return maindao.emCheck(dto);
	}
	@Override
	public int log1CheckS(MainDTO dto) {
		// TODO Auto-generated method stub
		return maindao.log1Check(dto);
	}
	@Override
	public int log2CheckS(MainDTO dto) {
		// TODO Auto-generated method stub
		return maindao.log2Check(dto);
	}
	@Override
	public String memNameS(MainDTO dto) {
		// TODO Auto-generated method stub
		return maindao.memName(dto);
	}
	@Override
	public MainDTO getUsersByID(String mem_email) {
		// TODO Auto-generated method stub
		return mainDao.securitygetUsersByID(mem_email);
	}
}
