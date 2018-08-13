package com.team.station4.manageroom.dao;

import java.util.List;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.staff.model.StaffDTO;

public interface ManageroomDAO {
	int mrEstateNoSelect(String email); // 회원 email로 공인중개소번호 알아내기  
	List<BuildDTO> mrBuildSelect(int estateNo);
	List<StaffDTO> mrStaffSelect(int estateNo);
	
}
