package com.team.station4.protems.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.estate.model.EstateDTO;
import com.team.station4.estate.model.service.EstateService;
import com.team.station4.staff.model.StaffDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProtermsController {
	@Autowired
	EstateService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ProtermsController.class);
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "house/proterms.do", method = RequestMethod.GET)
	public String customer() {
		return "house/proterms";
	}
	@RequestMapping(value = "house/estate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String estate(EstateDTO dto /*StaffDTO dto2*/) {
		System.out.println("들어갔느뇨~" + dto.getEstate_name());
		/*System.out.println("들어갔느뇨~" + dto2.getSt_name());*/
		service.promemberInsertS(dto);
		/*service.staffInsertS(dto2);*/
		return "house/proterms";
	}
	@RequestMapping(value = "house/procheck.do", method = RequestMethod.POST)
	public ModelAndView procheckin(String lrno) {
		System.out.println("인입" + lrno );
		ModelAndView mv = new ModelAndView();
		int count = service.proCheckS(lrno);
		mv.addObject("count" , count);
		mv.setViewName("jsonView");
		return mv;
	}
}
