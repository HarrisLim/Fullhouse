package com.team.station4.map.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;


import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.model.service.MapService;
import com.team.station4.map.vo.PagingVo;
import com.team.station4.uploadroom.model.PriceDTO;

@Controller
public class MapController {
	@Autowired
	private MapService service;
	Map<String, Object>jsonLatLng = null;
	
	/* 방검색 페이지 표시  */
	@RequestMapping(value = "house/map.do", method= RequestMethod.GET)
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

		List<BuildDTO> list =service.mapListService(hm);
		//List<PriceDTO> priceList = new ArrayList<PriceDTO>();
		HashMap<BuildDTO, List<PriceDTO>> priceMap = new HashMap<BuildDTO, List<PriceDTO>>();
		int count = service.countClusterService(hm);
		pagingVo.setTotal(count);
		
		for(int i=0; i<list.size(); i++) {
			String [] picPath = list.get(i).getPicPath().split(",");
			list.get(i).setPicPath(picPath[0]);
		}

		for(BuildDTO dto : list) {
			List<PriceDTO> price =  service.priceSelectService(dto);
			priceMap.put(dto, price);
			System.out.println("priceList내용: "+price.get(0).getBuild_no()+", deposit: "+price.get(0).getDeposit()+", monthly: "+price.get(0).getMonthly()+", lease: "+price.get(0).getLease());
		}
		
		
	
