package com.team.station4.qna.model.service;

import java.util.List;

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

}
