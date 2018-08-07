package com.team.station4.uploadroom.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;

@Repository
public class UploadroomDAOImpl implements UploadroomDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String ns = "com.team.station4";
	

	@Override
	public void addInfoInsert(AddInfoDTO addInfoDTO) {
		sqlSession.insert(ns+".addinfo.myInsert", addInfoDTO);
	}

	@Override
	public int addInfoSelect() {
		return sqlSession.selectOne(ns+".addinfo.mySelect");
	}


	@Override
	public void buildingInsert(BuildDTO buildDTO) {
		sqlSession.insert(ns+".map.myInsert", buildDTO);
	}

	@Override
	public int buildingSelect() {
		return sqlSession.selectOne(ns+".map.myNo");
	}

	@Override
	public void priceInsert(PriceDTO priceDTO) {
		sqlSession.insert(ns+".price.myInsert", priceDTO);
	}

	@Override
	public void priceMonthlyInsert(PriceDTO priceDTO) {
		sqlSession.insert(ns+".price.myMonthlyInsert", priceDTO);
	}
}
