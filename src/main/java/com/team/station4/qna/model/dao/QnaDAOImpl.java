package com.team.station4.qna.model.dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public int insertQuestionService(Map map) {
		return sqlSession.insert(ns+".insertQna", map);
	}

	@Override
	public void deleteQna(int qna_no) {
		sqlSession.delete(ns+".myDelete", qna_no);
	}

	@Override
	public List<QnaDTO> selectQnaAll(Map map) {
		return sqlSession.selectList(ns+".selectQnaAll", map);
	}

	@Override
	public void updateReply(Map map) {
		sqlSession.update(ns+".updaterReply", map);
	}
	
}
