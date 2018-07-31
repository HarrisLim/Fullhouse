package com.team.station4.map.model.dao;

import java.util.HashMap;
import java.util.List;

import com.team.station4.map.model.MapDTO;
import com.team.station4.map.vo.PagingVo;

public interface MapDAO {
	List<MapDTO> mapList(PagingVo pagingVo);
	int totalCount();
	List<MapDTO> location();
	List<MapDTO>latLng(HashMap hm);
	void insertInjection(MapDTO dto);
}
