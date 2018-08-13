package com.team.station4.map.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.vo.PagingVo;

public interface MapDAO {

	List<BuildDTO> mapList(Map jsonLatLng);
	int countCluster(Map jsonLatLng);
	List<BuildDTO> location();
	List<BuildDTO>latLng(HashMap hm);
	void insertInjection(BuildDTO dto);
	void insertPrice(HashMap price);
	int count();
	
	/* jsl */
	int countBuild(Map hm);
}
