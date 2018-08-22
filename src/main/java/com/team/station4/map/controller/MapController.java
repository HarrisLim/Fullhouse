package com.team.station4.map.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.estate.model.EstateDTO;
import com.team.station4.main.model.MainDTO;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.model.service.MapService;
import com.team.station4.map.vo.PagingVo;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;

@Controller
public class MapController {
	@Autowired
	private MapService service;
	Map<String, Object>jsonLatLng = null;
	
	/* 방검색 페이지 표시  */
	@RequestMapping(value = "house/map.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mapPage(PagingVo pagingVo) {
		System.out.println("control: "+pagingVo.getIndex()+", startNum: "+pagingVo.getPageStartNum());
		ModelAndView mv = new ModelAndView();
		Map<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("start", pagingVo.getStart());
		hm.put("last", pagingVo.getLast());
		//추후 본인 위치기반 맵 중심 보여줄 경우 변경 가능
		hm.put("south", 37.45075192460503); 
		hm.put("west", 126.72406178505217);
		hm.put("north", 37.6898343030413);
		hm.put("east", 127.2456203269095);

		//////
		
		List<HashMap<String, Object>>map = service.selectMapService(hm);
		
		//System.out.println("월세:"+map.get(0).get("MONTHLY")+", 전세:"+map.get(0).get("LEASE")+", 보증금:"+map.get(0).get("DEPOSIT"));
		for(int i=0; i<map.size(); i++) {
			if(map.get(i).get("ROOMTITLE").toString().length() > 23) {
				String roomTitle = map.get(i).get("ROOMTITLE").toString().substring(0, 22)+"...";
				map.get(i).put("ROOMTITLE", roomTitle);
				//System.out.println("Xxxx: "+ roomTitle);
			}
		}
		/////
		int count = service.countClusterService(hm);
		
		pagingVo.setTotal(count);
		
		for(int i=0; i<map.size(); i++) {
			String [] picPath = map.get(i).get("PICPATH").toString().split(",");
			map.get(i).put("PICPATH", picPath[0]);
		}

		mv.setViewName("house/map");
		mv.addObject("flag", 0);
		mv.addObject("map", map);
		mv.addObject("count", count);
		mv.addObject("page", pagingVo);
		return mv;
	}
	
