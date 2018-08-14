package com.team.station4.qna.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.station4.qna.model.QnaDTO;

@Repository
public class QnaDAOImpl implements QnaDAO {
	@Autowired
	SqlSession sqlSession;
	
	String ns = "com.team.station4.qna";
	
	@Override
	public List<QnaDTO> selectQna(String email) {
		return sqlSession.selectList(ns+".selectQna", email);
	}

}
