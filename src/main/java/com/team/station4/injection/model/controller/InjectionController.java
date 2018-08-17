package com.team.station4.injection.model.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.injection.model.service.InjectionService;
import com.team.station4.map.model.BuildDTO;

@Controller
public class InjectionController {
	@Autowired
	InjectionService service;
	
	
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