	/* 방검색 리스트+paging ajax 표시 */
	@RequestMapping(value="house/indexJson.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView indexJson(@RequestBody Map<String, Object> jsonLatLng, HttpSession session) {
		this.jsonLatLng = jsonLatLng;
		System.out.println("jsonLatLng:index: "+jsonLatLng.get("index")+", pageStartNum: "+jsonLatLng.get("pageStartNum"));
		System.out.println("jsonLatLng:south: "+jsonLatLng.get("south")+", north: "+jsonLatLng.get("north")+", east: "+jsonLatLng.get("east")+", west: "+jsonLatLng.get("west"));
		System.out.println("jsonLatLng:buildType: "+jsonLatLng.get("buildType")+", kind_of_trade: "+jsonLatLng.get("kind_of_trade")+", proType: "+jsonLatLng.get("proType"));
		System.out.println("jsonLatLng:parking: "+jsonLatLng.get("parking")+", animal: "+jsonLatLng.get("animal")+", startFloor: "+jsonLatLng.get("startFloor")+", endFloor: "+jsonLatLng.get("endFloor")+", startArea: "+jsonLatLng.get("startArea")+", endArea: "+jsonLatLng.get("endArea"));
		System.out.println("jsonLAtLng:flag: "+jsonLatLng.get("flag"));
		System.out.println("jsonLAtLng:address: "+jsonLatLng.get("address"));
		String flagStr = (String)jsonLatLng.get("flag");
		int flag = Integer.parseInt(flagStr);
		
		//flag 0 은 방검색 페이지 제이슨 데이터 처리
		if(flag == 0) {
			if(jsonLatLng.get("beginDeposit") != null && Integer.parseInt((String)jsonLatLng.get("beginDeposit")) > 0) {
				String begin = jsonLatLng.get("beginDeposit").toString();
				jsonLatLng.put("beginDeposit", Integer.parseInt(begin));  
			}
			if(jsonLatLng.get("endDeposit") != null && Integer.parseInt((String)jsonLatLng.get("endDeposit")) > 0) {
				String end = jsonLatLng.get("endDeposit").toString();
				jsonLatLng.put("endDeposit", Integer.parseInt(end)); 
			}
			System.out.println("jsonLatLng:beginDeposit: "+jsonLatLng.get("beginDeposit")+", endDeposit: "+jsonLatLng.get("endDeposit"));
			System.out.println("jsonLatLng:");
			
			if(jsonLatLng.get("beginRent") != null && Integer.parseInt((String)jsonLatLng.get("beginRent")) > 0) {
				String begin = jsonLatLng.get("beginRent").toString();
				jsonLatLng.put("beginRent", Integer.parseInt(begin));  
			}
			if(jsonLatLng.get("endRent") != null && Integer.parseInt((String)jsonLatLng.get("endRent")) > 0) {
				String end = jsonLatLng.get("endRent").toString();
				jsonLatLng.put("endRent", Integer.parseInt(end)); 
			}
			System.out.println("jsonLatLng:beginRent: "+jsonLatLng.get("beginRent")+", endRent: "+jsonLatLng.get("endRent"));
			
			ModelAndView mv = new ModelAndView("jsonView");
			PagingVo pagingVo = new PagingVo();
			pagingVo.setIndex((Integer)jsonLatLng.get("index"));
			pagingVo.setPageStartNum((Integer)jsonLatLng.get("pageStartNum"));
			jsonLatLng.put("start", pagingVo.getStart());
			jsonLatLng.put("last", pagingVo.getLast());
				
			List<HashMap<String, Object>>map = service.selectMapService(jsonLatLng);
			
			for(int i=0; i<map.size(); i++) {
				String [] picPath = map.get(i).get("PICPATH").toString().split(",");
				map.get(i).put("PICPATH", picPath[0]);
			}
			for(int i=0; i<map.size(); i++) {
				if(map.get(i).get("ROOMTITLE").toString().length() > 23) {
					String roomTitle = map.get(i).get("ROOMTITLE").toString().substring(0, 22)+"...";
					map.get(i).put("ROOMTITLE", roomTitle);
					//System.out.println("Xxxx: "+ roomTitle);
				}
			}
			
			pagingVo.setTotal(service.countClusterService(jsonLatLng));
			System.out.println("pagingVo.getPageLastNum: "+pagingVo.getPageLastNum());
			mv.addObject("flag", 0);
			mv.addObject("list", map);
			mv.addObject("pagingVo", pagingVo);
			//mapClusterer(jsonLatLng);
			return mv;
		//flag 1 은 방검색 페이지 - 찜한방 제이슨 데이터 처리	
		}else if(flag == 1){
			ModelAndView mv = new ModelAndView("jsonView");
			MainDTO member = (MainDTO)session.getAttribute("mem");
			String email = member.getMem_email();
			PagingVo pagingVo = new PagingVo();
			pagingVo.setIndex((Integer)jsonLatLng.get("index"));
			pagingVo.setPageStartNum((Integer)jsonLatLng.get("pageStartNum"));
			
			jsonLatLng.put("start", pagingVo.getStart());
			jsonLatLng.put("last", pagingVo.getLast());
			List<Integer> listHot = new ArrayList<Integer>();
			String hot = service.myHotService(email);
			hot= hot.substring(hot.indexOf(",")+1);
			String [] hotArray = hot.split(",");
			for(String hotStr : hotArray) {
					listHot.add(Integer.parseInt(hotStr));
			}
			HashMap<String, Object> hm = new HashMap<String, Object>();
			int total = listHot.size();
			pagingVo.setTotal(total);
			System.out.println("파스인트된 flag 찜목록: "+flag+", index: "+pagingVo.getIndex()+", pageStartNum: "+pagingVo.getPageStartNum()+", pageLastNum: "+pagingVo.getPageLastNum()+", total: "+pagingVo.getTotal());
			hm.put("list", listHot);
			hm.put("start", pagingVo.getStart());
			hm.put("last", pagingVo.getLast());
			List<HashMap<String, Object>>map = service.recentListPrintService(hm);
			
			for(int i=0; i<map.size(); i++) {
				String [] picPath = map.get(i).get("PICPATH").toString().split(",");
				map.get(i).put("PICPATH", picPath[0]);
			}
			for(int i=0; i<map.size(); i++) {
				if(map.get(i).get("ROOMTITLE").toString().length() > 23) {
					String roomTitle = map.get(i).get("ROOMTITLE").toString().substring(0, 22)+"...";
					map.get(i).put("ROOMTITLE", roomTitle);
					//System.out.println("Xxxx: "+ roomTitle);
				}
			}
			for(HashMap<String, Object> obj : map) {
				System.out.println("찜목록클릭 flag1 : "+obj.get("BUILD_NO")+", address: "+obj.get("ADDRESS")+", deposit: "+obj.get("DEPOSIT")+", lat: "+obj.get("LAT")+", lng: "+obj.get("LNG"));
			}
			
			mv.addObject("flag", 1);
			mv.addObject("list", map);
			mv.addObject("pagingVo", pagingVo);
			return mv;
		//flag 2 은 방검색 페이지 - 최근 본 방 제이슨 데이터 처리
		}else {
			ModelAndView mv = new ModelAndView("jsonView");
			MainDTO member = (MainDTO)session.getAttribute("mem");
			String email = member.getMem_email();
			PagingVo pagingVo = new PagingVo();
			pagingVo.setIndex((Integer)jsonLatLng.get("index"));
			pagingVo.setPageStartNum((Integer)jsonLatLng.get("pageStartNum"));
			
			jsonLatLng.put("start", pagingVo.getStart());
			jsonLatLng.put("last", pagingVo.getLast());
			List<Integer> listRecent = new ArrayList<Integer>();
			String recent = service.myRecentService(email);
			recent= recent.substring(recent.indexOf(",")+1);
			String [] recentArray = recent.split(",");
			for(String recentStr : recentArray) {
					listRecent.add(Integer.parseInt(recentStr));
			}
			int total = listRecent.size();
			pagingVo.setTotal(total);
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("list", listRecent);
			hm.put("start", pagingVo.getStart());
			hm.put("last", pagingVo.getLast());
			
			System.out.println("파스인트된 flag 관심목록: "+flag+", index: "+pagingVo.getIndex()+", pageStartNum: "+pagingVo.getPageStartNum()+", pageLastNum: "+pagingVo.getPageLastNum()+", total: "+pagingVo.getTotal());
			List<HashMap<String, Object>>map = service.recentListPrintService(hm);
			
			for(int i=0; i<map.size(); i++) {
				String [] picPath = map.get(i).get("PICPATH").toString().split(",");
				map.get(i).put("PICPATH", picPath[0]);
			}
			for(int i=0; i<map.size(); i++) {
				if(map.get(i).get("ROOMTITLE").toString().length() > 23) {
					String roomTitle = map.get(i).get("ROOMTITLE").toString().substring(0, 22)+"...";
					map.get(i).put("ROOMTITLE", roomTitle);
					//System.out.println("Xxxx: "+ roomTitle);
				}
			}
			mv.addObject("flag", 2);
			mv.addObject("list", map);
			mv.addObject("pagingVo", pagingVo);
			return mv;
		}
	}
	
