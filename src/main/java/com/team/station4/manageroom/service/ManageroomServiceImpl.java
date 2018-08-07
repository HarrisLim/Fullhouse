package com.team.station4.manageroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.station4.manageroom.dao.ManageroomDAO;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.staff.model.StaffDTO;

@Service
public class ManageroomServiceImpl implements ManageroomService {
	@Autowired
	private ManageroomDAO mrDAO;
	
	@Override
	public int mrEstateNoSelectService(String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BuildDTO> mrBuildSelectService(int estateNo) {
		return mrDAO.mrBuildSelect(estateNo);
	}

	@Override
	public List<StaffDTO> mrStaffSelectService(int estateNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
