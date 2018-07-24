package com.team.station4.map.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.station4.map.model.MapDTO;
import com.team.station4.map.model.dao.MapDAO;
import com.team.station4.map.vo.PagingVo;

@Service
public class MapServiceImpl implements MapService {
	@Autowired
	MapDAO dao;
	
	@Override
	public List<MapDTO> mapListService(PagingVo pagingVo) {
		return dao.mapList(pagingVo);
	}
	
	@Override
	public int countService() {
		return dao.totalCount();
	}
	
	@Override
	public List<MapDTO> locationService(){
		return dao.location();
	}
	
	@Override
	public List<MapDTO> latLngService(HashMap hm){
		return dao.latLng(hm);
	}

}