	/* 클러스터러 생성  */
	@RequestMapping(value="house/mapClusterer.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mapClusterer(@RequestBody Map<String, Object> map) {
		System.out.println("클러스터:index: "+map.get("index")+", pageStartNum: "+map.get("pageStartNum"));
		System.out.println("클러스터:beginRent "+map.get("beginRent")+", endRent: "+map.get("endRent"));
		System.out.println("클러스터:buildType: "+map.get("buildType")+", kind_of_trade: "+map.get("kind_of_trade")+", proType: "+map.get("proType"));
		System.out.println("클러스터:south: "+map.get("south")+", north: "+map.get("north")+", east: "+map.get("east")+", west: "+map.get("west"));
		System.out.println("클러스터:address: "+map.get("address"));
		
		if(map.get("beginDeposit") != null && Integer.parseInt((String)map.get("beginDeposit")) > 0) {
			String begin = map.get("beginDeposit").toString();
			map.put("beginDeposit", Integer.parseInt(begin));  
		}
		if(map.get("endDeposit") != null && Integer.parseInt((String)map.get("endDeposit")) > 0) {
			String end = map.get("endDeposit").toString();
			map.put("endDeposit", Integer.parseInt(end));  
		}
		System.out.println("클러스터:beginDeposit: "+map.get("beginDeposit")+", endDeposit: "+map.get("endDeposit"));
		
		if(map.get("beginRent") != null && Integer.parseInt((String)map.get("beginRent")) > 0) {
			String begin = map.get("beginRent").toString();
			map.put("beginRent", Integer.parseInt(begin));  
		}
		if(map.get("endRent") != null && Integer.parseInt((String)map.get("endRent")) > 0) {
			String end = map.get("endRent").toString();
			map.put("endRent", Integer.parseInt(end));  
		}
		System.out.println("map:beginRent: "+map.get("beginRent")+", endRent: "+map.get("endRent"));
		
		
		ModelAndView mv = new ModelAndView("jsonView");
		System.out.println("클러스터러 생성 추가:");
		
		List<BuildDTO> dto = service.clusterListService(map);
		//int count = service.countClusterService(map);
		List<Object> arryList = new ArrayList<Object>();
		HashMap<String, Double> hm = new HashMap<String, Double>();
		int i = 0;	
		
		for(BuildDTO latLng : dto) {
			hm.put("lat" ,latLng.getLat());
			hm.put("lng" ,latLng.getLng());
			arryList.add(hm);
//			System.out.println("arryList:"+arryList.get(i));
			i++;
			
			if(hm.size() == 2) {
				hm = new HashMap<String, Double>();
			}
		}	
		mv.addObject("positions", arryList);
		return mv;
	}
	/*하트 (즐겨찾기) 추가*/
	@RequestMapping(value="house/heart.do", method=RequestMethod.POST)	
	public ModelAndView heart(@RequestParam("seq") int buildNo, HttpSession session) {
		ModelAndView mv = new ModelAndView("jsonView");
		if(session.getAttribute("mem") != null) {
			MainDTO member = (MainDTO)session.getAttribute("mem");
			String email = member.getMem_email();
		
			HashMap<String, Object>hm = new HashMap<String, Object>();
			hm.put("buildNo", buildNo);
			hm.put("email", email);
			System.out.println("하트추가 인입");
			int count = service.memHotSelectService(hm);
			System.out.println("buildNo: "+buildNo+", count: "+count);
			if(count != 1) {
				service.memHotUpdateService(hm); //하트 추가
				System.out.println("하트추가: "+service.myHotService(email));
				mv.addObject("count", count);
				return mv;
			}else {
				service.memHotDeleteService(hm); //하트 삭제
				System.out.println("하트삭제: "+service.myHotService(email));
				mv.addObject("count", count);
				return mv;
			}
			
		}
		return mv;
	}
	
