package com.team.station4.admin.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.manageroom.service.ManageroomService;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.model.service.MapService;
import com.team.station4.map.vo.PagingVo;
import com.team.station4.qna.model.QnaDTO;
import com.team.station4.qna.model.service.QnaService;
import com.team.station4.uploadroom.model.PriceDTO;

@Controller
public class AdminController {
	@Autowired
	QnaService qnaService;
	@Autowired
	MapService mapService;
	@Autowired
	ManageroomService mrService;

	@RequestMapping(value = "house/admin.do", method = RequestMethod.GET)
	public ModelAndView manageroom(PagingVo pagingVo) {
		ModelAndView mv = new ModelAndView();
		Calendar oCalendar = Calendar.getInstance();
		mv.setViewName("house/admin");
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("done", 0);
		List<QnaDTO> qnaList = qnaService.selectQnaAllService(map); // 완료 안된 애들먼저 뿌리기.
		
		// 매출현황 (그래프)
		Map<String, Object> buildGMap = new HashMap<String,Object>();
		
		Map<String, Object> buildPieMap = new HashMap<String,Object>();
		int[] buildPie = new int[3];
		for(int i=0; i<3; i++) {
			buildPieMap.put("type", i);
			buildPie[i] = mapService.selectBuildPieService(buildPieMap);
		}
		
		Map<String, Object> buildBarMap = new HashMap<String,Object>();
		int[] buildBar = new int[7];
		for(int i=0; i<7; i++) {
			buildBarMap.put("type", i); 
			buildBar[i] = mapService.selectBuildBarService(buildBarMap);
		}
		
		Map<String, Object> buildLineMap = new HashMap<String,Object>();
		int[][] buildLine = new int[17][(oCalendar.get(Calendar.MONTH) + 1)];
		for(int i=0; i<17; i++) {
			buildLineMap.put("type", i);
			for(int j=0; j<(oCalendar.get(Calendar.MONTH) + 1); j++) {
				buildLineMap.put("month", j);
				buildLine[i][j] = mapService.selectBuildLineService(buildLineMap);
			}
		}
		
			// 매출현황
		// 년 바 
		Map<String, Object> buildBarYearMap = new HashMap<String,Object>();
		int[] buildBarYear = new int[3];
		for(int i=0; i<3; i++) {
			buildBarYearMap.put("type", i);
			buildBarYear[i] = mapService.selectBuildBarYearService(buildBarYearMap); // 년 
		}
		// 월 바 
		Map<String, Object> buildBarMonthMap = new HashMap<String,Object>();
		int[] buildBarMonth = new int[(oCalendar.get(Calendar.MONTH) + 1)]; // 현재 달까지 뽑기위해 
		for(int i=0; i<(oCalendar.get(Calendar.MONTH) + 1); i++) {
			buildBarMonthMap.put("type", i);
			buildBarMonth[i] = mapService.selectBuildBarMonthService(buildBarMonthMap); // 월 
		}
		// 일 바 
		// buildBar로 써도 돼. 똑같아 

		// 연도 꺽은선 
		Map<String, Object> buildLineYearMap = new HashMap<String,Object>();
		int[][] buildLineYear = new int[17][3];
		for(int i=0; i<17; i++) {
			buildLineYearMap.put("type",  i);
			for(int j=0; j<3; j++) {
				buildLineYearMap.put("year",  j);
				buildLineYear[i][j] = mapService.selectBuildLineYearService(buildLineYearMap); // 년
			} 
		}
		// 웗별 꺽은선 - buildLine을 사용
		
		// 일별 꺽은선 
		Map<String, Object> buildLineDayMap = new HashMap<String,Object>();
		int[][] buildLineDay = new int[17][7];
		for(int i=0; i<17; i++) {
			buildLineDayMap.put("type",  i);
			for(int j=0; j<7; j++) {
				buildLineDayMap.put("day",  j);
				buildLineDay[i][j] = mapService.selectBuildLineDayService(buildLineDayMap); // 년
			} 
		}
		
		/* 매물관리 */
		Map<String, Object> buildMMap = new HashMap<String,Object>();
		BuildDTO buildDTO = new BuildDTO();
		
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("start", pagingVo.getStart());
		hm.put("last", pagingVo.getLast());
		
		
		hm.put("buildDTO", buildDTO);
		List<BuildDTO> buildList = mapService.selectBuildAllService(hm); 
		HashMap<BuildDTO, List<PriceDTO>> mapList = new HashMap<BuildDTO, List<PriceDTO>>();
		Set<BuildDTO> set = new HashSet<BuildDTO>();
		
		// buildList하나당 price가 여러개니까 2차원배열을 사용해서 jsp로 데이터전송, 인접리스트같은 느낌으로 넣었다. 
		for(int i=0; i<buildList.size(); i++) {
			buildDTO.setBuild_no(buildList.get(i).getBuild_no());
			List<PriceDTO> priceList = mrService.mrPriceSelectService(buildDTO);
			System.out.println("priceList: "+priceList.size());
			mapList.put(buildList.get(i), priceList);
			set.add(buildList.get(i));
		}
		
		int count = mapService.countBuildAllService(); // 이거 동적으로 가져오게 하자. 
		pagingVo.setTotal(count);
		
		buildGMap.put("buildPie",  buildPie);
		buildGMap.put("buildBar",  buildBar);
		buildGMap.put("buildLine",  buildLine);
		buildGMap.put("buildBarYear", buildBarYear);
		buildGMap.put("buildBarMonth", buildBarMonth);
		buildGMap.put("buildBarDay", buildBar);
		buildGMap.put("buildLineYear", buildLineYear);
		buildGMap.put("buildLineDay", buildLineDay);
		
		
		mv.addObject("buildGMap", buildGMap);
		mv.addObject("qnaList", qnaList);
		mv.addObject("buildList", buildList);
		mv.addObject("count", count);
		mv.addObject("mapList", mapList);
		mv.addObject("page", pagingVo);
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "house/selectqna.do", method = RequestMethod.POST)
	public ModelAndView selectQna(@RequestParam("done") int done) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("done", done);
		List<QnaDTO> qnaList = qnaService.selectQnaAllService(map);
		System.out.println("qnaList.size(): "+ qnaList.get(0).getQna_rdate());
		mv.addObject("qnaList", qnaList);

		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "house/updateqna.do", method = RequestMethod.POST)
	public int updateQna(@RequestParam("qna_no") int qna_no, @RequestParam("reply") String reply) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qna_no", qna_no);
		map.put("reply", reply);
		qnaService.updateReplyService(map);
		return 1;
	}
}