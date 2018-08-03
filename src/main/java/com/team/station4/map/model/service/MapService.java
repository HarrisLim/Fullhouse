package com.team.station4.map.model.service;


import java.util.HashMap;
import java.util.List;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.vo.PagingVo;

public interface MapService {
	List<BuildDTO> mapListService(PagingVo pagingVo);
	int countService();
	List<BuildDTO> locationService();
	List<BuildDTO> latLngService(HashMap hm);
	void makeImage(int count);
	List<Double>randomLat(int count);
	List<Double>randomLng(int count);
	void insertInjectionService(BuildDTO dto);
	List<BuildDTO> clickClustererService(HashMap hm);
	int countClusterService(HashMap hm);
}
