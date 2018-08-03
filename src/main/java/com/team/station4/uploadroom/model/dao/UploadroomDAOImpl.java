package com.team.station4.uploadroom.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.CostOptionDTO;
import com.team.station4.uploadroom.model.ExplainDTO;
import com.team.station4.uploadroom.model.MonthlyDTO;
import com.team.station4.uploadroom.model.OptionsDTO;
import com.team.station4.uploadroom.model.PriceDTO;

@Repository
public class UploadroomDAOImpl implements UploadroomDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String ns = "com.team.station4";
	
	@Override
	public void optionsInsert(OptionsDTO optionsDTO) {
		sqlSession.insert(ns+".options.myInsert", optionsDTO);
	}

	@Override
	public int optionsSelect() {
		return sqlSession.selectOne(ns+".options.mySelect");
	}

	@Override
	public void costOPtionInsert(CostOptionDTO costOptionDTO) {
		// TODO Auto-generated method stub

	}

	@Override
	public int costOptionSelect() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void addInfoInsert(AddInfoDTO addInfoDTO) {
		// TODO Auto-generated method stub

	}

	@Override
	public int addInfoSelect() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void explainInsert(ExplainDTO explainDTO) {
		// TODO Auto-generated method stub

	}

	@Override
	public int explainSelect() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void buildingInsert(BuildDTO buildDTO) {
		// TODO Auto-generated method stub

	}

	@Override
	public int buildingSelect() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void priceInsert(PriceDTO priceDTO) {
		// TODO Auto-generated method stub

	}

	@Override
	public int priceSelect() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void monthlyInsert(MonthlyDTO monthlyDTO) {
		// TODO Auto-generated method stub

	}

	@Override
	public int monthlySelect() {
		// TODO Auto-generated method stub
		return 0;
	}

}
