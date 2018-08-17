package com.team.station4.staff.model.service;

import java.util.List;

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
		staffdao.StaffInsert(dto2);
	}
	@Override
	public int semCheckS(String email) {
		return staffdao.semCheck(email);
	}
	@Override
	public List<StaffDTO> estateSelectService(int estate_no) {
		return staffdao.estateSelect(estate_no);
	}
	@Override
	public void verifyUpdateService(int st_no) {
		staffdao.verifyUpdate(st_no);
	}

	public StaffDTO getUsersByID(String st_email) {
		// TODO Auto-generated method stub
		return staffdao.staffSecurity(st_email);
	}
	@Override
	public void pwChangeS(StaffDTO change2) {
		// TODO Auto-generated method stub
		staffdao.pwChange(change2);
	}
}
