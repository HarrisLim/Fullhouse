package com.team.station4.qna.model.dao;

import java.util.List;
import java.util.Map;

import com.team.station4.qna.model.QnaDTO;

public interface QnaDAO {
	List<QnaDTO> selectQna(String email);
	int insertQuestionService(Map map);
	void deleteQna(int qna_no);
	List<QnaDTO> selectQnaAll(Map map);
	void updateReply(Map map);
}
