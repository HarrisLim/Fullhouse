package com.team.station4.manageroom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.manageroom.service.ManageroomService;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.model.service.MapService;
import com.team.station4.map.vo.PagingVo;
import com.team.station4.room.model.RequestDTO;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.staff.model.service.StaffService;
import com.team.station4.uploadroom.model.PriceDTO;
import com.team.station4.uploadroom.model.service.UploadroomService;

@Controller
public class ManageroomController {
	@Autowired
	private ManageroomService mrService;
	@Autowired
	private MapService mService;
	@Autowired
	private StaffService sfService;
	
	private BuildDTO buildDTO = new BuildDTO();
	HashMap<BuildDTO, List<PriceDTO>> mapList = new HashMap<BuildDTO, List<PriceDTO>>();
	Set<BuildDTO> set = new HashSet<BuildDTO>();
	List<BuildDTO> buildList;
	
	@RequestMapping(value="house/manageroom.do", method=RequestMethod.GET)
	public ModelAndView manageroom(PagingVo pagingVo) {
		
		// 매물관리
		ModelAndView mv = new ModelAndView();

		Map<String, Object> hm = new HashMap<String, Object>();
		System.out.println("111: " + pagingVo.getStart());
		System.out.println("222: " + pagingVo.getLast());
		hm.put("start", pagingVo.getStart());
		hm.put("last", pagingVo.getLast());
		
		mv.setViewName("house/manageroom");
		int estateNo = 1; // 일단 1로 셋팅해놓자. 로그인 세션이 될 때까지.
		buildDTO.setEstate_no(estateNo);
		hm.put("buildDTO", buildDTO);
		buildList = mrService.mrBuildSelectService(hm);
		
		// buildList하나당 price가 여러개니까 2차원배열을 사용해서 jsp로 데이터전송, 인접리스트같은 느낌으로 넣었다. 
		for(int i=0; i<buildList.size(); i++) {
			buildDTO.setBuild_no(buildList.get(i).getBuild_no());
			List<PriceDTO> priceList = mrService.mrPriceSelectService(buildDTO);
			System.out.println("priceList: "+priceList.size());
			mapList.put(buildList.get(i), priceList);
			set.add(buildList.get(i));
		}
		
		int count = mService.countBuildService(hm); // 이거 동적으로 가져오게 하자. 
		pagingVo.setTotal(count);
		
		
		// 직원관리 
		List<StaffDTO> staffList = sfService.estateSelectService(estateNo); // 아직은 estateNo은 임시로. 세션받으면 그 때 처리하자.
		for(StaffDTO s: staffList) s.setSt_name(s.getSt_name().substring(2)); // 이름 앞에 있는 프로토콜 제거
		
		mv.addObject("requestList", getBuildRequestList(estateNo));		
		mv.addObject("staffList", staffList);
		mv.addObject("buildList", buildList);
		mv.addObject("count", count);
		mv.addObject("mapList", mapList);
		mv.addObject("page", pagingVo);
		return mv;
	}

	/* 매물수정 ajax */
	@ResponseBody
	@RequestMapping(value="house/updateprivatememo.do", method=RequestMethod.POST)
	public int updatePrivateMemo(@RequestBody Map<String, Object> map) {
		mrService.mrPrivateMemoUpdateService(map);
		return 1;
	}
	
	/* 매물삭제 ajax */
	@ResponseBody
	@RequestMapping(value="house/deletebuild.do", method=RequestMethod.POST)
	public int deleteBuild(@RequestParam("build_no") int build_no) {
		System.out.println("build_no헤: "+ build_no);
		mrService.mrDeleteReservationService(build_no);
		mrService.mrDeletePriceService(build_no);
		mrService.mrDeleteRequestService(build_no);
		mrService.mrDeleteAddinfoService(build_no);
		mrService.mrDeleteBuildService(build_no);
		return 1;
	}
	
	/* 매물검색 ajax */
	@ResponseBody
	@RequestMapping(value="house/searchbuild.do", method=RequestMethod.POST)
	public ModelAndView deleteBuild(@RequestBody Map<String, Object> arr) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> hm = new HashMap<String, Object>();
		
		mv.setViewName("jsonView");
		if(mapList!=null) mapList.keySet().removeAll(set);
		if(buildList!=null) buildList.removeAll(buildList);
		if(set!=null) set.removeAll(set);
		
		int estateNo = 1; // 임시, 세션으로 받자. 
		buildDTO.setEstate_no(estateNo);
		PagingVo pagingVo = new PagingVo();
		
		if(arr.get("index")!=null) pagingVo.setIndex((Integer)arr.get("index"));
		if(arr.get("pageStartNum")!=null) pagingVo.setPageStartNum((Integer)arr.get("pageStartNum"));

