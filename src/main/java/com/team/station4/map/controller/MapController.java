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
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.model.service.MapService;
import com.team.station4.map.vo.PagingVo;

@Controller
public class MapController {
	@Autowired
	private MapService service;
	
	/* 방검색 페이지 표시  */
	@RequestMapping(value = "house/map.do", method= RequestMethod.GET)
	public ModelAndView mapPage(PagingVo pagingVo) {
		System.out.println("control");
		ModelAndView mv = new ModelAndView();
		Map<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("start", pagingVo.getStart());
		hm.put("last", pagingVo.getLast());
		//추후 본인 위치기반 맵 중심 보여줄 경우 변경 가능
		hm.put("south", 37.45075192460503); 
		hm.put("west", 126.72406178505217);
		hm.put("north", 37.6898343030413);
		hm.put("east", 127.2456203269095);

		List<BuildDTO> list =service.mapListService(hm);
		int count = service.countClusterService(hm);
		pagingVo.setTotal(count);

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
	public ModelAndView indexJson(@RequestBody Map<String, Object> jsonLatLng) {
		System.out.println("jsonLatLng:index: "+jsonLatLng.get("index")+", pageStartNum: "+jsonLatLng.get("pageStartNum"));
		System.out.println("jsonLatLng:south: "+jsonLatLng.get("south")+", north: "+jsonLatLng.get("north")+", east: "+jsonLatLng.get("east")+", west: "+jsonLatLng.get("west"));
		System.out.println("jsonLatLng:buildType: "+jsonLatLng.get("buildType")+", kind_of_trade: "+jsonLatLng.get("kind_of_trade")+", proType: "+jsonLatLng.get("proType"));
		
		
		ModelAndView mv = new ModelAndView("jsonView");
		PagingVo pagingVo = new PagingVo();
		pagingVo.setIndex((Integer)jsonLatLng.get("index"));
		pagingVo.setPageStartNum((Integer)jsonLatLng.get("pageStartNum"));
		jsonLatLng.put("start", pagingVo.getStart());
		jsonLatLng.put("last", pagingVo.getLast());

		List<BuildDTO> list =service.mapListService(jsonLatLng);
		
		pagingVo.setTotal(service.countClusterService(jsonLatLng));
		System.out.println("pagingVo.getPageLastNum: "+pagingVo.getPageLastNum());
		mv.addObject("list", list);
		mv.addObject("pagingVo", pagingVo);
		return mv;
	}
	
	/* 방추가 페이지 */
	@RequestMapping(value="house/testInjection.do")
	public String test() {
		return "house/testInjection";
	}
	
	/* 클러스터러 생성  */
	@RequestMapping(value="house/mapClusterer.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mapClusterer() {
		ModelAndView mv = null;
		System.out.println("클러스터러 생성 추가:");
		mv = new ModelAndView("jsonView");
		List<BuildDTO> dto = service.locationService();
		List<Object> arryList = new ArrayList<Object>();
		HashMap<String, Double> hm = new HashMap<String, Double>();
		int i = 0;	
		int j = 0;
		for(BuildDTO latLng : dto) {
			hm.put("lat" ,latLng.getLat());
			hm.put("lng" ,latLng.getLng());
			arryList.add(hm);
			//System.out.println("arryList:"+arryList.get(i));
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
//		for(int i=0; i<addressList.size(); i++) {
//			System.out.println("Address인입: "+addressList.get(i)+", latLng인입: "+latLngList.get(i));
//		}
		ArrayList<BuildDTO>list = new ArrayList<BuildDTO>();
		HashMap<String, Object> price = null;
		ArrayList<Double> locationLat = new ArrayList<Double>();
		ArrayList<Double> locationLng = new ArrayList<Double>();
		BuildDTO dto = null;
		Random ran = new Random();
		String year = "";
		int yeaerInt = 0;
		String month = "";
		String day = "";
		String roomTitle = "한강뷰/전망좋은/옥수역도보 10분/신축빌라/옥수초등학교인접/내부도색완료/동남향";
		String explainText = "한강뷰/전망좋은/옥수역도보 10분/신축빌라/옥수초등학교인접/내부도색완료/동남향";
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		int property = 0;
		String propertyStr = "";
		java.util.Date utilDate = null;
		java.sql.Date sqlDate = null;
		for(int i=0; i<latLngList.size(); i++) {
			locationLat.add(Double.parseDouble(latLngList.get(i).substring(latLngList.get(i).indexOf("(")+1, latLngList.get(i).indexOf(",")).trim()));
			locationLng.add(Double.parseDouble(latLngList.get(i).substring(latLngList.get(i).indexOf(",")+1, latLngList.get(i).indexOf(")")).trim()));
			System.out.println("Address: "+addressList.get(i)+", lat: "+locationLat.get(i)+", lng: "+locationLng.get(i));
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
				//System.out.println("utilDate: "+utilDate);
				sqlDate =  new java.sql.Date(utilDate.getTime());
				//System.out.println("sqlDate: "+sqlDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			dto = new BuildDTO(addressList.get(i), ran.nextInt(4)+1,  propertyStr, ran.nextInt(20)+1, ran.nextInt(20)+1, 121.1, 100.8, ran.nextInt(100), 
					"../kanu/roomimg/"+(ran.nextInt(10)+1)+".jpeg", "2018년 3월 5일", locationLat.get(i), locationLng.get(i), roomTitle, explainText, "2번째 매물 등록", ran.nextInt(4)+1,sqlDate, 10, 10, 10);
			service.insertInjectionService(dto);
			//System.out.println("lat:"+locationLat.get(i)+", lng:"+locationLng.get(i));
			
			
		}
		//insert price 
		int count = service.countService();
		for (int i=0; i<count; i++) {
			price = new HashMap<String, Object>();
			price.put("lease", ran.nextInt(900000000)+5000000);
			price.put("monthly", ran.nextInt(2000000)+1);
			price.put("deposit", ran.nextInt(500000000)+5000000);
			price.put("build_no", (1)+(i++));
			System.out.println("lease: "+price.get("lease")+", monthly: "+price.get("monthly")+", deposit: "+price.get("deposit")+", build_no: "+price.get("build_no"));
			service.insertPriceService(price);
			
		}
		
		return "redirect:testInjection.do";
	}
}













