package com.team.station4.map.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.map.model.MapDTO;
import com.team.station4.map.model.service.MapService;
import com.team.station4.map.vo.PagingVo;

@Controller
public class MapController {
	@Autowired
	private MapService service;
	
	/* 방검색 페이지 표시  */
	@RequestMapping(value = "house/map.do", method= RequestMethod.GET)
	public ModelAndView mapPage(Model model, PagingVo pagingVo) {
		System.out.println("control");
		ModelAndView mv = new ModelAndView();
		pagingVo.setTotal(service.countService());
		List<MapDTO> list =service.mapListService(pagingVo);
		List<MapDTO> location = service.locationService();
		int count = service.countService();
		
//		HashMap<String, String> hm = new HashMap<String, String>();
//		hm.put("전세", "전세");
//		hm.put("서울시", "서울시");
//		List<MapDTO>latLng = service.latLngService(hm);
		double lat = 0.0;
		double lng = 0.0;
		for(MapDTO dto : location) {
			lat += dto.getLat();
			lng += dto.getLng();
			//System.out.println("lat: "+lat+", lng: "+lng);
		}
		service.makeImage(count);
		lat = lat/location.size();
		lng = lng/location.size();
		System.out.println("lat: "+lat+", lng: "+lng+", dto.size(): "+location.size());
		
		mv.setViewName("house/map");
		mv.addObject("count", count);
		mv.addObject("list", list);
		mv.addObject("page", pagingVo);
		return mv;
	}
	
	/* 관심목록 페이지 표시  */
	@RequestMapping(value="house/myMap.do")
	public String myMap() {
		return "house/myMap";
	}
	
	/* 방검색 리스트+paging ajax 표시 */
	@RequestMapping(value="house/indexJson.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView indexJson(PagingVo pagingVo) {
		System.out.println("index:"+pagingVo.getIndex()+", start:"+pagingVo.getPageStartNum()+", listCnt: "+pagingVo.getListCnt()+", last: "+pagingVo.getLast());
		ModelAndView mv = new ModelAndView("jsonView");
		List<MapDTO> list = service.mapListService(pagingVo);
		pagingVo.setTotal(service.countService());
		mv.addObject("list", list);
		return mv;
	}
	@RequestMapping(value="house/testInjection.do")
	public String test() {
		return "house/testInjection";
	}
	
	/* 매물 강제 insert */
	@RequestMapping(value="house/compulsionInjection.do")
	public ModelAndView compulsionInjection(@RequestParam("count") int count) {
		ModelAndView mv = new ModelAndView();
		List<Double> randomLat = service.randomLat(count);
		List<Double> randomLng = service.randomLng(count);
		mv.setViewName("house/testInjection");
		mv.addObject("randomLat", randomLat);
		mv.addObject("randomLng", randomLng);
		
		return mv;
	}
}













