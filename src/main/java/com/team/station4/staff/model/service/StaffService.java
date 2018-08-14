package com.team.station4.staff.model.service;

import java.util.List;

import com.team.station4.staff.model.StaffDTO;

public interface StaffService {
	
	void StaffInsertS(StaffDTO dto2);
	int semCheckS(String email);
	List<StaffDTO> estateSelectService(int estate_no);
	void verifyUpdateService(int st_no);
	StaffDTO getUsersByID(String st_email);
}
