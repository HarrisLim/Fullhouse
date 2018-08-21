package com.team.station4.manageroom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.main.model.MainDTO;
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
	int estateNo = -1;
	int memNo = -1;
	String type = "";
	
	public void whoIs(HttpSession session) {
		estateNo=-1; memNo=-1; type=""; // clear
		
		type = (String)session.getAttribute("type");
		if(type!=null) {
			if(type.equals("mem")) {
				MainDTO seMemberDTO = (MainDTO)session.getAttribute("mem");
				System.out.println("seMemberDTO: "+ seMemberDTO);
				if(seMemberDTO.getMem_email().equals("harris@gmail.com")||seMemberDTO.getMem_email().equals("plannist@naver.com")) return; // admin일 때, 
				memNo = seMemberDTO.getMem_no();
			}else { // type == "staff"
				StaffDTO seStaffDTO = (StaffDTO)session.getAttribute("st");
				estateNo = seStaffDTO.getEstate_no();
			}	
		}
	}
	
	@RequestMapping(value="house/manageroom.do", method=RequestMethod.GET)
	public ModelAndView manageroom(PagingVo pagingVo, HttpSession session) {
		
		// 매물관리
		ModelAndView mv = new ModelAndView();

		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("start", pagingVo.getStart());
		hm.put("last", pagingVo.getLast());
		
		whoIs(session);
		
		mv.setViewName("house/manageroom");
		buildDTO.setEstate_no(estateNo);
		buildDTO.setMem_no(memNo);
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
		int count = 0;
		if(estateNo==-1 && memNo==-1) count = mService.countBuildAllService();
		else count = mService.countBuildService(hm); // 이거 동적으로 가져오게 하자.
			
		pagingVo.setTotal(count);
		
		
		// 직원관리 
		List<StaffDTO> staffList = sfService.estateSelectService(estateNo); 
		for(StaffDTO s: staffList) s.setSt_name(s.getSt_name().substring(2)); // 이름 앞에 있는 프로토콜 제거
		
		mv.addObject("requestList", getBuildRequestList(estateNo));
		mv.addObject("type", type);
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
	public ModelAndView deleteBuild(@RequestBody Map<String, Object> arr, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> hm = new HashMap<String, Object>();
		
		mv.setViewName("jsonView");
		if(mapList!=null) mapList.keySet().removeAll(set);
		if(buildList!=null) buildList.removeAll(buildList);
		if(set!=null) set.removeAll(set);
		
		whoIs(session);
		
		System.out.println("testtest: "+estateNo+", "+memNo);
		buildDTO.setMem_no(memNo);
		buildDTO.setEstate_no(estateNo);
		PagingVo pagingVo = new PagingVo();
		
		if(arr.get("index")!=null) pagingVo.setIndex((Integer)arr.get("index"));
		if(arr.get("pageStartNum")!=null) pagingVo.setPageStartNum((Integer)arr.get("pageStartNum"));

		hm.put("buildDTO", buildDTO);
		hm.put("start", pagingVo.getStart());
		hm.put("last", pagingVo.getLast());

//		System.out.println("start: "+ pagingVo.getStart());
//		System.out.println("last: "+ pagingVo.getLast());
//		System.out.println("clickedState: "+ arr.get("clickedState"));
//		System.out.println("hot: "+ arr.get("hot"));
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
		
		int count = 0;
		if(estateNo==-1 && memNo==-1) count = mService.countBuildAllService();
		else count = mService.countBuildService(hm); // 이거 동적으로 가져오게 하자.
		pagingVo.setTotal(count);
		
		for(int i=0; i<buildList.size(); i++) {
			buildDTO.setBuild_no(buildList.get(i).getBuild_no());
			List<PriceDTO> priceList = mrService.mrPriceSelectService(buildDTO);
			mapList.put(buildList.get(i), priceList);
			set.add(buildList.get(i));
		}
		
		
		if(estateNo==-1&&memNo==-1) {
			System.out.println("hihihi");
			if(mapList!=null) mapList.keySet().removeAll(set);
			if(buildList!=null) buildList.removeAll(buildList);
			if(set!=null) set.removeAll(set);
			
			hm.put("buildDTO", buildDTO);
			buildList = mService.selectBuildAllService(hm); 
			mapList = new HashMap<BuildDTO, List<PriceDTO>>();
			Set<BuildDTO> set = new HashSet<BuildDTO>();
			
			// buildList하나당 price가 여러개니까 2차원배열을 사용해서 jsp로 데이터전송, 인접리스트같은 느낌으로 넣었다. 
			for(int i=0; i<buildList.size(); i++) {
				buildDTO.setBuild_no(buildList.get(i).getBuild_no());
				List<PriceDTO> priceList = mrService.mrPriceSelectService(buildDTO);
				System.out.println("priceList: "+priceList.size());
				mapList.put(buildList.get(i), priceList);
				set.add(buildList.get(i));
			}
		}
		
		
		mv.addObject("type", type);
		mv.addObject("mapList", mapList);
		mv.addObject("count", count);
		mv.addObject("buildList", buildList);
		mv.addObject("pagingVo", pagingVo);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="house/updateverify.do", method=RequestMethod.POST)
	public ModelAndView updateVerify(@RequestParam("st_no") int st_no, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		sfService.verifyUpdateService(st_no);
		
		whoIs(session);
		
		List<StaffDTO> staffList = sfService.estateSelectService(estateNo);
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
	public ModelAndView doneCall(@RequestParam("request_no") int request_no, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mService.deleteRequestDoneCallService(request_no);
		
		whoIs(session);

		mv.setViewName("jsonView");
		mv.addObject("requestList", getBuildRequestList(estateNo));
		
		return mv;
	}
	
	
	List<Map<String, Object>> getBuildRequestList(int estate_no){
		List<BuildDTO> buildRequestList = mService.selectBuildRequestService(estate_no);
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

