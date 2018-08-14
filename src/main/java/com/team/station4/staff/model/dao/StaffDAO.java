package com.team.station4.staff.model.dao;

import com.team.station4.staff.model.StaffDTO;

public interface StaffDAO {
	
	void StaffInsert(StaffDTO dto);
	int semCheck(String email);
	StaffDTO staffSecurity(String st_email);
	
}
