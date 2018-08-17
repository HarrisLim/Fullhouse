package com.team.station4.proinfo.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.estate.model.EstateDTO;
import com.team.station4.estate.model.service.EstateService;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.staff.model.service.StaffService;

@Controller
public class ProinfoController {
	
	@Autowired StaffService staffservice;
	@Autowired EstateService estateservice;

	@RequestMapping(value="house/proinfo.do", method={RequestMethod.GET , RequestMethod.POST})
	public ModelAndView proinfo(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		StaffDTO dto = (StaffDTO)session.getAttribute("st");
		int eno = dto.getEstate_no();
		System.out.println(" eno : " + eno );
		EstateDTO all = estateservice.proOutputS(eno);
		System.out.println(" all : " + all );
		
		mv.addObject("staff" , dto);
		mv.addObject("estate" , all);
		return mv;
	}
	@RequestMapping(value="house/chkproinfo.do", method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView chkproinfo(@RequestBody Map <String, Object> map ) {
		System.out.println("map : " + map.get("estateaddr"));
		ModelAndView mv = new ModelAndView();
		
		
		return mv;
	}
	@RequestMapping(value="house/changeproinfo.do", method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView changeProInfo(EstateDTO change1, StaffDTO change2) {
		ModelAndView mv = new ModelAndView();
		estateservice.addrChangeS(change1);
		staffservice.pwChangeS(change2);
		int count = 1;
		
		mv.addObject("count", count);
		return mv;
	}
}
