package com.team.station4.estate.model.service;

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
	public EstateDTO proCheckS(EstateDTO dto) {
		// TODO Auto-generated method stub
		return estatedao.procheck(dto);
	}
	@Override
	public EstateDTO esSelectS(EstateDTO dto) {
		// TODO Auto-generated method stub
		return estatedao.esselect(dto);
	}
	@Override
	public EstateDTO lrSelectS(EstateDTO dto) {
		// TODO Auto-generated method stub
		return estatedao.lrselect(dto);
	}
	@Override
	public EstateDTO proOutputS(int eno) {
		// TODO Auto-generated method stub
		return estatedao.proOutput(eno);
	}
	@Override
	public void addrChangeS(EstateDTO change1) {
		// TODO Auto-generated method stub
		estatedao.addrChange(change1);
	}
}
