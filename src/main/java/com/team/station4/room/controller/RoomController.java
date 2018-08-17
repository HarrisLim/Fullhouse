package com.team.station4.room.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.estate.model.EstateDTO;
import com.team.station4.main.model.MainDTO;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.room.model.service.RoomService;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;

@Controller
public class RoomController {
	
	@Autowired
	RoomService service;
	
	/*연락 요청 하기*/
	@RequestMapping(value="house/requestInsert.do", method=RequestMethod.POST)
	public ModelAndView requestInsert(@RequestParam("phone") String phone, @RequestParam("name") String name, @RequestParam("build_no") int build_no) {
		ModelAndView mv = new ModelAndView("jsonView");
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		name = name.substring(2);
		phone = phone.trim().substring(2);
		
		System.out.println("phone: "+phone+", name: "+name+", build_no: "+build_no);
		hm.put("phone", phone);
		hm.put("name", name);
		hm.put("build_no", build_no);
		int count = service.myRequestCountCheckService(hm);
		if(count < 1) {
			service.requestInsertService(hm);
		}else {
			System.out.println("이미 연락요청한 매물입니다.");
		}
		mv.addObject("requestCount", count);
		return mv;
	}
	
	/* 검색 list 목록 클릭시 방 상세 정보페이지 표시 */
	@RequestMapping(value="house/room.do")
	public ModelAndView roomContent(@RequestParam("buildNo")int buildNo, HttpSession session) {
	
		ModelAndView mv = new ModelAndView();
		String view = "house/room";
		BuildDTO dto = service.recentListService(buildNo);
		
		AddInfoDTO addDto = service.addInfoSelectService(buildNo);
		String costList = "";
		if(addDto.getInternet() == 1) costList +="인터넷,";
		if(addDto.getCost_tv() == 1) costList +="케이블TV,";
		if(addDto.getCleanFee() == 1) costList +="청소비,";
		if(addDto.getWaterFee() == 1) costList +="수도요금,";
		if(addDto.getGas() == 1) costList +="도시가스,";
		if(addDto.getInternet() == 1) costList +="전기세";
		
		Calendar cal = Calendar.getInstance();
		int sysDate = cal.get(cal.YEAR)+(cal.get(cal.MONTH)+1)+cal.get(cal.DATE);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		String [] moveDateArray = format.format(addDto.getMoveDate()).split("-");
		int year = Integer.parseInt(moveDateArray[0]);
		int month = Integer.parseInt(moveDateArray[1]);
		int day = Integer.parseInt(moveDateArray[2]);
		int moveDate = year + month + day;
		System.out.println("room.do인입: 변환된 moveDate: "+moveDate+", 현재날짜: "+sysDate);
		String movingDate = "";
		if(moveDate <= sysDate) {
			movingDate = "즉시 입주";
		}else {
			movingDate = format.format(addDto.getMoveDate());
		}
		
		
		if(dto.getMem_no() > 0) {
			MainDTO memDTO = service.memInfoService(dto.getMem_no());
			mv.addObject("memDTO", memDTO);
		}else if(dto.getSt_no() > 0) {
			StaffDTO staffDTO = service.staffInfoService(dto.getSt_no());
			EstateDTO estateDTO = service.estateInfoService(staffDTO.getEstate_no());
			mv.addObject("builderInfo", staffDTO);
			mv.addObject("estateInfo", estateDTO);
		}
		
		
		List<PriceDTO> price = service.priceSelectService(dto);

		String [] picPath = dto.getPicPath().split(",");
		for(int i=0; i<picPath.length; i++) {
			System.out.println("picPath[]: "+picPath[i]);
		}
		int heartCount = 0;
		int countViewCount = 0;
		int requestCount = 0;
		if(session.getAttribute("mem") != null) {
			HashMap<String, Object> hm = new HashMap<String, Object>();
			MainDTO sessionMem = (MainDTO)session.getAttribute("mem");
			String email = sessionMem.getMem_email();
			String phone = sessionMem.getMem_phone();
			System.out.println("mem_email: "+email+", mem_phone: "+phone);
			hm.put("build_no", buildNo);
			hm.put("email", email);
			hm.put("phone", phone);
			String heart = service.myHeartCountCheckService(hm);
			System.out.println("heart: "+heart);
			if(heart != null) {
				String [] heartList = heart.split(",");
				for(int i=0; i<heartList.length; i++) {
					if(heartList[i].length()>0 && Integer.parseInt(heartList[i]) == buildNo) {
						heartCount++;
					}
				}
			}
			countViewCount = service.myCountViewCountCheckService(hm);
			requestCount = service.myRequestCountCheckService(hm);
			
		}
		
		System.out.println("heartCount: "+heartCount+", countViewCount: "+countViewCount+", requestCount: "+requestCount);
		mv.setViewName(view);
		mv.addObject("heartCount", heartCount);
		mv.addObject("countViewCount", countViewCount);
		mv.addObject("requestCount", requestCount);
		mv.addObject("movingDate", movingDate); //입주가능일
		mv.addObject("picPath", picPath); //매물 사진
		mv.addObject("dto", dto); //building 정보
		mv.addObject("list", price); // 매물별 가격 정보
		mv.addObject("addInfo", addDto); // 매물별 info - option
		mv.addObject("costList", costList); // 매물별 info - costFee
		System.out.println("priceMap: "+price.get(0).getDeposit()+", size: "+price.size());
		return mv;
	}
	
	/* 매물 신고하기 */
	@RequestMapping(value="house/viewCount.do", method=RequestMethod.POST)
	public ModelAndView viewCount(@RequestParam("seq") int build_no) {
		ModelAndView mv = new ModelAndView("jsonView");
		int count = service.viewCountCheckService(build_no);
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("viewCount", count+1);
		hm.put("build_no", build_no);
		service.viewCountInsertService(hm);
		
		int flag = service.viewCountCheckService(build_no);
		mv.addObject("flag", flag);
		return mv;
	}
}
