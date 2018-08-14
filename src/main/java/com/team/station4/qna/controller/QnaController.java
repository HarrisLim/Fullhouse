package com.team.station4.qna.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.qna.model.QnaDTO;
import com.team.station4.qna.model.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	QnaService qnaService;
	
	@RequestMapping(value = "house/qna.do", method = RequestMethod.GET)
	public ModelAndView customer() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("house/qna");
		String email = "hdfj2sl@gmail.com"; // session으로 받아올거야. 
		List<QnaDTO> qnaList = qnaService.selectQnaService(email);
		System.out.println("qnaList.size"+ qnaList.size());
		for(QnaDTO s: qnaList) {
			System.out.println("sss: "+ s);	
		}
		mv.addObject("qnaList", qnaList);
		
		return mv;
	}
	
	
}
