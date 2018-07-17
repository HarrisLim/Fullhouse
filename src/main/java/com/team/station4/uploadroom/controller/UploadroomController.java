package com.team.station4.uploadroom.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.station4.HomeController;

@Controller
public class UploadroomController {

	// private static final Logger logger = LoggerFactory.getLogger(UploadroomController.class);
	
	@RequestMapping(value="house/uploadroom.do", method=RequestMethod.GET)
	public String uploadroom() {
		return "house/uploadroom";
	}
}
