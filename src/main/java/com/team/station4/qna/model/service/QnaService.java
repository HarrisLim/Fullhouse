package com.team.station4.qna.model.service;


import java.util.List;
import java.util.Map;

import com.team.station4.qna.model.QnaDTO;

public interface QnaService {
	List<QnaDTO> selectQnaService(String email);
	int insertQuestionService(Map map);
	void deleteQnaService(int qna_no);
	List<QnaDTO> selectQnaAllService(Map map);
	void updateReplyService(Map map);
}
