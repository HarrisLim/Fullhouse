package com.team.station4.qna.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.station4.qna.model.QnaDTO;
import com.team.station4.qna.model.dao.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	QnaDAO qnaDAO;

	@Override
	public List<QnaDTO> selectQnaService(String email) {
		return qnaDAO.selectQna(email);
	}

	@Override
	public int insertQuestionService(Map map) {
		return qnaDAO.insertQuestionService(map);
	}

	@Override
	public void deleteQnaService(int qna_no) {
		qnaDAO.deleteQna(qna_no);
	}

	@Override
	public List<QnaDTO> selectQnaAllService(Map map) {
		return qnaDAO.selectQnaAll(map);
	}

	@Override
	public void updateReplyService(Map map) {
		qnaDAO.updateReply(map);
	}

}
