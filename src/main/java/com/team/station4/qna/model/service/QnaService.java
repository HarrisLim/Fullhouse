package com.team.station4.qna.model.service;


import java.util.List;
import com.team.station4.qna.model.QnaDTO;

public interface QnaService {
	List<QnaDTO> selectQnaService(String email);
}