	/*build list - 목록 클릭 (최근 본 페이지) 추가*/
	@RequestMapping(value="house/recentList.do", method=RequestMethod.POST)	
	public void recentList(@RequestParam("seq") String buildNo, HttpSession session ) {
		if(session.getAttribute("mem") != null) {
			MainDTO member = (MainDTO)session.getAttribute("mem");
			String email = member.getMem_email().trim();
			String recent = service.myRecentService(email);
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("build_no", buildNo); //빌드 넘버 검색을 위한 hm
			hm.put("email", email);
			
			//recentList 목록이 있는지 검사 0이면 최근본목록 없으니 그냥 등록 1이면 최근본목록+ 추가로 본목록, 추가로 본 목록이 최근목록에 있으면 recent는 기존 목록처리
			int count = service.memRecentSelectService(hm);
			System.out.println("최근본 페이지 추가 인입 리센트 확인: "+recent+", 빌드번호 확인: "+buildNo+", count: "+count+", email: "+email);
			if (count < 1) {
				hm.put("build_no", recent+","+buildNo);
				service.memRecentUpdateService(hm);
				recent = service.myRecentService(email);
				System.out.println("중복 매물이없을때: recent: "+recent);
			}else {
				if(recent.contains(buildNo)) {
					System.out.println("리센트에 내가 선택한 빌드번호가 있으면: "+recent);
				}else {
					hm.put("build_no", recent+","+buildNo);
					service.memRecentUpdateService(hm);
					recent = service.myRecentService(email);
					System.out.println("리센트에 내가 선택한 빌드번호가 없으면: "+recent+"hashMap데이터 확인: "+hm.get("build_no"));
				}
			}
			String recentArray[] = recent.split(",");
			if(recentArray.length > 10) {
				//두번째 , indexOf 까지 substring 하고 최근 본 목록 다시 저장
				String reRecent = recent.substring(recent.indexOf(",", 2));
				reRecent = reRecent+","+buildNo;
				hm.put("build_no", reRecent);
				service.memRecentUpdateService(hm); //최근본 방 업데이트
				System.out.println("최근 본방 업데이트 10개 이상 등록: "+reRecent);
			}
			System.out.println("최근 본방 업데이트 등록 recent: "+recent+", count: "+count);
		}
	}
	