		hm.put("buildDTO", buildDTO);
		hm.put("start", pagingVo.getStart());
		hm.put("last", pagingVo.getLast());

		System.out.println("start: "+ pagingVo.getStart());
		System.out.println("last: "+ pagingVo.getLast());
		System.out.println("clickedState: "+ arr.get("clickedState"));
		System.out.println("hot: "+ arr.get("hot"));
		hm.put("buildState", arr.get("clickedState"));
		
		String strValue = "";
		if(arr.get("hot")==null) arr.put("hot", "buildingTitle");
		if(arr.get("value")!=null) strValue = arr.get("value").toString();
		
		if(arr.get("hot").equals("buildingNo")) {
			hm.put("theNum", Integer.parseInt(strValue));
			buildDTO.setBuild_no(Integer.parseInt(strValue)); // 등록번호 검색
			buildList = mrService.mrSearchBuildNoSelectService(hm);
		}
		else if(arr.get("hot").equals("buildingTitle")) {
			hm.put("theTitle",strValue);
			buildDTO.setRoomTitle(strValue); // 제목 검색
			buildList = mrService.mrSearchBuildTitleSelectService(hm);
		}
		else {
			hm.put("theMemo",strValue);
			buildDTO.setPrivateMemo(strValue); // 메모검색 
			buildList = mrService.mrSearchBuildMemoSelectService(hm);
		}

		System.out.println("before buildList: ");
		for(BuildDTO s: buildList) {
			System.out.println("buildList: "+ s);
		}
		
		int count = mService.countBuildService(hm); // 이거 동적으로 가져오게 하자. 
		pagingVo.setTotal(count);
		for(int i=0; i<buildList.size(); i++) {
			buildDTO.setBuild_no(buildList.get(i).getBuild_no());
			List<PriceDTO> priceList = mrService.mrPriceSelectService(buildDTO);
			System.out.println("priceList: "+priceList.size());
			mapList.put(buildList.get(i), priceList);
			set.add(buildList.get(i));
		}
		mv.addObject("mapList", mapList);
		mv.addObject("count", count);
		mv.addObject("buildList", buildList);
		mv.addObject("pagingVo", pagingVo);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="house/updateverify.do", method=RequestMethod.POST)
	public ModelAndView updateVerify(@RequestParam("st_no") int st_no) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		sfService.verifyUpdateService(st_no);
		int estateNo = 1;
		List<StaffDTO> staffList = sfService.estateSelectService(estateNo); // 아직은 estateNo은 임시로. 세션받으면 그 때 처리하자.
		for(StaffDTO s: staffList) s.setSt_name(s.getSt_name().substring(2)); // 이름 앞에 있는 프로토콜 제거
		mv.addObject("staffList", staffList);
		return mv;
	}

	@ResponseBody
	@RequestMapping(value="house/deletestaff.do", method=RequestMethod.POST)
	public int deleteStaff(@RequestBody Map<String, Object> map) {
		List<BuildDTO> buildDeleteList = mService.selectDeleteListService(map);
		for(int i=0; i<buildDeleteList.size(); i++) {
			mService.deleteAddinfoService(buildDeleteList.get(i));
			mService.deletePriceService(buildDeleteList.get(i));
			mService.deleteRequestService(buildDeleteList.get(i));
			mService.deleteReservationService(buildDeleteList.get(i));
		}
		mService.deleteBuildingService(map);
		mService.deleteStaffService(map);
		return 1;
	}

	@ResponseBody
	@RequestMapping(value="house/donecall.do", method=RequestMethod.POST)
	public ModelAndView doneCall(@RequestParam("request_no") int request_no) {
		ModelAndView mv = new ModelAndView();
		mService.deleteRequestDoneCallService(request_no);
		int estateNo = 1;
		

		mv.setViewName("jsonView");
		mv.addObject("requestList", getBuildRequestList(estateNo));
		
		return mv;
	}
	
	
	List<Map<String, Object>> getBuildRequestList(int estate_no){
		List<BuildDTO> buildRequestList = mService.selectBuildRequestService(estate_no); // 아직은 estateNo은 임시로. 세션받으면 그 때 처리하자.
		List<Map<String, Object>> requestList = new ArrayList<Map<String, Object>>();
		for(int i=0; i<buildRequestList.size(); i++) {
			Map<String, Object> rMap = new HashMap<String, Object>();
			rMap.put("estate_no", estate_no);
			rMap.put("build_no", buildRequestList.get(i).getBuild_no());
			if(mService.selectRequestService(rMap)!=null)
				requestList.add(mService.selectRequestService(rMap));
		}
		return requestList;
	}
}