		mv.setViewName("house/map");
		mv.addObject("priceMap", priceMap);
		mv.addObject("count", count);
		mv.addObject("list", list);
		mv.addObject("page", pagingVo);
		return mv;
	}
	
	/* 방검색 리스트+paging ajax 표시 */
	@RequestMapping(value="house/indexJson.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView indexJson(@RequestBody Map<String, Object> jsonLatLng) {
		this.jsonLatLng = jsonLatLng;
		System.out.println("jsonLatLng:index: "+jsonLatLng.get("index")+", pageStartNum: "+jsonLatLng.get("pageStartNum"));
		System.out.println("jsonLatLng:south: "+jsonLatLng.get("south")+", north: "+jsonLatLng.get("north")+", east: "+jsonLatLng.get("east")+", west: "+jsonLatLng.get("west"));
		System.out.println("jsonLatLng:buildType: "+jsonLatLng.get("buildType")+", kind_of_trade: "+jsonLatLng.get("kind_of_trade")+", proType: "+jsonLatLng.get("proType"));
		System.out.println("jsonLatLng:parking: "+jsonLatLng.get("parking")+", animal: "+jsonLatLng.get("animal")+", startFloor: "+jsonLatLng.get("startFloor")+", endFloor: "+jsonLatLng.get("endFloor")+", startArea: "+jsonLatLng.get("startArea")+", endArea: "+jsonLatLng.get("endArea"));
		System.out.println("jsonLAtLng:flag: "+jsonLatLng.get("flag"));
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
				
			List<BuildDTO> list =service.mapListService(jsonLatLng);
			for(int i=0; i<list.size(); i++) {
				String [] picPath = list.get(i).getPicPath().split(",");
				list.get(i).setPicPath(picPath[0]);
			}

			HashMap<BuildDTO, List<PriceDTO>> priceMap = new HashMap<BuildDTO, List<PriceDTO>>();  
			for(BuildDTO dto : list) {
				List<PriceDTO>price = service.priceSelectService(dto);
				priceMap.put(dto, price);
			} 
			
			
			pagingVo.setTotal(service.countClusterService(jsonLatLng));
			System.out.println("pagingVo.getPageLastNum: "+pagingVo.getPageLastNum());
			mv.addObject("list", list);
			mv.addObject("priceMap", priceMap);
			mv.addObject("pagingVo", pagingVo);
			//mapClusterer(jsonLatLng);
			return mv;
		//flag 1 은 방검색 페이지 - 찜한방 제이슨 데이터 처리	
		}else if(flag == 1){
			ModelAndView mv = new ModelAndView("jsonView");
			
			PagingVo pagingVo = new PagingVo();
			pagingVo.setIndex((Integer)jsonLatLng.get("index"));
			pagingVo.setPageStartNum((Integer)jsonLatLng.get("pageStartNum"));
			
			jsonLatLng.put("start", pagingVo.getStart());
			jsonLatLng.put("last", pagingVo.getLast());
			List<Integer> listHot = new ArrayList<Integer>();
			String hot = service.myHotService();
			String [] hotArray = hot.split(",");
			for(String hotStr : hotArray) {
				if(hotStr.length() != 0) {
					listHot.add(Integer.parseInt(hotStr));
				}
			}
			jsonLatLng.put("list", listHot);
			int total = listHot.size();
			pagingVo.setTotal(total);
			System.out.println("파스인트된 flag 찜목록: "+flag+", index: "+pagingVo.getIndex()+", pageStartNum: "+pagingVo.getPageStartNum()+", pageLastNum: "+pagingVo.getPageLastNum()+", total: "+pagingVo.getTotal());
			List<BuildDTO>list = service.hotListServicePaging(jsonLatLng);
			for(int i=0; i<list.size(); i++) {
				String [] picPath = list.get(i).getPicPath().split(",");
				list.get(i).setPicPath(picPath[0]);
			}

			HashMap<BuildDTO, List<PriceDTO>> priceMap = new HashMap<BuildDTO, List<PriceDTO>>();  
			for(BuildDTO dto : list) {
				List<PriceDTO>price = service.priceSelectService(dto);
				priceMap.put(dto, price);
			} 

			mv.addObject("list", list);
			mv.addObject("priceMap", priceMap);
			mv.addObject("pagingVo", pagingVo);
			return mv;
		//flag 2 은 방검색 페이지 - 최근 본 방 제이슨 데이터 처리
		}else {
			ModelAndView mv = new ModelAndView("jsonView");
			
			PagingVo pagingVo = new PagingVo();
			pagingVo.setIndex((Integer)jsonLatLng.get("index"));
			pagingVo.setPageStartNum((Integer)jsonLatLng.get("pageStartNum"));
			
			jsonLatLng.put("start", pagingVo.getStart());
			jsonLatLng.put("last", pagingVo.getLast());
			List<Integer> listRecent = new ArrayList<Integer>();
			String recent = service.myRecentService();
			String [] recentArray = recent.split(",");
			for(String recentStr : recentArray) {
				if(recentStr.length() != 0) {
					listRecent.add(Integer.parseInt(recentStr));
				}
			}
			jsonLatLng.put("list", listRecent);
			int total = listRecent.size();
			pagingVo.setTotal(total);
			System.out.println("파스인트된 flag 관심목록: "+flag+", index: "+pagingVo.getIndex()+", pageStartNum: "+pagingVo.getPageStartNum()+", pageLastNum: "+pagingVo.getPageLastNum()+", total: "+pagingVo.getTotal());
			List<BuildDTO>list = service.hotListServicePaging(jsonLatLng);
			for(int i=0; i<list.size(); i++) {
				String [] picPath = list.get(i).getPicPath().split(",");
				list.get(i).setPicPath(picPath[0]);
			}

			HashMap<BuildDTO, List<PriceDTO>> priceMap = new HashMap<BuildDTO, List<PriceDTO>>();  
			for(BuildDTO dto : list) {
				List<PriceDTO>price = service.priceSelectService(dto);
				priceMap.put(dto, price);
			} 
			mv.addObject("list", list);
			mv.addObject("priceMap", priceMap);
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
	public void heart(@RequestParam("seq") int buildNo ) {
		System.out.println("하트추가 인입");
		int count = service.memHotSelectService(buildNo);
		System.out.println("buildNo: "+buildNo+", count: "+count);
		if(count != 1) {
			service.memHotUpdateService(buildNo); //하트 추가
			System.out.println("하트추가: "+service.myHotService());
		}else {
			service.memHotDeleteService(buildNo); //하트 삭제
			System.out.println("하트삭제: "+service.myHotService());
		}
	}
	
	/*build list - 목록 클릭 (최근 본 페이지) 추가*/
	@RequestMapping(value="house/recentList.do", method=RequestMethod.POST)	
	public void recentList(@RequestParam("seq") String buildNo ) {
		String recent = service.myRecentService();
		System.out.println("최근본 페이지 추가 인입 리센트 확인: "+recent+", 빌드번호 확인: "+buildNo);
		//recentList 목록이 있는지 검사 0이면 최근본목록 없으니 그냥 등록 1이면 최근본목록+ 추가로 본목록, 추가로 본 목록이 최근목록에 있으면 recent는 기존 목록처리
		int count = service.memRecentSelectService(buildNo);
		if (count < 1) {
			service.memRecentUpdateService(","+buildNo);
			recent = service.myRecentService();
		}else {
			if(recent.contains(buildNo)) {
				System.out.println("리센트에 내가 선택한 빌드번호가 있으면: "+recent);
			}else {
				service.memRecentUpdateService(recent+","+buildNo);
				recent = service.myRecentService();
				System.out.println("리센트에 내가 선택한 빌드번호가 없으면: "+recent);
			}
		}
		String recentArray[] = recent.split(",");
		if(recentArray.length > 10) {
			//두번째 , indexOf 까지 substring 하고 최근 본 목록 다시 저장
			String reRecent = recent.substring(recent.indexOf(",", 2));
			reRecent = reRecent+","+buildNo;
			service.memRecentUpdateService(reRecent); //최근본 방 업데이트
			System.out.println("최근 본방 업데이트 10개 이상 등록: "+reRecent);
		}
		System.out.println("최근 본방 업데이트 등록 recent: "+recent+", count: "+count);
	}
	
	////////////////// map.do 끝 ////////////////////////////////////
	
	/* 관심목록 페이지 표시(최근 본 방)  */
	@RequestMapping(value="house/myMap.do")
	public ModelAndView myMap(PagingVo pagingVo) {
		System.out.println("관심목록 입장");
		ModelAndView mv = new ModelAndView();
		Map<String, Object> hm = new HashMap<String, Object>();
		List<BuildDTO> list = new ArrayList();
		
		String recent = service.myRecentService();
		if(recent != null ) {
			String [] hotSplit = recent.split(",");
			for(String hs : hotSplit) {
				//System.out.println("hs: "+hs+", hs.length: "+hs.length());
				if(hs.length() > 0) {
					list.add(service.recentListService(Integer.parseInt(hs)));
				}
			}
			int total = list.size();
			System.out.println("list: "+list);
			for(int i=0; i<list.size(); i++) {
				String [] picPath = list.get(i).getPicPath().split(",");
				list.get(i).setPicPath(picPath[0]);
			}

			HashMap<BuildDTO, List<PriceDTO>> priceMap = new HashMap<BuildDTO, List<PriceDTO>>();  
			for(BuildDTO dto : list) {
				List<PriceDTO>price = service.priceSelectService(dto);
				priceMap.put(dto, price);
			}
			mv.setViewName("house/myMap");
			mv.addObject("priceMap", priceMap);
			mv.addObject("total", total);
			mv.addObject("list", list);
			mv.addObject("page", pagingVo);
			return mv;
		}else {
			System.out.println("최근 본방 없음");
			return mv;
		}
	}

	/* 마커 생성(관심목록-0, 찜한방-1)  */
	@RequestMapping(value="house/mapMarker.do", method=RequestMethod.POST)
	public ModelAndView mapMaeker(@RequestBody Map<String, Object>map) {
		ModelAndView mv = new ModelAndView("jsonView");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		ArrayList<HashMap> list = new ArrayList<HashMap>();
		int flag = (Integer)map.get("flag");
		
		if(flag == 0) {
			System.out.println("flag 관심목록: "+flag);
			String recent = service.myRecentService();
			if(recent != null) {
				String [] recentSplit = recent.split(",");
				for(String resultRecent : recentSplit) {
					if(resultRecent.length() > 0) {
						BuildDTO dto = service.recentListService(Integer.parseInt(resultRecent));
						hm.put("lat", dto.getLat());
						hm.put("lng", dto.getLng());
						list.add(hm);
					}
					if(hm.size() == 2) {
						hm = new HashMap<String, Object>();
					}
				}
				mv.addObject("positions", list);
				return mv;
			}else {
				System.out.println("관심목록 없음");
				return mv;
			}
		}else {
			System.out.println("flag 찜한 방: "+flag);
			String hot = service.myHotService();
			if(hot != null) {
				String [] hotSplit = hot.split(",");
				for(String resultHot : hotSplit) {
					if(resultHot.length() > 0) {
						BuildDTO dto = service.hotListService(Integer.parseInt(resultHot));
						hm.put("lat", dto.getLat());
						hm.put("lng", dto.getLng());
						list.add(hm);
					}
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
		
	/*관심목록 - 찜한 방 클릭시*/
	@RequestMapping(value="house/heartRoom.do", method=RequestMethod.POST)	
	public ModelAndView heartRoom(@RequestParam("email") String email, PagingVo pagingVo) {
		ArrayList<Integer> BuildNumlist = new ArrayList<Integer>();
		HashMap<String, Object>hm = new HashMap<String, Object>();
		ModelAndView mv = new ModelAndView("jsonView");
		String hot = service.myHotService();
		System.out.println("찜한방 입장: "+email+"hot: "+hot);
		if(hot != null) {
			String [] hotSplit = hot.split(",");
			for(String hs : hotSplit) {
				System.out.println("hs: "+hs);
				if(hs.length() > 0) {
					BuildNumlist.add(Integer.parseInt(hs));
				}
			}
			int total = BuildNumlist.size();
			hm.put("list", BuildNumlist);
			hm.put("start", pagingVo.getStart());
			hm.put("last", pagingVo.getLast());
			List<BuildDTO> list = service.hotListServicePaging(hm);
			for(int i=0; i<list.size(); i++) {
				String [] picPath = list.get(i).getPicPath().split(",");
				list.get(i).setPicPath(picPath[0]);
			}

			pagingVo.setTotal(total);
			System.out.println("찜한방 에서 list.size(): "+list.size()+", index: "+pagingVo.getIndex()+", pageStartNum: "+pagingVo.getPageStartNum()+", pageLastNum: "+pagingVo.getPageLastNum()+", listCnt: "+pagingVo.getListCnt()+", listCnt: "+pagingVo.getLast());
			
			HashMap<BuildDTO, List<PriceDTO>> priceMap = new HashMap<BuildDTO, List<PriceDTO>>();  
			for(BuildDTO dto : list) {
				List<PriceDTO>price = service.priceSelectService(dto);
				priceMap.put(dto, price);
			}
			mv.addObject("priceMap", priceMap);
			mv.addObject("total", total);
			mv.addObject("list", list);
			mv.addObject("page", pagingVo);
			return mv;
		}else {
			System.out.println("찜한방 클릭시 찜한방 없음");
			return mv;
		}
	}
	
	/*관심목록 - 최근 본 방 클릭시*/
	@RequestMapping(value="house/recentRoom.do", method=RequestMethod.POST)	
	public ModelAndView recentRoom(@RequestParam("email") String email, PagingVo pagingVo) {
		
		List<BuildDTO> list = new ArrayList();
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> hm = new HashMap<String, Object>();
		
		String recent = service.myRecentService();
		System.out.println("관심목록 클릭: "+email+"recent: "+recent);
		if(recent != null) {
			String [] recentSplit = recent.split(",");
			for(String hs : recentSplit) {
				System.out.println("hs: "+hs);
				if(hs.length() > 0) {
					BuildDTO dto = service.recentListService(Integer.parseInt(hs));
					list.add(dto);
				}
			}
			for(int i=0; i<list.size(); i++) {
				String [] picPath = list.get(i).getPicPath().split(",");
				list.get(i).setPicPath(picPath[0]);
			}

			int total = list.size();
			pagingVo.setTotal(total);
			
			System.out.println("관심목록-최근본방 클릭: list: "+list+"list.size(): "+list.size());
			mv.addObject("total", total);
			mv.addObject("list", list);
			mv.addObject("page", pagingVo);
			return mv;
		}else {
			System.out.println("관심목록-최근본방 클릭, 최근본방 없음");
			return mv;
		}
	}
	
	//////////////// myMap.do 끝(관심목록) ///////////////////////////////////
	/* 검색 list 목록 클릭시 방 상세 정보페이지 표시 */
	@RequestMapping(value="house/room.do")
	public ModelAndView roomContent(@RequestParam("buildNo")int buildNo) {
		System.out.println("room.do인입");
		ModelAndView mv = new ModelAndView();
		String view = "house/room";
		BuildDTO dto = service.recentListService(buildNo);

		List<PriceDTO> price = service.priceSelectService(dto);

		String [] picPath = dto.getPicPath().split(",");
		for(int i=0; i<picPath.length; i++) {
			System.out.println("picPath[]: "+picPath[i]);
		}
		mv.setViewName(view);
		mv.addObject("picPath", picPath);
		mv.addObject("dto", dto);
		mv.addObject("list", price);
		System.out.println("priceMap: "+price.get(0).getDeposit()+", size: "+price.size());
		return mv;
	}
	
	
	
	
	
	
		
	/* 방추가 페이지 */
	@RequestMapping(value="house/testInjection.do")
	public String test() {
		return "house/testInjection";
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
		int max = service.myMaxService();
		
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
			
			String picPath = "../kanu/roomimg/"+(ran.nextInt(10)+1)+".jpeg,../kanu/roomimg/"+(ran.nextInt(10)+1)
					+".jpeg,../kanu/roomimg/"+(ran.nextInt(10)+1)+".jpeg,../kanu/roomimg/"+(ran.nextInt(10)+1)+".jpeg,../kanu/roomimg/"+(ran.nextInt(10)+1)
					+".jpeg,../kanu/roomimg/"+(ran.nextInt(10)+1)+".jpeg,../kanu/roomimg/"+(ran.nextInt(10)+1)+".jpeg";
			
			dto = new BuildDTO(addressList.get(i), ran.nextInt(4)+1,  propertyStr, ran.nextInt(20)+1, ran.nextInt(20)+1, 121.1, 100.8, ran.nextInt(100), 
					picPath, "2018년 3월 5일", locationLat.get(i), locationLng.get(i), roomTitle, explainText, "2번째 매물 등록", ran.nextInt(4)+1, sqlDate, 1, 1);
			service.insertInjectionService(dto);
			System.out.println("lat:"+locationLat.get(i)+", lng:"+locationLng.get(i));
			
			
		}
		//insert price 
		int count = service.countService();
		
		for (int i=0; i<count-max; i++) {
			price = new HashMap<String, Object>();
			price.put("lease", ran.nextInt(90000)+1000);
			price.put("monthly", ran.nextInt(200)+10);
			price.put("deposit", ran.nextInt(50000)+500);
			price.put("build_no", (max+1)+i);
			System.out.println("lease: "+price.get("lease")+", monthly: "+price.get("monthly")+", deposit: "+price.get("deposit")+", build_no: "+price.get("build_no"));
			service.insertPriceService(price);
			
		}
		
		//insert addInfo
		for (int i=0; i<count-max; i++) {
			HashMap<String, Object>addInfo = new HashMap<String, Object>();
			addInfo.put("costfee", ran.nextInt(300000));
			addInfo.put("internet", ran.nextInt(2));
			addInfo.put("cost_tv", ran.nextInt(2));
			addInfo.put("cleanfee", ran.nextInt(2));
			addInfo.put("waterfee", ran.nextInt(2));
			addInfo.put("gas", ran.nextInt(2));
			addInfo.put("electricity", ran.nextInt(2));
			addInfo.put("parking", ran.nextInt(2));
			addInfo.put("elevator", ran.nextInt(2));
			addInfo.put("heat", ran.nextInt(2));
			addInfo.put("animal", ran.nextInt(2));
			addInfo.put("aircon", ran.nextInt(2));
			addInfo.put("washing", ran.nextInt(2));
			addInfo.put("bed", ran.nextInt(2));
			addInfo.put("desk", ran.nextInt(2));
			addInfo.put("closet", ran.nextInt(2));
			addInfo.put("option_tv", ran.nextInt(2));
			addInfo.put("shoerack", ran.nextInt(2));
			addInfo.put("fridge", ran.nextInt(2));
			addInfo.put("gasstove", ran.nextInt(2));
			addInfo.put("induction", ran.nextInt(2));
			addInfo.put("microwave", ran.nextInt(2));
			addInfo.put("doorlock", ran.nextInt(2));
			addInfo.put("bidet", ran.nextInt(2));
			addInfo.put("build_no", (max+1)+i);
			service.InsertAddInfoService(addInfo);
		}
		
		return "redirect:testInjection.do";
	}
	


	
}














