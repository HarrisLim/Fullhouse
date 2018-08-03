package com.team.station4.staff.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.station4.staff.model.StaffDTO;
import com.team.station4.staff.model.dao.StaffDAO;

@Service
public class StaffServiceImpl implements StaffService {

	@Autowired
	StaffDAO staffdao;
	
	@Override
	public void StaffInsertS(StaffDTO dto2) {
		// TODO Auto-generated method stub
		staffdao.StaffInsert(dto2);
	}

}
