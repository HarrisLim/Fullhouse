package com.team.station4.manageroom.dao;

import java.util.List;
import java.util.Map;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.uploadroom.model.PriceDTO;

public interface ManageroomDAO {
	int mrEstateNoSelect(String email); // 회원 email로 공인중개소번호 알아내기  
	List<BuildDTO> mrBuildSelect(Map hm);
	List<StaffDTO> mrStaffSelect(int estateNo);
	List<PriceDTO> mrPriceSelect(BuildDTO buildDTO);
	void mrPrivateMemoUpdate(Map<String, Object> map);
	void mrDeleteReservation(int build_no);
	void mrDeletePrice(int build_no);
	void mrDeleteBuild(int build_no);  
	List<BuildDTO> mrSearchBuildNoSelect(Map<String, Object> hm);
	List<BuildDTO> mrSearchBuildTitleSelect(Map<String, Object> hm);
	List<BuildDTO> mrSearchBuildMemoSelect(Map<String, Object> hm);
}
