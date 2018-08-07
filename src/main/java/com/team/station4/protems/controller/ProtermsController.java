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
import com.team.station4.staff.model.service.StaffService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProtermsController {
	@Autowired
	EstateService service;
	@Autowired
	StaffService service2;
	
	private static final Logger logger = LoggerFactory.getLogger(ProtermsController.class);
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "house/proterms.do", method = RequestMethod.GET)
	public String customer() {
		return "house/proterms";
	}
	@RequestMapping(value = "house/estate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String estate(EstateDTO estatedto, StaffDTO staffdto) {
		
		System.out.println("staffdto : " + staffdto.getEstate_no());
		System.out.println("staffdto : " + staffdto.getSt_pic());
		System.out.println("staffdto : " + staffdto.getSt_name());
		System.out.println("staffdto : " + staffdto.getSt_position());
		System.out.println("staffdto : " + staffdto.getSt_qual());
		System.out.println("staffdto : " + staffdto.getSt_phone());
		System.out.println("staffdto : " + staffdto.getSt_homephone());
		System.out.println("staffdto : " + staffdto.getSt_email());
		System.out.println("staffdto : " + staffdto.getSt_pw());
		System.out.println("staffdto : " + staffdto.getSt_joinpath());
		System.out.println("staffdto : " + staffdto.getSt_media());
		
		
		if(staffdto.getEstate_no() == 0 ) {
			service.promemberInsertS(estatedto);
			EstateDTO es = service.lrSelectS(estatedto);
			System.out.println(" es : " + es);
			staffdto.setEstate_no(es.getEstate_no());
			service2.StaffInsertS(staffdto);
			
		}else if( staffdto.getEstate_no() > 0) {
			EstateDTO es = service.esSelectS(estatedto);
			System.out.println(" es : " + es.getEstate_no());
			staffdto.setEstate_no(es.getEstate_no());
			service2.StaffInsertS(staffdto);
		}
		return "house/proterms";
		
	}
	@RequestMapping(value = "house/procheck.do", method = RequestMethod.POST)
	public ModelAndView procheckin(EstateDTO dto) {
		ModelAndView mv = new ModelAndView();
		EstateDTO dto2 = service.proCheckS(dto);
			mv.addObject("dto2" , dto2);
			mv.setViewName("jsonView");
			return mv;
	}
}
