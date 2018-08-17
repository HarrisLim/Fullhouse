package com.team.station4.auth;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.station4.main.model.MainDTO;
import com.team.station4.main.model.service.MainService;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.staff.model.service.StaffService;

@Controller
public class authController {
	
	@Autowired MainService mainService;
	@Autowired StaffService staffService;
	
	@RequestMapping(value = "/house/login.do", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session, Model model,
		@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout) {
		ModelAndView mv = new ModelAndView();
		if (error != null) {
			mv.addObject("error", "Invalid username and password!");
		}
		if (logout != null) {
			mv.addObject("msg", "You've been logged out successfully.");
		}
		
		UserDetails userDetail = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String ab = userDetail.getUsername();
		
		System.out.println("ab : " + ab);
		MainDTO mem = mainService.getUsersByID(ab); 
		if( mem != null ) {
			session.setAttribute("mem", mem);
			model.addAttribute("mem", mem);
			session.setAttribute("type", "mem");
		}
		if( mem == null ) {
			StaffDTO st = staffService.getUsersByID(ab);
			System.out.println("st : " + st.getSt_name());
			session.setAttribute("st", st);
			model.addAttribute("st", st);
			session.setAttribute("type", "staff");
		}
		mv.setViewName("house/main");
		return mv;
	}
	@RequestMapping(value = "/house/fails.do", method = RequestMethod.GET)
	public ModelAndView fails() {
		System.out.println("로그인 실패 fails");
		ModelAndView mv = new ModelAndView();
		int flag = 3;
		mv.addObject("flag" , flag );
		mv.setViewName("house/main");
		return mv;
		
	}
	@RequestMapping(value = "/house/fails2.do", method = RequestMethod.GET)
	public ModelAndView fails2() {
		ModelAndView mv = new ModelAndView();
		System.out.println( "로그인이 필요한 서비스 입니다." );
		int count = 2;
		
		mv.addObject("count", count);
		mv.setViewName("house/main");
		return mv;
	}
	
	
	
}