	////////////////// map.do 끝 ////////////////////////////////////
	
	/* 관심목록 페이지 표시(최근 본 방)  */
	@RequestMapping(value="house/myMap.do")
	public ModelAndView myMap(PagingVo pagingVo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("mem") != null) {
			MainDTO member = (MainDTO)session.getAttribute("mem");
			String email = member.getMem_email();
			
			
			String recent = service.myRecentService(email);
			
			System.out.println("관심목록 입장 recent: "+recent);
			if(recent != null ) {
				recent = recent.substring(recent.indexOf(",")+1);
				String recentArray [] = recent.split(",");
				List<Integer> list = new ArrayList<Integer>();
				for(String recentStr :recentArray) {
					list.add(Integer.parseInt(recentStr));
				}
				int count = list.size();
				pagingVo.setTotal(count);
				HashMap<String, Object> hm = new HashMap<String, Object>();
				hm.put("start", pagingVo.getStart());
				hm.put("last", pagingVo.getLast());
				hm.put("list", list); 
				List<HashMap<String, Object>>map = service.recentListPrintService(hm);
		
				//System.out.println("월세:"+map.get(0).get("MONTHLY")+", 전세:"+map.get(0).get("LEASE")+", 보증금:"+map.get(0).get("DEPOSIT"));
				for(int i=0; i<map.size(); i++) {
					if(map.get(i).get("ROOMTITLE").toString().length() > 23) {
						String roomTitle = map.get(i).get("ROOMTITLE").toString().substring(0, 22)+"...";
						map.get(i).put("ROOMTITLE", roomTitle);
						//System.out.println("Xxxx: "+ roomTitle);
					}
				}
				
				for(int i=0; i<map.size(); i++) {
					String [] picPath = map.get(i).get("PICPATH").toString().split(",");
					map.get(i).put("PICPATH", picPath[0]);
				}
				mv.setViewName("house/myMap");
				mv.addObject("flag", 2);
				mv.addObject("map", map);
				mv.addObject("count", count);
				mv.addObject("page", pagingVo);
				return mv;
			}else {
				System.out.println("최근 본방 없음");
				return mv;
			}
		}else {
			mv.addObject("flag", 1);
			return mv;
		}
	}

	/* 마커 생성(관심목록-0, 찜한방-1)  */
	@RequestMapping(value="house/mapMarker.do", method=RequestMethod.POST)
	public ModelAndView mapMaeker(@RequestBody Map<String, Object>map, HttpSession session) {
		ModelAndView mv = new ModelAndView("jsonView");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		ArrayList<HashMap> list = new ArrayList<HashMap>();
		int flag = (Integer)map.get("flag");
		if(session.getAttribute("mem") != null) {
			MainDTO member = (MainDTO)session.getAttribute("mem");
			String email = member.getMem_email();
			if(flag == 0) { // 관심목록 입장 (myMap.do)
				String recent = service.myRecentService(email);
				System.out.println("flag 관심목록: "+flag+"recentList: "+recent);
				if(recent != null) {
					String [] recentSplit = recent.split(",");
					for(int i=1; i<recentSplit.length; i++) {
						BuildDTO dto = service.recentListService(Integer.parseInt(recentSplit[i]));
						//System.out.println("flag 관심목록: "+flag+"lat: "+dto.getLat()+", lng: "+dto.getLng());
						hm.put("lat", dto.getLat());
						hm.put("lng", dto.getLng());
						list.add(hm);
						if(hm.size() == 2) {
							hm = new HashMap<String, Object>();
						}
						System.out.println("flag 관심목록: "+flag+"lat: "+hm.get("lat")+", lng: "+hm.get("lng"));
					}
	
					mv.addObject("positions", list);
					return mv;
				}else {
					System.out.println("관심목록 없음");
					return mv;
				}
			}else { // 찜한방 클릭
				System.out.println("flag 찜한 방: "+flag);
				String hot = service.myHotService(email);
				if(hot != null) {
					String [] hotSplit = hot.split(",");
					for(int i=1; i<hotSplit.length; i++) {
						BuildDTO dto = service.hotListService(Integer.parseInt(hotSplit[i]));
						System.out.println("mapMarker flag 찜한방: "+flag+"lat: "+dto.getLat()+", lng: "+dto.getLng());
						hm.put("lat", dto.getLat());
						hm.put("lng", dto.getLng());
						list.add(hm);
						if(hm.size() == 2) {
							hm = new HashMap<String, Object>();
						}
						
					}
	
					mv.addObject("positions", list);
					return mv;
				}else {
					System.out.println("찜한방 없음");
					return mv;
				}
			}
		}
		return mv;
	}
		
	/*관심목록 - 찜한 방 클릭시*/
	@RequestMapping(value="house/heartRoom.do", method=RequestMethod.POST)	
	public ModelAndView heartRoom(PagingVo pagingVo, HttpSession session) {
		ModelAndView mv = new ModelAndView("jsonView");
		if(session.getAttribute("mem") != null) {
			MainDTO member = (MainDTO)session.getAttribute("mem");
			String email = member.getMem_email();
			
			
			String hot = service.myHotService(email);
			
			System.out.println("찜목록 입장 hot: "+hot);
			if(hot != null ) {
				hot = hot.substring(hot.indexOf(",")+1);
				String hotArray [] = hot.split(",");
				List<Integer> list = new ArrayList<Integer>();
				for(String hotStr :hotArray) {
					list.add(Integer.parseInt(hotStr));
				}
				int count = list.size();
				pagingVo.setTotal(count);
				HashMap<String, Object> hm = new HashMap<String, Object>();
				hm.put("start", pagingVo.getStart());
				hm.put("last", pagingVo.getLast());
				hm.put("list", list); 
				List<HashMap<String, Object>>map = service.recentListPrintService(hm);
		
				//System.out.println("월세:"+map.get(0).get("MONTHLY")+", 전세:"+map.get(0).get("LEASE")+", 보증금:"+map.get(0).get("DEPOSIT"));
				for(int i=0; i<map.size(); i++) {
					if(map.get(i).get("ROOMTITLE").toString().length() > 23) {
						String roomTitle = map.get(i).get("ROOMTITLE").toString().substring(0, 22)+"...";
						map.get(i).put("ROOMTITLE", roomTitle);
						//System.out.println("Xxxx: "+ roomTitle);
					}
				}
				
				for(int i=0; i<map.size(); i++) {
					String [] picPath = map.get(i).get("PICPATH").toString().split(",");
					map.get(i).put("PICPATH", picPath[0]);
				}
				System.out.println("찜한방 에서 list.size(): "+list.size()+", index: "+pagingVo.getIndex()+", pageStartNum: "+pagingVo.getPageStartNum()+
						", pageLastNum: "+pagingVo.getPageLastNum()+", listCnt: "+pagingVo.getListCnt()+", listCnt: "+pagingVo.getLast()+", total: "+pagingVo.getTotal());
				
				
				mv.addObject("map", map);
				mv.addObject("flag", 1);
				mv.addObject("count", count);
				mv.addObject("page", pagingVo);
				return mv;
			}else {
				System.out.println("찜한방 클릭시 찜한방 없음");
				return mv;
			}
		}
		return mv;	
	}
	
	/*관심목록 - 최근 본 방 클릭시*/
	@RequestMapping(value="house/recentRoom.do", method=RequestMethod.POST)	
	public ModelAndView recentRoom(PagingVo pagingVo, HttpSession session) {
		ModelAndView mv = new ModelAndView("jsonView");
		if(session.getAttribute("mem") != null) {
			MainDTO member = (MainDTO)session.getAttribute("mem");
			String email = member.getMem_email();
			String recent = service.myRecentService(email);
			
			System.out.println("관심목록 입장 recent: "+recent);
			if(recent != null ) {
				recent = recent.substring(recent.indexOf(",")+1);
				String recentArray [] = recent.split(",");
				List<Integer> list = new ArrayList<Integer>();
				for(String recentStr :recentArray) {
					list.add(Integer.parseInt(recentStr));
				}
				int count = list.size();
				pagingVo.setTotal(count);
				HashMap<String, Object> hm = new HashMap<String, Object>();
				hm.put("start", pagingVo.getStart());
				hm.put("last", pagingVo.getLast());
				hm.put("list", list); 
				List<HashMap<String, Object>>map = service.recentListPrintService(hm);
		
				//System.out.println("월세:"+map.get(0).get("MONTHLY")+", 전세:"+map.get(0).get("LEASE")+", 보증금:"+map.get(0).get("DEPOSIT"));
				for(int i=0; i<map.size(); i++) {
					if(map.get(i).get("ROOMTITLE").toString().length() > 23) {
						String roomTitle = map.get(i).get("ROOMTITLE").toString().substring(0, 22)+"...";
						map.get(i).put("ROOMTITLE", roomTitle);
						//System.out.println("Xxxx: "+ roomTitle);
					}
				}
				
				for(int i=0; i<map.size(); i++) {
					String [] picPath = map.get(i).get("PICPATH").toString().split(",");
					map.get(i).put("PICPATH", picPath[0]);
				}
				mv.addObject("flag", 2);
				mv.addObject("map", map);
				mv.addObject("count", count);
				mv.addObject("page", pagingVo);
				return mv;
			}else {
				System.out.println("최근 본방 없음");
				return mv;
			}
		}else {
			mv.addObject("flag", 1);
			return mv;
		}
			
	}
	/////// 여기서부터 오토 컴플릿 관련 검색 메서드 /////////
	@RequestMapping(value="house/serchAuto.do", method=RequestMethod.POST)
	public @ResponseBody List<BuildDTO>serchAuto( @RequestParam("writer") String address) {
		List<BuildDTO> serchAddress = service.mySerchAutoService(address);
		return serchAddress;
	}
	
	@RequestMapping(value="house/searchAddress.do", method=RequestMethod.POST)
	public @ResponseBody BuildDTO searchAddress( @RequestParam("address") String address) {
		List<BuildDTO> searchLatLng = service.mySearchAddressService(address);
		BuildDTO build = searchLatLng.get(0);
		return build;
	}
	
	@RequestMapping(value="house/areaSearch.do", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Double> areaSearch( @RequestParam("address") String address) {
		ModelAndView mv = new ModelAndView();
		List<BuildDTO> searchLatLng = service.mySearchAreaService(address);
		System.out.println("#######: "+searchLatLng.size());
		double lat = 0.0;
		double lng = 0.0;
		for(int i=0; i<searchLatLng.size(); i++) {
			lat += searchLatLng.get(i).getLat();
			lng += searchLatLng.get(i).getLng();
		}
		System.out.println("#######: "+Double.parseDouble(searchLatLng.size()+""));
		lat = lat/Double.parseDouble(searchLatLng.size()+"");
		lng = lng/Double.parseDouble(searchLatLng.size()+"");
		System.out.println("평균좌표 lat: "+lat+", 평균좌표 lng:"+lng);
		HashMap<String, Double>hm = new HashMap<String, Double>();
		hm.put("lat", lat);
		hm.put("lng", lng);
		return hm;
	}
	
	

}


