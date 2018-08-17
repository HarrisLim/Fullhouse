package com.team.station4.staff.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.staff.model.StaffDTO;

@Repository
public class StaffDAOImpl implements StaffDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	String ns = "com.team.station4.Staff";
	
	@Override
	public void StaffInsert(StaffDTO dto2) {
		// TODO Auto-generated method stub
		sqlSession.insert(ns + ".staffInsert", dto2);
	}
	@Override
	public int semCheck(String email) {
		// TODO Auto-generated method stub
		int sem = sqlSession.selectOne(ns + ".semCheck", email);
		return sem;
	}
	@Override
	public List<StaffDTO> estateSelect(int estate_no) {
		return sqlSession.selectList(ns+".mySelect", estate_no);
	}
	@Override
	public void verifyUpdate(int st_no) {
		sqlSession.update(ns+".myUpdateVerify", st_no);
	}
	@Override
	public StaffDTO staffSecurity(String st_email) {
		// TODO Auto-generated method stub
		StaffDTO security = sqlSession.selectOne(ns + ".Security", st_email);
		System.out.println(" 값 : " + security);
		return security;
	}
	@Override
	public void pwChange(StaffDTO change2) {
		// TODO Auto-generated method stub
		sqlSession.update(ns + ".pwChange", change2);
	}
}
