package com.team.station4.qna.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.main.model.MainDTO;
import com.team.station4.manageroom.controller.ManageroomController;
import com.team.station4.qna.model.QnaDTO;
import com.team.station4.qna.model.service.QnaService;
import com.team.station4.staff.model.StaffDTO;

@Controller
public class QnaController {
	@Autowired
	QnaService qnaService;
	
	@RequestMapping(value = "house/qna.do", method = RequestMethod.GET)
	public ModelAndView customer(HttpSession session) {
		String type = (String)session.getAttribute("type");
		String email = "";
		if(type!=null) {
			if(type.equals("mem")) {
				MainDTO seMemberDTO = (MainDTO)session.getAttribute("mem");
				email = seMemberDTO.getMem_email();
			}else { // type == "staff"
				StaffDTO seStaffDTO = (StaffDTO)session.getAttribute("st");
				email = seStaffDTO.getSt_email();
			}	
		}
		
		System.out.println("email "+ email);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("house/qna");
		List<QnaDTO> qnaList = qnaService.selectQnaService(email);
		mv.addObject("qnaList", qnaList);
		mv.addObject("type", type);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "house/question.do", method = RequestMethod.POST)
	public int question(@RequestBody Map<String, Object> map, HttpSession session) {
		String type = (String)session.getAttribute("type");
		String email = "";
		if(type!=null) {
			if(type.equals("mem")) {
				MainDTO seMemberDTO = (MainDTO)session.getAttribute("mem");
				email = seMemberDTO.getMem_email();
			}else { // type == "staff"
				StaffDTO seStaffDTO = (StaffDTO)session.getAttribute("st");
				email = seStaffDTO.getSt_email();
			}	
		}
		
		
		map.put("email", email);
		qnaService.insertQuestionService(map);
		
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value = "house/deletemyquestion.do", method = RequestMethod.POST)
	public ModelAndView deleteMyQuestion(@RequestParam("qna_no") int qna_no, HttpSession session) {
		qnaService.deleteQnaService(qna_no);


		String type = (String)session.getAttribute("type");
		String email = "";
		if(type!=null) {
			if(type.equals("mem")) {
				MainDTO seMemberDTO = (MainDTO)session.getAttribute("mem");
				email = seMemberDTO.getMem_email();
			}else { // type == "staff"
				StaffDTO seStaffDTO = (StaffDTO)session.getAttribute("st");
				email = seStaffDTO.getSt_email();
			}	
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		List<QnaDTO> qnaList = qnaService.selectQnaService(email);
		mv.addObject("qnaList", qnaList);
		return mv;
	}
	
}
