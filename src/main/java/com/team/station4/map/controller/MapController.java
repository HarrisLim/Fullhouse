package com.team.station4.map.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

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
	
	@RequestMapping(value="house/mapMarker.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mapMarker(@RequestParam("neLat") double neLat, @RequestParam("neLng") double neLng, @RequestParam("swLat")double swLat, @RequestParam("swLng")double swLng, @RequestParam("centerLat")double centerLat, @RequestParam("centerLng")double centerLng,
			@RequestParam("level")int level/*, @RequestParam("bounds")double bounds*/) {
		ModelAndView mv = null;
		System.out.println("북동 좌표 neLat: "+neLat);
		System.out.println("북동 좌표 neLng: "+neLng);
		System.out.println("남서 좌표 swLat: "+swLat);
		System.out.println("남서 좌표 swLng: "+swLng);
		//System.out.println("지도 현재 영역 bounds: "+bounds);
		System.out.println("지도 중심 좌표 centerLat: "+centerLat);
		System.out.println("지도 중심 좌표 centerLng: "+centerLng);
		System.out.println("지도 레벨 level: "+level);
	
		
		
		mv = new ModelAndView("jsonView");
		List<MapDTO> dto = service.locationService();
		List<Object> arryList = new ArrayList<Object>();
		HashMap<String, Double> hm = new HashMap<String, Double>();
		int i = 0;	
		int j = 0;
		double lat = 0.1;
		double lng = 0.1;
		for(MapDTO latLng : dto) {
			hm.put("lat" ,latLng.getLat());
			hm.put("lng" ,latLng.getLng());
			arryList.add(hm);
			System.out.println("size: "+arryList.size()+", i:"+i+" , ");
			i++;
			
			if(hm.size() == 2) {
				hm = new HashMap<String, Double>();
			}
		}
			
			
			
			
			 

		
		mv.addObject("positions", arryList);
		return mv;
	}
	
	
	
	
	
	
	
	/* 매물 강제 insert 페이지*/
	@RequestMapping(value="house/compulsionInjection.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView compulsionInjection(@RequestParam("count") int count) {
		//int count = 50;
		ModelAndView mv = new ModelAndView();
		List<Double> randomLat = service.randomLat(count);
		List<Double> randomLng = service.randomLng(count);
		mv.setViewName("jsonView");
		mv.addObject("randomLat", randomLat);
		mv.addObject("randomLng", randomLng);
		
		return mv;
	}
	
	/* 매물 강제 insert */
	@RequestMapping(value="house/resultInjection.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String resultInjection(@RequestParam(value="jsonText", required=false) List<String> addressList, @RequestParam(value="jsonInt", required=false) List<String> latLngList) {
		System.out.println("인입");
		ArrayList<Double> locationLat = new ArrayList<Double>();
		ArrayList<Double> locationLng = new ArrayList<Double>();
		MapDTO dto = null;
		Random ran = new Random();
		String year = "";
		int yeaerInt = 0;
		String month = "";
		String day = "";
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		int property = 0;
		String propertyStr = "";
		java.util.Date utilDate = null;
		java.sql.Date sqlDate = null;
		for(int i=0; i<latLngList.size(); i++) {
			locationLat.add(Double.parseDouble(latLngList.get(i).substring(latLngList.get(i).indexOf("(")+1, latLngList.get(i).indexOf(",")).trim()));
			locationLng.add(Double.parseDouble(latLngList.get(i).substring(latLngList.get(i).indexOf(",")+1, latLngList.get(i).indexOf(")")).trim()));
			day = Integer.toString(ran.nextInt(31)+1);
			month = Integer.toString(ran.nextInt(12)+1);
			year = Integer.toString(2000+ran.nextInt(18));
			property = ran.nextInt(6);
			if(property == 0) propertyStr = "아파트";
			else if(property == 1) propertyStr = "오피스텔";
			else if(property == 2) propertyStr = "쓰리룸";
			else if(property == 3) propertyStr = "투룸";
			else if(property == 4) propertyStr = "1.5룸";
			else if(property == 5) propertyStr = "원룸";
			
			utilDate = new java.util.Date();
			try {
				utilDate = format.parse(year+"-"+month+"-"+day);
				System.out.println("utilDate: "+utilDate);
				sqlDate =  new java.sql.Date(utilDate.getTime());
				System.out.println("sqlDate: "+sqlDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			dto = new MapDTO(addressList.get(i), propertyStr, Integer.toString(ran.nextInt(20)+1), Integer.toString(ran.nextInt(20)+1), 121.1, 100.8, ran.nextInt(100), 
					"c:/station4/images", "2018년 3월 5일", locationLat.get(i), locationLng.get(i), sqlDate, 10, 10, 10, 10, 10);
			service.insertInjectionService(dto);
			//System.out.println("lat:"+locationLat.get(i)+", lng:"+locationLng.get(i));
			
		}
		
		return "redirect:testInjection.do";
	}
}













