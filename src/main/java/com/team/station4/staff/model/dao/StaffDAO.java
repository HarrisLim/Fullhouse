package com.team.station4.staff.model.dao;

import java.util.List;

import com.team.station4.staff.model.StaffDTO;

public interface StaffDAO {
	
	void StaffInsert(StaffDTO dto);
	int semCheck(String email);
	List<StaffDTO> estateSelect(int estate_no);
	void verifyUpdate(int st_no);
}
