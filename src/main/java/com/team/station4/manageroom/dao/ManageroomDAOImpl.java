package com.team.station4.manageroom.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.uploadroom.model.PriceDTO;

@Repository
public class ManageroomDAOImpl implements ManageroomDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String ns = "com.team.station4";

	@Override
	public int mrEstateNoSelect(String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BuildDTO> mrBuildSelect(Map hm) {
		System.out.println("1: "+hm.get("start"));
		System.out.println("2: "+hm.get("buildDTO"));
		return sqlSession.selectList(ns+".map.mySelectEstate", hm);
	}

	@Override
	public List<StaffDTO> mrStaffSelect(int estateNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PriceDTO> mrPriceSelect(BuildDTO buildDTO) {
		System.out.println("build_no in dao : "+ buildDTO.getBuild_no());
		return sqlSession.selectList(ns+".price.mySelectBuild", buildDTO);
	}

	@Override
	public void mrPrivateMemoUpdate(Map<String, Object> map) {
		sqlSession.update(ns+".map.myUpdatePrivateMemo", map);
	}

	@Override
	public void mrDeleteReservation(int build_no) {
		sqlSession.delete(ns+".reservation.myDelete", build_no);
	}

	@Override
	public void mrDeletePrice(int build_no) {
		sqlSession.delete(ns+".price.myDelete", build_no);
	}

	@Override
	public void mrDeleteBuild(int build_no) {
		sqlSession.delete(ns+".map.myDelete", build_no);
	}

	@Override
	public List<BuildDTO> mrSearchBuildNoSelect(Map<String, Object> hm) {
		System.out.println("aaSN: "+ hm.get("start"));
		System.out.println("bbSN: "+ hm.get("last"));
		System.out.println("ccSN: "+ hm.get("buildState"));
		return sqlSession.selectList(ns+".map.mySearchNoSelect", hm);
	}

	@Override
	public List<BuildDTO> mrSearchBuildTitleSelect(Map<String, Object> hm) {
		System.out.println("aa: "+ hm.get("start"));
		System.out.println("bb: "+ hm.get("last"));
		System.out.println("cc: "+ hm.get("buildState"));
		return sqlSession.selectList(ns+".map.mySearchTitleSelect", hm);
	}

	@Override
	public List<BuildDTO> mrSearchBuildMemoSelect(Map<String, Object> hm) {
		return sqlSession.selectList(ns+".map.mySearchMemoSelect", hm);
	}
	
}
