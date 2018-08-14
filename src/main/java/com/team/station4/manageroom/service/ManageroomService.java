package com.team.station4.manageroom.service;

import java.util.List;
import java.util.Map;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.uploadroom.model.PriceDTO;

public interface ManageroomService {
	int mrEstateNoSelectService(String email); // 회원 email로 공인중개소번호 알아내기  
	List<BuildDTO> mrBuildSelectService(Map hm);
	List<StaffDTO> mrStaffSelectService(int estateNo);
	List<PriceDTO> mrPriceSelectService(BuildDTO buildDTO);
	void mrPrivateMemoUpdateService(Map<String, Object> map);
	void mrDeleteReservationService(int build_no);
	void mrDeletePriceService(int build_no);
	void mrDeleteRequestService(int build_no);
	void mrDeleteAddinfoService(int build_no);
	void mrDeleteBuildService(int build_no);
	List<BuildDTO> mrSearchBuildNoSelectService(Map<String, Object> hm);
	List<BuildDTO> mrSearchBuildTitleSelectService(Map<String, Object> hm);
	List<BuildDTO> mrSearchBuildMemoSelectService(Map<String, Object> hm);
}
