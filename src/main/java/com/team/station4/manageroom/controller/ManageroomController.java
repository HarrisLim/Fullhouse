package com.team.station4.manageroom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.manageroom.service.ManageroomService;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.uploadroom.model.service.UploadroomService;

@Controller
public class ManageroomController {
	@Autowired
	private ManageroomService mrService;

	@RequestMapping(value="house/manageroom.do", method=RequestMethod.GET)
	public ModelAndView manageroom() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("house/manageroom");
		int estateNo = 1; // 일단 1로 셋티해놓자. 로그인 세션이 될 때까지.  
		List<BuildDTO> buildList = mrService.mrBuildSelectService(estateNo);
		System.out.println(buildList.size());
		for(int i=0; i<buildList.size(); i++) {
			System.out.println("buildList: "+buildList.get(i).getRoomTitle());	
		}
		mv.addObject("buildList", buildList);
		return mv;
	}
}
