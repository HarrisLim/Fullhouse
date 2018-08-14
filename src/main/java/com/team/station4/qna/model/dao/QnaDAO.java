package com.team.station4.qna.model.dao;

import java.util.List;

import com.team.station4.qna.model.QnaDTO;

public interface QnaDAO {
	List<QnaDTO> selectQna(String email);
}
