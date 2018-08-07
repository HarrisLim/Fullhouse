package com.team.station4.manageroom.service;

import java.util.List;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.staff.model.StaffDTO;

public interface ManageroomService {
	int mrEstateNoSelectService(String email); // 회원 email로 공인중개소번호 알아내기  
	List<BuildDTO> mrBuildSelectService(int estateNo);
	List<StaffDTO> mrStaffSelectService(int estateNo);
}
