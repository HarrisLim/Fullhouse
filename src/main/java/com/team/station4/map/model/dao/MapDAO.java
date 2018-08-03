package com.team.station4.map.model.dao;

import java.util.HashMap;
import java.util.List;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.vo.PagingVo;

public interface MapDAO {
	List<BuildDTO> mapList(PagingVo pagingVo);
	int totalCount();
	List<BuildDTO> location();
	List<BuildDTO>latLng(HashMap hm);
	void insertInjection(BuildDTO dto);
	List<BuildDTO> clickClusterer(HashMap hm);
	int countCluster(HashMap hm);
}
