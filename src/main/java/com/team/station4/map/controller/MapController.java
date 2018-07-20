package com.team.station4.map.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.map.model.MapDTO;
import com.team.station4.map.model.service.MapService;
import com.team.station4.map.vo.PagingVo;

@Controller
public class MapController {
	@Autowired
	private MapService service;
	
	@RequestMapping(value = "house/map.do", method= RequestMethod.GET)
	public ModelAndView mapPage(Model model, PagingVo pagingVo) {
		System.out.println("control");
		ModelAndView mv = new ModelAndView();
		pagingVo.setTotal(service.countService());
		List<MapDTO> list =service.mapListService(pagingVo);
		List<MapDTO> location = service.locationService();
		
		
		for(MapDTO dto : location) {
			dto.getLat();
			dto.getLng();
		}
		mv.setViewName("house/map");
		mv.addObject("list", list);
		mv.addObject("page", pagingVo);
		return mv;
	}
	
	@RequestMapping(value="house/mapList.do")
	public ModelAndView list(PagingVo pagingVo) {
		System.out.println("control");
		ModelAndView mv = new ModelAndView();
		List<MapDTO> list =service.mapListService(pagingVo);
		pagingVo.setTotal(service.countService()); 
		mv.setViewName("house/map");
		mv.addObject("list", list);
		mv.addObject("page", pagingVo);
		return mv;
	}
}
