package com.team.station4.main;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.main.model.MainDTO;
import com.team.station4.main.model.service.MainService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	@Autowired
	MainService service;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "house/main.do", method = RequestMethod.GET)
	public String index() {
		return "house/main";
	}
	
	@RequestMapping(value = "house/myinfo.do", method = RequestMethod.GET)
	public String myinfo() {
		return "house/myinfo";
	}
	
	@RequestMapping(value = "house/memInsert.do", method = RequestMethod.POST)
	public String memInsert(MainDTO dto) {
		service.memberInsertS(dto);
		return "house/main";
	}
	
	@RequestMapping(value = "house/empwCheck.do", method = RequestMethod.POST)
	// 파라메터 세션과 모델 : 세션은 셋어트리뷰트 쓰려고, 모델은 뷰단으로 보내기 위해서
	public ModelAndView empwCheck(MainDTO dto, HttpSession session, Model model) {
		ModelAndView mv = new ModelAndView("jsonView");
		String memName = service.memNameS(dto);
		
		int count = 0;
		int emCheck = service.log1CheckS(dto); // 아이디 중첵
		
		if( emCheck == 0 ) count = 0; 
		if( emCheck == 1 ) {
			int pwCheck = service.log2CheckS(dto); // 비번 중첵
			/*if ( memName.length() == 0 ){
				memName = "게스트";
			}*/
				if( pwCheck == 0 ) count = 1;
				if( pwCheck == 1 ) count = 2;
		}
		
		//세션에 담다.
		session.setAttribute("memName", memName);
		//뷰단으로 세션값을 보낸다.
		model.addAttribute("memName", memName);
		
		System.out.println("sessionId: "+session.getAttribute("memName"));
		System.out.println("count : " + count);
		mv.addObject("count" ,  count);
		return mv;
	}
	
	@RequestMapping(value = "house/logIn.do", method = {RequestMethod.GET , RequestMethod.POST} )
	public String logIn() {
		return "house/main";
	}
	
	@RequestMapping(value = "house/emCheck.do", method = {RequestMethod.GET , RequestMethod.POST} )
	public ModelAndView emCheck(MainDTO dto) {
		
		System.out.println("Mem_email : "  + dto.getMem_email() );
		/*System.out.println("Mem_name : "  + dto.getMem_name() );
		System.out.println("Mem_phone : "  + dto.getMem_phone() );
		System.out.println("Mem_pw : "  + dto.getMem_pw() );*/
		
		ModelAndView mv = new ModelAndView();
		String email = service.emCheckS(dto);
		if(email == null) {
			System.out.println("비었따 ");
			email ="none";
		}
		System.out.println(" email : " + email);
		mv.addObject("email" , email);
		mv.setViewName("jsonView");
		return mv;
	}
	
}