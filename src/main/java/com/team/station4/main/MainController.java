package com.team.station4.main;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.station4.main.model.MainDTO;
import com.team.station4.main.model.service.MainService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	@Autowired
	MainService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
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
	@RequestMapping(value = "house/logIn.do", method = {RequestMethod.GET , RequestMethod.POST} )
	public String logIn() {
		return "house/main";
	}
}