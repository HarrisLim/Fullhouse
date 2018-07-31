package com.team.station4.estate.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.station4.estate.model.EstateDTO;
import com.team.station4.estate.model.dao.EstateDAO;
@Service
public class EstateServiceImpl implements EstateService {

	@Autowired
	EstateDAO estatedao;
	
	@Override
	public void promemberInsertS(EstateDTO estate) {
		// TODO Auto-generated method stub
		estatedao.promemberInsert(estate);
	}
	@Override
	public int proCheckS(String lrno) {
		// TODO Auto-generated method stub
		return estatedao.procheck(lrno);
	}
}
