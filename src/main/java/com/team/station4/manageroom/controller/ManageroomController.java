package com.team.station4.manageroom.controller;

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
import com.team.station4.uploadroom.model.PriceDTO;
import com.team.station4.uploadroom.model.service.UploadroomService;

@Controller
public class ManageroomController {
	@Autowired
	private ManageroomService mrService;
	@Autowired
	private MapService mService;
	
	private BuildDTO buildDTO = new BuildDTO();
	HashMap<BuildDTO, List<PriceDTO>> mapList = new HashMap<BuildDTO, List<PriceDTO>>();
	Set<BuildDTO> set = new HashSet<>();
	List<BuildDTO> buildList;
	
	@RequestMapping(value="house/manageroom.do", method=RequestMethod.GET)
	public ModelAndView manageroom(PagingVo pagingVo) {
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
		
//		System.out.println("mapList.size() : "+mapList.size());
//		System.out.println("buildList.size() : "+buildList.size());
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
	
	
}

