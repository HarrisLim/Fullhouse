package com.team.station4.map.model.service;


import java.util.HashMap;
import java.util.List;

import com.team.station4.map.model.MapDTO;
import com.team.station4.map.vo.PagingVo;

public interface MapService {
	List<MapDTO> mapListService(PagingVo pagingVo);
	int countService();
	List<MapDTO> locationService();
	List<MapDTO> latLngService(HashMap hm);
	void makeImage(int count);
	List<Double>randomLat(int count);
	List<Double>randomLng(int count);	
}
