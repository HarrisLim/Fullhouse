package com.team.station4.main.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.station4.main.model.MainDTO;
import com.team.station4.main.model.dao.MainDAO;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	MainDAO mainDao;
	
	@Override
	public void memberInsertS(MainDTO member) {
		// TODO Auto-generated method stub
		mainDao.memberInsert(member);	
		
	}
}
